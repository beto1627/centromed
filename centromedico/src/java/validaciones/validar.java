/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package validaciones;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.*;
/**
 *
 * @author ALUMNO
 */
@WebServlet(name="validar", urlPatterns={"/validar"})
public class validar extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String usuario = request.getParameter("txtusuario");
            String clave = request.getParameter("txtclave");

            String[] datos = Sql.getFila("select per.nPerCodigo,per.cPerApellido,per.cPerNombre "
                    + " from usuario usu inner join persona per on usu.nPerCodigo=per.nPerCodigo  "
                    + " where usu.cPerUsuCodigo='"+usuario+"' and usu.cPerUsuClave='"+clave+"' "
                    + " and usu.nUsuEstado=7 and per.nPerEstado=7");
           
            if (datos==null){
                out.println("usuario o clave no existe");
            }else{
                String nombre = datos[2];
                String apellido = datos[1];
                String codigo = datos[0];
                HttpSession session = request.getSession(true); //declara la session
                session.setAttribute("codigo",codigo);
                session.setAttribute("nombre",nombre);
                session.setAttribute("apellido",apellido);
                out.println("<script>admin();</script>");
            }
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
