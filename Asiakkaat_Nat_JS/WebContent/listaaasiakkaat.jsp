
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="Scripts/main.js"></script>

<title>Asiakkaat ohjelma/listaa asiakkaat</title> 
<style>
.oikealle{
text-align:right;
}
</style>
</head>
<body onkeydown="tutkiKey(event)">
<table id="listaus">
	<thead>
		<tr>
			<th colspan="4" id="ilmo" ></th>
			<th colspan="2"><a id="uusiAsiakas" href="lisaaasiakas.jsp">Lisää uusi asiakas</a></th>
		</tr>
			
		<tr>
		<th class="oikealle">Hakusana:</th>
		<th colspan="3"><input type="text" id="hakusana"></th>
		<th colspan="3"><input type="button" id="hae" value="Hae" onclick="haeTiedot()"></th>
		</tr>
			<tr>
				<th>Asiakas_id</th>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sposti</th>
				<th>&nbsp;</th>
			</tr>
		</thead>
	<tbody id="tbody">
	</tbody >
</table>
<script>

haeTiedot(); //kutsutaan haeTiedot funktiota kun body ajetaan
document.getElementById("hakusana").focus(); //focus vie kursorin kentän alkuun odottamaan

function tutkiKey(event){
	if (event.keyCode==13){
		haeTiedot();
	}
}

//funktio tietojen hakemiseen
//GET  /asiakkaat/{hakusana}

function haeTiedot(){
	document.getElementById("tbody").innerHTML=""; //alustettu tyhjäksi?
		fetch("asiakkaat/" + document.getElementById("hakusana").value, {
			method:'GET' //skandit ei kulje urlissa oikein, mutta postilla ei toimi.
			}) //kutsutaan asiakkaat servlettia? ja kiinnitetään polun perään hakusana. Lähetetään backEnd:in.
																		//valuen jälkeisestä pilkusta alkaa objekti tai avain-arvopari. Kutsuu asiakkaat GET:iä
			.then(function(response) { //odotetaan vastausta ja muutetaan JSON-vastaus objektiksi
			return response.json()	//miksi tässä ei ole perässä puolipistettä?
		})
			.then (function(responseJson){  //otetaan vastaan objekti response.json parametrissa	
				var asiakkaat=responseJson.asiakkaat;
				var htmlStr="";
				for (var i=0;i<asiakkaat.length;i++){
					htmlStr+="<tr>";
					htmlStr+="<td>"+asiakkaat[i].asiakas_id+"</td>";
					htmlStr+="<td>"+asiakkaat[i].etunimi+"</td>";
					htmlStr+="<td>"+asiakkaat[i].sukunimi+"</td>";
					htmlStr+="<td>"+asiakkaat[i].puhelin+"</td>";
					htmlStr+="<td>"+asiakkaat[i].sposti+"</td>";
					htmlStr+="<td><a href='muutaAsiakas.jsp?asiakas_id="+asiakkaat[i].asiakas_id+"'>Muuta</a>&nbsp;";
					htmlStr+="<span class='poista' onclick=poista("+asiakkaat[i].asiakas_id+",'"+asiakkaat[i].etunimi+"','"+asiakkaat[i].sukunimi+"')>Poista</span></td>";
					htmlStr+="</tr>";				
				}
				document.getElementById("tbody").innerHTML = htmlStr;
			})
}
 //funktio asiakkaan poistamiseen
 function poista(asiakas_id, etunimi, sukunimi){
	 if (confirm("Poista asiakas " + asiakas_id +" "+ etunimi +" "+ sukunimi + "?")){
		 fetch("asiakkaat/" + asiakas_id, {
			 method:"DELETE"
		 })
		 .then(function (response) {
			 return response.json() //miksi tässä ei ole perässä puolipistettä?
		 })
		 .then (function (responseJson){
			 var vastaus = responseJson.response;
			 if (vastaus==0){
				 document.getElementById("ilmo").innerHTML="Asiakkaan poistaminen epäonnistui";
			 }
			 else if (vastaus==1){
				 document.getElementById("ilmo").innerHTML="Asiakkaan "+asiakas_id+" " +etunimi+" "+sukunimi+ " poistaminen onnistui";
				 haeTiedot();
			 }
			 setTimeout(function() {document.getElementById("ilmo").innerHTML="";}, 5000); // ekana oleva juttu tehdään, tokana olevan ajan kuluttua. Tässä ilmoitus katoaa 5 s kuluttua
		 })
	 }
 }
</script>
</body>
</html>