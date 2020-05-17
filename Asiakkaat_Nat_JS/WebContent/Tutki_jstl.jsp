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

<c:set var = "name" value = "<hr>"/>  <!-- c=core tagi ja tätmä on tapa esittää muuttuja, muuttujan nimi on "name" ja arvo= "<hr>" -->
${name}  <!-- arvon tulostaminen sellaisenaan, eli tulostaa nyt selaimeen ${name} paikalle valuessa olevan arvon. Tässä tapauksessa horisontaalisen viivan, ei <hr> merkkeinä  -->
<c:out value = '${name}'/> <!-- arvon tulostaminen html-siivottuna, eli out poistaa html määritykset, jolloin selaimeen tulostuu <hr> merkkeinä-->
<!-- eli on aina turvallisempaa tulostaa arvot c:out tagin kautta -->
<!-- c: viittaa sanaan core, eli jstl core tags -->
<!-- fn: viittaa sanaan function, eli jstl function tags -->
<!-- fmt: viittaa sanaan format, eli jstl formatting tags -->
<br><br>
<c:set var ="name1" value = "pelkkä <hr>, ei htlm määrityksiä, eli sitä mitä <hr> tagi tarkoittaa => horisontaalista viivaa" />
<c:out value = '${name1 }' />

<br><br>

<a target = "_blank" href = "https://www.javatpoint.com/jstl-core-tags">JSTL Core Tags</a> <!-- linkki eli a tagi ja href -->

<br><br>

<c:import var = "data" url = "lisaaasiakas.jsp" /> <!-- jos backEnd on toteutettu restApi:na niin jstl:n import core tagilla voi suoraan käydä hakemassa GET metodilla, niinkuin sen hakisi ajax:n POST tai/vai/ja GET??? metodilla -->
<!-- Ongelman syy löytyi:tää ei nyt jostain syystä hae lisaaasiakas.jsp:n lähde koodia, missähän syy. Ei anna selaimeen edes herjaa??? Johtui siitä, että vaikka tuolla alemmalla rivillä on kommentti merkkien sisällä oma huomio tuo dollari hakasulkeet ja sisällä muuttujan nimi, niin yritti muuttaa sitä. Piti kirjoittaa merkit ennenkuin hyväksyi. Outoo, miks tää välittää kommenteista??? -->
<c:out value = "${data}" /> <!-- ei ole ilmeisesti väliä onko <!--"dollari hakasulku muuttujan nimi hakasulku"--><!-- ympäröity hipsuilla vai tupsuilla? ylemmässä esimerkissä on hipsut ja tässä tupsut. -->
<!-- import siis hakee lisaaasiakas.jsp sivun metadatan ja sijoittaa sen tuohon data muuttujan tilalle -->

<br><br>

<c:set var = "tulot" value = "${1000*4}"/> <!-- set:llä asetetaan -->
<c:if test = '${tulot > 3000}'> <!-- if:llä tutkitaan -->
<p>Tuloni ovat: <c:out value = "${tulot}" /></p>  <!-- out:lla tulostetaan ulos selaimen puolelle -->
</c:if>  
<!-- if...else ...end if sijasta pitäisi käyttää C:choose...c:when..c:when..c:otherwise../c:choose kiinni(end) -->
<!-- tai erillisiä c:if lausekkeita (ei else vaihtoehtoa) -->
<!-- tai kolmiosaista if-lausetta {ehto ? totta : ei totta} -->
<br>
<c:set value = "36" var = "num" />
<c:out value = "Numero ${num} on parillinen. ${num % 2 == 0 ? 'Totta.' : 'Ei totta.'}" />
<br>
<c:out value = "${tulot >= 5000 ? 'palkka vähintään 5000' : 'palkka alle 5000' }" />

<br><br>

<%

ArrayList<String> list = new ArrayList<String>(); //ArrayList
list.add("A");
list.add("B");	//arvoja ArrayListiin
list.add("C");
request.setAttribute("a_list", list); //a_list = muuttuja, johon list (joka on ArrayList arvoineen) setAttributella laitetaan

%>

<c:forEach items = "${a_list}" var = "listItem"> <!-- forEach luuppaa listan läpi items on muuttuja, johon lista laitettiin ja var on muuttuja, johon tässä laitetaan luupattavan asian nimi  --> 
<c:out value = "${listItem}" /> <br /> <!-- tässä kirjoitetaan arvoja ulos. toi br vaihtaa riviä aina kun yks arvo on kirjoitettu, eli arvot tulee selaimeen allekkain -->
</c:forEach>
</body>
</html>