/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.34
 * Generated at: 2020-05-10 17:53:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class listaaasiakkaat_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"ISO-8859-1\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\">\r\n");
      out.write("<script src=\"Scripts/main.js\"></script>\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n");
      out.write("<title>Insert title here</title> \r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<table id=\"listaus\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<thead>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th colspan=\"6\" class=\"oikealle\"><span id=\"uusiAsiakas\">Lisää uusi asiakas</span></th>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t<th colspan=\"2\" class=\"oikealle\">Hakusana:</th>\r\n");
      out.write("\t\t<th colspan=\"3\"><input type=\"text\" id=\"hakusana\" size=\"30\"></th>\r\n");
      out.write("\t\t<th colspan=\"1\" class=\"oikealle\"><input type=\"button\" id=\"hae\" value=\"Hae\"></th>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>Asiakas_id</th>\r\n");
      out.write("\t\t\t\t<th>Etunimi</th>\r\n");
      out.write("\t\t\t\t<th>Sukunimi</th>\r\n");
      out.write("\t\t\t\t<th>Puhelin</th>\r\n");
      out.write("\t\t\t\t<th>Sposti</th>\r\n");
      out.write("\t\t\t\t<th>&nbsp;</th>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</thead>\r\n");
      out.write("\t<tbody>\r\n");
      out.write("\t\r\n");
      out.write("\t</tbody>\r\n");
      out.write("</table>\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("//tää on FrontEnd\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("$(document).ready(function(){ //mitä tämä funktio oikeastaan tekee?\r\n");
      out.write("\t\r\n");
      out.write("\t$(document.body).on(\"keydown\", function(event){  //event funktion toiminta??? Tutki.\r\n");
      out.write("\t\tif(event.which==13){ // enteriä painettu, ajetaan haku Tutki lisää event.which:iä. miksi ==13? Mistä tuo 13 tulee?\r\n");
      out.write("\t\t\thaeTiedot(); //kutsuu haeTiedot-metodia\r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#uusiAsiakas\").click(function(){ //klikkaus funktio. Käsitellään id=uusiAsiakas\r\n");
      out.write("\t\tdocument.location=\"lisaaasiakas.jsp\"; //klikkaamalla selaimessa kohtaa lisää uusi asiakas, siirrytään sivulle lisaaasiakas.jsp\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#hae\").click(function(){ //tässä sama kuin ylempänä, mutta id=hae ja klikkaus kutsuu haeTiedot-metodia.\r\n");
      out.write("\t\thaeTiedot(); \r\n");
      out.write("\t});\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t$(\"#hakusana\").focus(); //viedään kursori hakusana-kenttään sivun latauksen yhteydessä\r\n");
      out.write("\t\r\n");
      out.write("\thaeTiedot();\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\tfunction haeTiedot(){\r\n");
      out.write("\t\t$(\"#listaus tbody\").empty(); //?????miksi tässä käytetäänkin $.getJSON, eikä $.ajax niinkuin aiemmin ohjevideossa \"listaus\"? Vastaus: molemmat käy.\r\n");
      out.write("\t\t$.getJSON({url:\"asiakkaat/\"+$(\"#hakusana\").val(), type:\"GET\", datatype:\"json\", success: function(result){ //Funktio palauttaa tiedot json-objektina\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$.each(result.asiakkaat, function(i, field) {\r\n");
      out.write("\t\t\t\t\tvar htmlStr;\r\n");
      out.write("\t\t\t\t\thtmlStr+=\"<tr id='rivi_\"+field.asiakas_id+\"'>\";\r\n");
      out.write("\t\t\t\t\thtmlStr+=\"<td>\"+field.asiakas_id+\"</td>\";\r\n");
      out.write("\t\t\t\t\thtmlStr+=\"<td>\"+field.etunimi+\"</td>\"; //field viittaa ilmeisesti? DB:n taulun tietokenttään x, esim. field.etunimi viittaa etunimi kenttään\r\n");
      out.write("\t\t\t\t\thtmlStr+=\"<td>\"+field.sukunimi+\"</td>\";\r\n");
      out.write("\t\t\t\t\thtmlStr+=\"<td>\"+field.puhelin+\"</td>\";\r\n");
      out.write("\t\t\t\t\thtmlStr+=\"<td>\"+field.sposti+\"</td>\";\r\n");
      out.write("\t\t\t\t\thtmlStr+=\"<td><a href='muutaAsiakas.jsp?asiakas_id=\"+field.asiakas_id+\"'>Muuta</a>&nbsp;\"; //miksi ?-merkki eikä +-merkki muutaAsiakas.jsp:n ja asiakas_id:n välissä?\r\n");
      out.write("\t\t\t\t\thtmlStr+= \"<span class='poista' onclick=poista(\"+field.asiakas_id+\",'\"+field.etunimi+\"','\"+field.sukunimi+\"') >Poista</span></td>\";\r\n");
      out.write("\t\t\t\t\thtmlStr+=\"</tr>\";\r\n");
      out.write("\t\t\t\t\t$(\"#listaus tbody\").append(htmlStr);\t\t\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction poista(asiakas_id, etunimi, sukunimi){ // functiolle välitetään parametrit asiakas_id, etunimi, sukunimi, jotka tulee field:stä?\r\n");
      out.write("\t\tif (confirm(\"Poista asiakas \" + etunimi +\" \"+ sukunimi + \"?\")){ // confirm:lla luodaan  \"kyllä/ei\"-kysely laatikko selaimen puolelle?\r\n");
      out.write("\t\t\t$.getJSON({url:\"asiakkaat/\"+asiakas_id, type:\"DELETE\", datatype:\"json\", success: function (result){ // ei tarvita=> var formJsonStr = formDataJsonStr($(\"#tiedot\").serializeArray());, koska tiedot, jotka välitetään = simppelit, ei tarvi tehdä JsonObjektia!!! $.ajax({url: \"TÄHÄN SERVLETIN NIMI, JOLLE TIEDOT VÄLITETÄÄN/\"+TÄHÄN TIETO, JOKA VÄLITETÄÄN SERVLETILLE(tässä tiedon voi välittää suoraan, kun simppelissä muodossa jo valmiiksi. Siksi data:-kohta jää pois urlista), (eli tätä ei tässä tapauksessa tarvita=>data: TÄHÄN DATA, JOKA SERVLETILLE VÄLITETÄÄN(KTS. YLEMPI RIVI, JOSSA MUUTTUJAAN KIINNITETÄÄN KO.DATA)), type: \"TÄHÄN, MILLE SERVLETIN METODILLE TIEDOT VÄLITETÄÄN (GET, POST, PUT, DELETE)\"\", datatype: TÄHÄN DATAN TYYPPI, MINKÄLAISENA TIEDOT SERVLETILLE VÄLITETÄÄN success: PALAUTTAA TULOKSEN (result) (MISTÄ, mikä funktio?), JOKO 1 TAI 0, RIIPPUEN ONNISTUIKO LISÄYS?  }) \r\n");
      out.write("\t\t\t\tif (result.response==0){\r\n");
      out.write("\t\t\t\t\t$(\"#ilmo\").html(\"Asiakkaan poisto epäonnistui.\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\telse if (result.response==1){\r\n");
      out.write("\t\t\t\t\t$(\"#rivi_\"+asiakas_id).css(\"background-color\", \"red\");\r\n");
      out.write("\t\t\t\t\talert(\"Asiakkaan \" + etunimi +\" \"+ sukunimi +\" poisto onnistui.\");\r\n");
      out.write("\t\t\t\t\thaeTiedot();\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}});\r\n");
      out.write("\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
