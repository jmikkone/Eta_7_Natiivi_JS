<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

JavaServer Pages Standard Tag Library (JSTL)

<br>

<c:set var = "name" value = "<hr>"/>  <!-- c=core tagi ja t�tm� on tapa esitt�� muuttuja, muuttujan nimi on "name" ja arvo= "<hr>" -->
${name}  <!-- arvon tulostaminen sellaisenaan, eli tulostaa nyt selaimeen ${name} paikalle valuessa olevan arvon. T�ss� tapauksessa horisontaalisen viivan, ei <hr> merkkein�  -->
<c:out value = '${name}'/> <!-- arvon tulostaminen html-siivottuna, eli out poistaa html m��ritykset, jolloin selaimeen tulostuu <hr> merkkein�-->
<!-- eli on aina turvallisempaa tulostaa arvot c:out tagin kautta -->
<!-- c: viittaa sanaan core, eli jstl core tags -->
<!-- fn: viittaa sanaan function, eli jstl function tags -->
<!-- fmt: viittaa sanaan format, eli jstl formatting tags -->
<br><br>
<c:set var ="name1" value = "pelkk� <hr>, ei htlm m��rityksi�, eli sit� mit� <hr> tagi tarkoittaa => horisontaalista viivaa" />
<c:out value = '${name1 }' />

<br><br>

<a target = "_blank" href = "https://www.javatpoint.com/jstl-core-tags">JSTL Core Tags</a> <!-- linkki eli a tagi ja href -->

<br><br>

<c:import var = "data" url = "lisaaasiakas.jsp" /> <!-- jos backEnd on toteutettu restApi:na niin jstl:n import core tagilla voi suoraan k�yd� hakemassa GET metodilla, niinkuin sen hakisi ajax:n POST tai/vai/ja GET??? metodilla -->
<!-- Ongelman syy l�ytyi:t�� ei nyt jostain syyst� hae lisaaasiakas.jsp:n l�hde koodia, miss�h�n syy. Ei anna selaimeen edes herjaa??? Johtui siit�, ett� vaikka tuolla alemmalla rivill� on kommentti merkkien sis�ll� oma huomio tuo dollari hakasulkeet ja sis�ll� muuttujan nimi, niin yritti muuttaa sit�. Piti kirjoittaa merkit ennenkuin hyv�ksyi. Outoo, miks t�� v�litt�� kommenteista??? -->
<c:out value = "${data}" /> <!-- ei ole ilmeisesti v�li� onko <!--"dollari hakasulku muuttujan nimi hakasulku"--><!-- ymp�r�ity hipsuilla vai tupsuilla? ylemm�ss� esimerkiss� on hipsut ja t�ss� tupsut. -->
<!-- import siis hakee lisaaasiakas.jsp sivun metadatan ja sijoittaa sen tuohon data muuttujan tilalle -->

<br><br>

<c:set var = "tulot" value = "${1000*4}"/> <!-- set:ll� asetetaan -->
<c:if test = '${tulot > 3000}'> <!-- if:ll� tutkitaan -->
<p>Tuloni ovat: <c:out value = "${tulot}" /></p>  <!-- out:lla tulostetaan ulos selaimen puolelle -->
</c:if>  
<!-- if...else ...end if sijasta pit�isi k�ytt�� C:choose...c:when..c:when..c:otherwise../c:choose kiinni(end) -->
<!-- tai erillisi� c:if lausekkeita (ei else vaihtoehtoa) -->
<!-- tai kolmiosaista if-lausetta {ehto ? totta : ei totta} -->
<br>
<c:set value = "36" var = "num" />
<c:out value = "Numero ${num} on parillinen. ${num % 2 == 0 ? 'Totta.' : 'Ei totta.'}" />
<br>
<c:out value = "${tulot >= 5000 ? 'palkka v�hint��n 5000' : 'palkka alle 5000' }" />

<br><br>

<%

ArrayList<String> list = new ArrayList<String>(); //ArrayList
list.add("A");
list.add("B");	//arvoja ArrayListiin
list.add("C");
request.setAttribute("a_list", list); //a_list = muuttuja, johon list (joka on ArrayList arvoineen) setAttributella laitetaan

%>

<c:forEach items = "${a_list}" var = "listItem"> <!-- forEach luuppaa listan l�pi items on muuttuja, johon lista laitettiin ja var on muuttuja, johon t�ss� laitetaan luupattavan asian nimi  --> 
<c:out value = "${listItem}" /> <br /> <!-- t�ss� kirjoitetaan arvoja ulos. toi br vaihtaa rivi� aina kun yks arvo on kirjoitettu, eli arvot tulee selaimeen allekkain -->
</c:forEach>
</body>
</html>