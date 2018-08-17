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

<%
            String depa = request.getParameter("depa");
            String cboprovincia=request.getParameter("cboprovincia");

%>

<select id="cbodistrito" name="cbodistrito" >

    <%


                Vector distritos = Sql.consulta("select cUbiIdDistrito,cUbiDescripcion from ubigeo where nPaiId=2241 and cUbiIdDepartamento='"+depa+"' and cUbiIdProvincia='"+cboprovincia+"'");
                for (int fils = 1; fils < distritos.size(); ++fils) {
                    String[] unaFila = (String[]) distritos.get(fils);
    %>
    <option value="<%=unaFila[0]%>"><%=unaFila[1]%></option>
    <%}%>
</select>