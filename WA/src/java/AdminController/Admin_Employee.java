/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import entities.Accountemployee;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.AccountemployeeClient;

/**
 *
 * @author ADMIN
 */
public class Admin_Employee extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            AccountemployeeClient accountemployeeClient = new AccountemployeeClient();
            GenericType<List<Accountemployee>> typ = new GenericType<List<Accountemployee>>() {
            };
            List<Accountemployee> listAccE = accountemployeeClient.findAll_JSON(typ);
            request.setAttribute("listAccE", listAccE);
            request.getRequestDispatcher("AdminTemplate/employee.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Accountemployee sessionAccountemployee = (Accountemployee) session.getAttribute("accountemployee");
            if (sessionAccountemployee != null) {               
                if (sessionAccountemployee.getRoleId().getRoleId() == 1) {
                    //do your job here
                    String id = request.getParameter("id");
                    String action = request.getParameter("action");
                    if (action != null) {
                        AccountemployeeClient accountemployeeClient = new AccountemployeeClient();
                        GenericType<Accountemployee> genAccountemployeee = new GenericType<Accountemployee>() {
                        };
                        Accountemployee accountemployee = accountemployeeClient.find_JSON(genAccountemployeee, id);
                        if (action.equals("deactive")) {
                            accountemployee.setStatus(Boolean.FALSE);
                        }
                        if (action.equals("active")) {
                            accountemployee.setStatus(Boolean.TRUE);
                        }
                        accountemployeeClient.edit_JSON(accountemployee, accountemployee.getAccountId().toString());
                        processRequest(request, response);
                    } else {
                        processRequest(request, response);
                    }
                    //end your job
                } else {
                    out.print("<h1>You do not have permission</h1>");
                }
            }else{
                request.getRequestDispatcher("Admin_Login").forward(request, response);
            }
        }
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
