<%
            String codigo = (String) session.getAttribute("codigo"); // recoge valor de la session
            if (codigo == null) {
                response.sendRedirect("index.jsp");
            }
%>

<%@ page import="java.util.Vector, jdbc.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

            out.println("<table class='formtablenuevo' border='1'>");
            out.println("tr");
            out.println("<th>CODIGO</th>");
            out.println("<th>NOMBRE</th>");
            out.println("<th>APELLIDOS</th>");
            out.println("</tr>");
            out.println("<tbody>");

            int RegistrosAMostrar = 10;
            int PaginasIntervalo = 3;
            int RegistrosAEmpezar = 0;
            int PagAct = 1;
            String pag = request.getParameter("pag");

            if (pag == null || pag == "") {
                RegistrosAEmpezar = 1;
                PagAct = 1;
            } else {
                RegistrosAEmpezar = (Integer.valueOf(pag).intValue() - 1) * RegistrosAMostrar;
                PagAct = Integer.valueOf(pag).intValue();

            }
%>

<%


            Vector personas = Sql.consulta("select nPerCodigo,cPerApellido,cPerNombre from personas limit '" + RegistrosAEmpezar + "','" + RegistrosAMostrar + "'");

            for (int fils = 1; fils < personas.size(); ++fils) {

                String[] unaFila = (String[]) personas.get(fils);
%>
<tr id="grid">
    <td id="formnuevo"><%=unaFila[0]%></td>
    <td id="formnuevo"><%=unaFila[1]%></td>
    <td id="formnuevo"><%=unaFila[2]%></td>
</tr>

<%}%>

<%
            String NroRegistros = Sql.getCampo("select count(*) as total form persona");
            int PagAnt = PagAct - 1;
            int PagSig = PagAct + 1;

            double PagUlt = Integer.valueOf(NroRegistros).intValue() / RegistrosAMostrar;
            //verificamos residuo para ver si llevmoas decimales

            int Res = Integer.valueOf(NroRegistros).intValue() % RegistrosAMostrar;
            //si hay residuo usamos funcion floor   que me
            //devuelva la parte entera, sin redondear y lse subimos
            //una unidad para obtener laultima pagina

            if (Res > 0) {
                PagUlt = Math.floor(PagUlt) + 1;
            }

            out.println("</tbody>");
            out.println("</table><br />");
            //desplazamiento

            if(PagAct>(PaginasIntervalo+1)){
                out.println("<a onclick=listado('1'); class='paginador'><<Primero</a>");
                out.println("&nbsp;");
                }
            for(int i=(PagAct-PaginasIntervalo);i<=(PagAct-1);i++){
                if(i>=1){
                    out.println("<a onclick=\"listado('"+i+"')\"class='paginador'>"+i+"</a>");
                    out.println("&nbsp;");
                    }
            }
            out.println("<span class='paginadoractivo'>"+PagAct+"</span>");
            out.println("");


%>