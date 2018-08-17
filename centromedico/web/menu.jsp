<%@ page import="java.util.Vector, jdbc.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            String codigo = (String) session.getAttribute("codigo"); // recoge valor de la session
            if (codigo == null) {
                response.sendRedirect("index.jsp");
            }
%>
<H2>M&eacute;dico</H2>
<div id="menu">
    <ul class="level1">
        <%
            Vector oppadre = Sql.consulta("select op.nOpCodigo,op.cOpDescripcion,op.cOpRecurso "
            + " from opcion op inner join persona_opcion po on "
            + " op.nOpCodigo=po.nOpCodigo where po.nPerCodigo='"+codigo+"' "
            + " and po.nPerOpEstado=7 and op.nOpEstado=7 and nApCodigo=2 "
            + " and op.nOpDependencia=0");
            for (int fils = 1; fils < oppadre.size(); ++fils) {
                String[] unaFila = (String[]) oppadre.get(fils);
                String codigoop = unaFila[0];
        %>
        <li  class="fly"><a href="#" onclick="<%=unaFila[2]%>">-<%=unaFila[1]%></a>
            <ul>
                <%
            Vector ophijo = Sql.consulta("select op.nOpCodigo,op.cOpDescripcion,"
            + "op.cOpRecurso "
            + " from opcion op inner join persona_opcion po on "
            + " op.nOpCodigo=po.nOpCodigo where po.nPerCodigo='"+codigo+"' "
            + " and po.nPerOpEstado=7 and op.nOpEstado=7 and nApCodigo=2 "
            + " and op.nOpDependencia='"+codigoop+"'");
            for (int fils1 = 1; fils1 < ophijo.size(); ++fils1) {
                String[] unaFila1 = (String[]) ophijo.get(fils1);
             %>
                <li><a href="#" onclick="<%=unaFila1[2]%>"><%=unaFila1[1]%></a></li>
            <% }%>
            </ul>
        </li>
        <% }%>
    </ul>
</div>

