/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import Generator.SendMail;
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
public class Admin_ForgetPassword extends HttpServlet {

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

            request.getRequestDispatcher("AdminTemplate/forgot-password.jsp").forward(request, response);
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
        AccountemployeeClient accountemployeeClient = new AccountemployeeClient();
        GenericType<Accountemployee> genAccountemployee = new GenericType<Accountemployee>() {
        };
        Accountemployee accountemployee = accountemployeeClient.findbyEmail_JSON(genAccountemployee, email);
        if (accountemployee == null) {
            request.setAttribute("error", "<div class='error'></div>"
                    + "         <script type=\"text/javascript\">\n"
                    + "            $('.error').each(function () {\n"
                    + "                swal(\"Your email did not exists!!!\", \"\", \"error\");\n"
                    + "            });\n"
                    + "        </script>");
            request.getRequestDispatcher("AdminTemplate/forgot-password.jsp").forward(request, response);
            System.out.println("false");
        } else {
            request.setAttribute("error", "<div class='error'></div>"
                    + "         <script type=\"text/javascript\">\n"
                    + "            $('.error').each(function () {\n"
                    + "                swal(\"We have sent a verification link to your email!!!\", \"\", \"success\");\n"
                    + "            });\n"
                    + "        </script>");
            SendMail sendMail = new SendMail();
            sendMail.sendToken(email, " Haven Deluxe Password changing verification", "Click on the link below to change your password \n http://localhost:8080/WA/Admin_RecoverPassword?token=" + accountemployee.getToken() + "&email=" + accountemployee.getEmail());
            System.out.println("true");
            request.getRequestDispatcher("AdminTemplate/forgot-password.jsp").forward(request, response);
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
