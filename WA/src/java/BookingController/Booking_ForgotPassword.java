/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import Generator.SendMail;
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
public class Booking_ForgotPassword extends HttpServlet {

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
            String email = request.getParameter("email");
             
        AccountcustomerClient accCusClient=new AccountcustomerClient();
       
        GenericType<List<Accountcustomer>> gAccCus = new GenericType<List<Accountcustomer>>() {
        };
        List<Accountcustomer> listAccCus = accCusClient.findAll_JSON(gAccCus);
        String token = null;
        boolean check=false;
            for (Accountcustomer listAccCu : listAccCus) {
                if(listAccCu.getEmail().equals(email)){
                    check=true;
                    token=listAccCu.getToken();
                }
            }
            
            
            if(check){
                out.println("<div class=\"reset\"></div>");
                request.setAttribute("e", email);
                 SendMail send = new SendMail();
            send.sendToken(email, "Reset password ", "Please click on the link below to reset password of your account \n http://localhost:8080/WA/ConfirmPassword?token="+token);

            request.getRequestDispatcher("Booking/login.jsp").include(request, response);
            }else{
                out.println("<div class=\"noEmail\"></div>");
                request.getRequestDispatcher("Booking/login.jsp").include(request, response);
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
