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


%>

<select id="cboprovincia" name="cboprovincia" onchange="distritos('<%=depa%>');">

    <%


                Vector provincias = Sql.consulta("select cUbiIdProvincia,cUbiDescripcion from ubigeo where nPaiId=2241 and cUbiIdDepartamento='"+depa+"' and cUbiIdDistrito=0 and cUbiIdProvincia<>0");
                for (int fils = 1; fils < provincias.size(); ++fils) {
                    String[] unaFila = (String[]) provincias.get(fils);
    %>
    <option value="<%=unaFila[0]%>"><%=unaFila[1]%></option>
    <%}%>
</select>