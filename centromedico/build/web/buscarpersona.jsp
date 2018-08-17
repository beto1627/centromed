
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            String codigo = (String) session.getAttribute("codigo"); // recoge valor de la session
            if (codigo == null) {
                response.sendRedirect("index.jsp");
            }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<table id="formtablenuevo">
    <tr id="grid">
        <td id="formnuevo">Ingresar Apellidos</td>
        <td id="formnuevo">
            <input type="text" name="txtapellido" onkeyup="searchpersona();" id="txtapellido" class="cajas" size="40" />&nbsp;
            <input type="button" id="botonform" value="Buscar" onClick="searchpersona();">
        </td>
    </tr>
</table>

<div id="resultados"></div>