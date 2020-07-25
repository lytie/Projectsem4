/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import bean.encrypt;
import entities.Accountcustomer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.AccountcustomerClient;

/**
 *
 * @author longly
 */
public class Booking_resetPassword extends HttpServlet {

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

            String token = request.getParameter("token");
            String pass = request.getParameter("password");
            String Confirm = request.getParameter("passwordConfirm");

            if (pass.equals(Confirm)) {
                AccountcustomerClient accCusClient = new AccountcustomerClient();
                 encrypt en=new encrypt();
                GenericType<List<Accountcustomer>> gAccCus = new GenericType<List<Accountcustomer>>() {
                };
                List<Accountcustomer> listAccCus = accCusClient.findAll_JSON(gAccCus);

                for (Accountcustomer AccCustomer : listAccCus) {
                    if (token.equals(AccCustomer.getToken())) {
                             AccCustomer.setPassword(en.changed(pass));
                accCusClient.edit_JSON(AccCustomer, AccCustomer.getAccountCustomerId().toString());
                    }
                }
                  out.println("<div class=\"pass\"></div>");
                request.getRequestDispatcher("Booking/login.jsp").forward(request, response);
            }else{
                request.setAttribute("err", "Confirm Password does not match  Password");
                 request.getRequestDispatcher("Booking/confirm_Password?token="+token).forward(request, response);
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
