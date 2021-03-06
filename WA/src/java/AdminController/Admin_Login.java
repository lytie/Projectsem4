/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import entities.Accountemployee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.AccountemployeeClient;

/**
 *
 * @author Admin
 */
public class Admin_Login extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            if (session.getAttribute("accountemployee") != null) {
                out.print("You already login");
            } else {
                request.getRequestDispatcher("AdminTemplate/login.jsp").forward(request, response);
            }
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
        if (request.getParameter("action")!=null && request.getParameter("action").equals("logout")) {
            HttpSession session = request.getSession();
            session.removeAttribute("accountemployee");
        }
        processRequest(request, response);
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        AccountemployeeClient accountemployeeClient = new AccountemployeeClient();
        GenericType<Accountemployee> genAccountemployee = new GenericType<Accountemployee>() {
        };
        Accountemployee accountemployee = accountemployeeClient.login_JSON(genAccountemployee, email, password);
        if (accountemployee != null) {
            accountemployee.setPassword("1");
            HttpSession session = request.getSession();
            session.setAttribute("accountemployee", accountemployee);
            if (accountemployee.getRoleId().getRoleId() == 1) {
                response.sendRedirect("AdminIndexServlet");
                //request.getRequestDispatcher("AdminIndexServlet").forward(request, response);
            } else {
                response.sendRedirect("EmployeeIndexServlet");
            }
            System.out.println("true");
        } else {
            request.setAttribute("error", "Email or password wrong");
            System.out.println("false");
            request.getRequestDispatcher("AdminTemplate/login.jsp").forward(request, response);
        }
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
