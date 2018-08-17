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

<script>
    $(document).ready(function(){
        $('.date-pick').datePicker
        ({startDate:'1950-01-01'});
    });
</script>

<table id="formtablenuevo">
    <tr id="grid">
        <td id="formnuevo">NOMBRES</td>
        <td id="formnuevo"><input type="text" name="txtnombre" id="txtnombre"></td>

    </tr>

    <tr id="grid">
        <td id="formnuevo">APELLIDOS</td>
        <td id="formnuevo"><input type="text" name="txtapellidos" id="txtapellidos"></td>

    </tr>

    <tr id="grid">
        <td id="formnuevo">NACIMIENTO</td>
        <td id="formnuevo"><input type="text" class="date-pick" name="txtfecha" id="txtfecha"></td>

    </tr>

    <tr id="grid">
        <td id="formnuevo">DIRECCION</td>

        <td id="formnuevo">
            <div id="depas">
                <select id="cbodepa" name="cbodepa" onchange="provincia();">

                    <%


                                Vector depas = Sql.consulta("select cUbiIdDepartamento, cUbiDescripcion from ubigeo where nPaiId=2241 and cUbiIdProvincia=0 and cUbiIdDistrito=0");
                                for (int fils = 1; fils < depas.size(); ++fils) {
                                    String[] unaFila = (String[]) depas.get(fils);
                    %>
                    <option value="<%=unaFila[0]%>"><%=unaFila[1]%></option>
                    <%}%>
                </select>
            </div>
            <div id="provincia">
                <select id="cboprovincia" name="cboprovincia" >


                    <option value="">Seleccione provincia</option>

                </select>
            </div>
            <div id="distrito">
                <select id="cbodistrito" name="cbodistrito">


                    <option value="">Seleccione ditrito</option>

                </select>
            </div>
            <input type="text" name="txtdirecicon" id="txtdireccion">
        </td>

    </tr>

    <tr id="grid">
        <td id="formnuevo">DOCUMENTO</td>
        <td id="formnuevo">
            <select name="cbotipodoc" id="cbotipodoc">
                <%


                            Vector documento = Sql.consulta("select nConClase, cConDescripcion from constante where nConClase=4");
                            for (int fils = 1; fils < documento.size(); ++fils) {
                                String[] unaFila = (String[]) documento.get(fils);
                %>
                <option value="<%=unaFila[0]%>"><%=unaFila[1]%></option>
                <%}%>
            </select>
            <input type="text" name="txtdocumento" id="txtdocumento">
        </td>

    </tr>

     <tr id="grid">
        <td id="formnuevo">TELEFONO</td>
        <td id="formnuevo">
            <select name="cbotipotel" id="cbotipotel">
                <%


                            Vector telefono= Sql.consulta("select nConClase,cConDescripcion from constante where nConClase=3");
                            for (int fils = 1; fils < telefono.size(); ++fils) {
                                String[] unaFila = (String[]) telefono.get(fils);
                %>
                <option value="<%=unaFila[0]%>"><%=unaFila[1]%></option>
                <%}%>
            </select>
            <input type="text" name="txttelefono" id="txttelefono">
        </td>

    </tr>
</table>

<input type="button" id="botonform" value="Guardar Persona" onClick="insertarper();">