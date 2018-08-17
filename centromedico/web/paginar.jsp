<%--
    Document   : persona
    Created on : 09/04/2011, 08:47:59 AM
    Author     : ALUMNO
--%>

<%
String codigo = (String)session.getAttribute("codigo"); // recoge valor de la session
if (codigo==null){
    response.sendRedirect("index.jsp");
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <h2>Mantenimiento > Persona</h2>
    <hr/>
    <img src="images/persona.gif" width="10" height="10" />
    <a href="#" id="opcabecera" onClick="paginar();">Paginar Personas</a>
  
    <br /><br/>
    <div id="buscarpersona">
    </div><script>paginar();</script>
    </body>
</html>