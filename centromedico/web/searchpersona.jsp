<%
            String codigo = (String) session.getAttribute("codigo"); // recoge valor de la session
            if (codigo == null) {
                response.sendRedirect("index.jsp");
            }
%>
<%@ page import="java.util.Vector, jdbc.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<table id="formtablenuevo">
    <tr>
        <td id="formcabecera">APELLIDOS</td>
        <td id="formcabecera">NOMBRES</td>
    </tr>


    <%
                String apellido = request.getParameter("apellido");

                Vector personas = Sql.consulta("select nPerCodigo,cPerNombre,cPerApellido from persona where cPerApellido like'%"+apellido+"%'");
                for (int fils = 1; fils < personas.size(); ++fils) {
                    String[] unaFila = (String[]) personas.get(fils);
    %>


    <tr id="grid">
        <td id="formnuevo"><%=unaFila[2]%></td>
        <td id="formnuevo"><%=unaFila[1]%></td>
    </tr>

    <%}%>
</table>