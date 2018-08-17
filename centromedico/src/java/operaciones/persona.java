/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package operaciones;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.*;
/**
 *
 * @author ALUMNO
 */
@WebServlet(name = "persona", urlPatterns = {"/persona"})
public class persona extends HttpServlet {

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

            String txtnombre = request.getParameter("txtnombre");
            String txtapellidos = request.getParameter("txtapellidos");
            String txtfecha = request.getParameter("txtfecha");
            String cbodepa = request.getParameter("txtnombre");
            String cboprovincia = request.getParameter("cboprovincia");
            String cbodistrito = request.getParameter("cbodistrito");
            String txtdireccion = request.getParameter("txtdireccion");
            String cbotipodoc = request.getParameter("cbotipodoc");
            String txtdocumento = request.getParameter("txtdocumento");
            String cbotipotel = request.getParameter("cbotipotel");
            String txttelefono = request.getParameter("txtelefono");
            String accion =request.getParameter("accion");
            String randomnumber=request.getParameter("randomnumber");

            if(accion.compareTo("INS")==0){
                String persona="insert into persona(cPerApellido,cPerNombre,dPerNacimiento,cPerRnd) values('"+txtapellidos+"','"+txtnombre+"','"+txtfecha+"','"+randomnumber+"')";
                Sql.ejecuta(persona);

                String nPerCodigo=Sql.getCampo("Select nPerCodigo from persona where cPerRnd='"+randomnumber+"'");

                String documento="insert into documento (nPerCodigo,nDocTipo,cDocDescripcion) values('"+nPerCodigo+"','"+cbotipodoc+"','"+txtdocumento+"')";
                Sql.ejecuta(documento);

                String telefono="insert into telefono (nPerCodigo,nTelTipo,cTelDescripcion) values('"+nPerCodigo+"','"+cbotipotel+"','"+txttelefono+"')";
                Sql.ejecuta(telefono);

                String direccion="insert into direccion (nPerCodigo,nDirTipo,cDirDescripcion,nDirDepartamento,nDirProvincia,nDirDistrito,nDirPais) values('"+nPerCodigo+"','29','"+txtdireccion+",'"+cbodepa+"','"+cboprovincia+"','"+cbodistrito+"','2241')";
                Sql.ejecuta(direccion);
                out.println("<h1>Mensaje</h1>Se insertarn los datos correctamente");
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
