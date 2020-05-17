<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="Scripts/main.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Asiakkaan muuttaminen</title>
</head>
<body onkeydown="tutkiKey(event)"> <!-- mitä tää onkeydown tekee? onko aina kun jotain nappia näppäimistö painetaan, niin alkaa tekemään jotain? -->
<form id="tiedot">
	<table>
		<thead>	
			<tr>
				<th colspan="3" id="ilmo"></th>
				<th colspan="2" class="oikealle"><a href="listaaasiakkaat.jsp">Takaisin listaukseen</a></th>
			</tr>		
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sposti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td> 
				<td><input type="button" id="tallenna" value="Muuta" onclick="muutaTiedot()"></td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="asiakas_id" id="asiakas_id">
</form>
<span id="ilmo"></span>
</body>
<script>
function tutkiKey(event){
	if (event.keyCode==13){ //enterin painaminen, miksi just 13?
		muutaTiedot();
	}
}

document.getElementById("etunimi").focus(); //kursori etunimi kenttään sivun latauksen yhteydessä

//Haetaan muutettavan asiakkaan tiedot. Kutsutaan backEnd:n GET-metodia.
//GET  /asiakkaat/haeyksi/id
var asiakas_id = requestURLParam("asiakas_id"); //Funktio on main.js:ssä. Luetaan URL:sta asiakas_id requestURLParam-metodin avulla

	fetch("asiakkaat/haeyksi/"+ asiakas_id, {  //Kutsutaan asiakkaat servletin haeyksi get-metodia
		method:"GET"
	})
	
	.then(function(response){	//Odotetaan vastausta
		return response.json()	//Muutetaan vastaus json objektiksi
	})
	
	.then(function(responseJson){	//Otetaan vastaan objekti responseJson
		console.log(responseJson);	//tulostetaan responseJson parametri konsoliin
		document.getElementById("etunimi").value = responseJson.etunimi;	//katenoidaanko tässä arvot kenttiin?
		document.getElementById("sukunimi").value = responseJson.sukunimi;
		document.getElementById("puhelin").value = responseJson.puhelin;
		document.getElementById("sposti").value = responseJson.sposti;
		document.getElementById("asiakas_id").value = responseJson.asiakas_id;
		
	})



//funktio tietojen muuttamista varten. Kutsutaan backin POST-metodia ja välitetään kutsun mukana uudet tiedot json-stringinä.
//POST /asiakkaat/
function muutaTiedot(){	
	var ilmo="";
	
	if(document.getElementById("etunimi").value.length<2){
		
		ilmo="Etunimi on liian lyhyt.";
		//return ilmo; //miksi tähän ei tule return? perinteisessä tässä käytettiin returnia, että ohjelma tietää tämän kohdan läpikäydyksi.
	}	//vastaus ilmo asiaan lopussa
	else if(document.getElementById("sukunimi").value.length<3){
		
		ilmo="Sukunimi on liian lyhyt.";
		//return ilmo; // miksi tähän ei tule return? perinteisessä tässä käytettiin returnia, että ohjelma tietää tämän kohdan läpikäydyksi.
	}
	else if(document.getElementById("puhelin").value.length<6){
		ilmo="Puhelinnumero on liian lyhyt.";
		//return ilmo; //miksi tähän ei tule return? perinteisessä tässä käytettiin returnia, että ohjelma tietää tämän kohdan läpikäydyksi.
	}
	else if(document.getElementById("sposti").value.length<6){
		ilmo="Sähköpostiosoite on liian lyhyt.";
		//return ilmo; //miksi tähän ei tule return? perinteisessä tässä käytettiin returnia, että ohjelma tietää tämän kohdan läpikäydyksi.
	}
	if(ilmo!=""){
		document.getElementById("ilmo").innerHTML=ilmo;
		setTimeout(function(){document.getElementById("ilmo").innerHTML="";}, 3000);
		return; //return on vasta täällä, koska jos ilmo muuttuu kohtien läpikäynnin aikana joksikin eli ilmosta tulee eri kuin tyhjä, funktion lisaaTiedot suorittaminen loppuu ja toiminta hyppää tänne loppuun ja palauttaa ilmon (joka 3 sekunnin kuluttua katoaa)
	}
	
	document.getElementById("etunimi").value=siivoa(document.getElementById("etunimi").value); //siivoa()-metodi löytyy main.js:stä
	document.getElementById("sukunimi").value=siivoa(document.getElementById("sukunimi").value);
	document.getElementById("puhelin").value=siivoa(document.getElementById("puhelin").value);
	document.getElementById("sposti").value=siivoa(document.getElementById("sposti").value);
	
	var formJsonStr = formDataToJSON(document.getElementById("tiedot")); //muutetaan käyttäjän antamat (lomakkeen tiedot) json stringiksi
	//lähetetään muutetut tiedot backEndiin
	console.log(formJsonStr);
	
	fetch("asiakkaat", {  //kutsutaan asiakkaat servletin post-metodia
		method:"PUT", body:formJsonStr //bodyksi määritellään muuttuja formJsonStr
	})
	.then(function(response){ //odotetaan vastausta ja muutetaan vastaus Json objektiksi
		return response.json() //vastauksena tulee siis response 0 tai response 1
	})
	.then(function(responseJson){ //otetaan vastaan objekti responseJson parametrissa
		var vastaus = responseJson.response; // miksi tähän tulee responseJson:n jälkeen vielä kerran response?
		if(vastaus==0){
			document.getElementById("ilmo").innerHTML=("Asiakkaan tietojen muuttaminen epäonnistui.");
		}
		else if(vastaus==1){
			document.getElementById("ilmo").innerHtml=("Asiakkaan tietojen muuttaminen onnistui.");
		}
		
		setTimeout(function() { document.getElementById("ilmo").innerHTML=""; }, 5000);
	});
	
	document.getElementById("tiedot").reset(); //tyhjennetään lomakkeen "tiedot" tietokentät
}
</script>
</html>