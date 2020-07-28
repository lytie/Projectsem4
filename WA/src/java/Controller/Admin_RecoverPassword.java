/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import entities.Accountemployee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.AccountemployeeClient;

/**
 *
 * @author Admin
 */
public class Admin_RecoverPassword extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            //request.getRequestDispatcher("AdminTemplate/recover-password.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String token = request.getParameter("token");
        AccountemployeeClient accountemployeeClient = new AccountemployeeClient();
        GenericType<Accountemployee> genAccountemployee = new GenericType<Accountemployee>() {
        };
        Accountemployee accountemployee = accountemployeeClient.findbyEmail_JSON(genAccountemployee, email);
        if (accountemployee == null) {
            request.getRequestDispatcher("Admin_Login").forward(request, response);
        }
        if (accountemployee.getToken().equals(token)) {
            System.out.println("true");
            request.setAttribute("email", email);
            request.setAttribute("token", token);
            request.getRequestDispatcher("AdminTemplate/recover-password.jsp").forward(request, response);
        } else {
            System.out.println("false");
            request.getRequestDispatcher("AdminTemplate/login.jsp").forward(request, response);
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
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        if (!password.equals(confirmpassword)) {
            request.setAttribute("error", "Password and Confirm Password not match");
            request.getRequestDispatcher("AdminTemplate/recover-password.jsp").forward(request, response);
        } else {
            String email = request.getParameter("email");
            String token = request.getParameter("token");
            AccountemployeeClient accountemployeeClient = new AccountemployeeClient();
            GenericType<Accountemployee> genAccountemployee = new GenericType<Accountemployee>() {
            };
            Accountemployee accountemployee = accountemployeeClient.findbyEmail_JSON(genAccountemployee, email);
            if (accountemployee.getToken().equals(token)) {
                accountemployee.setToken(new Generator.StringGenerator().generate(password.length() * 5));
                accountemployee.setPassword(password);
                accountemployeeClient.edit_JSON(accountemployee, accountemployee.getAccountId().toString());
                request.setAttribute("success", "<div class='success'></div>"
                        + "         <script type=\"text/javascript\">\n"
                        + "            $('.success').each(function () {\n"
                        + "                swal(\"Change password successfully!!!\", \"\", \"success\");\n"
                        + "            });\n"
                        + "        </script>");
                request.getRequestDispatcher("AdminTemplate/login.jsp").forward(request, response);
            }
        }
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
