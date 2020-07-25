/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Generator.StringGenerator;
import bean.encrypt;
import entities.Accountcustomer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.AccountcustomerClient;

/**
 *
 * @author longly
 */
public class Booking_ChangePass extends HttpServlet {

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
           
            HttpSession session =request.getSession();
            
            Accountcustomer accountcustomer = (Accountcustomer) session.getAttribute("user");
            
            String oldPass=request.getParameter("old");
            String newPass=request.getParameter("new");
            String confirm=request.getParameter("confirm");
            
            
            
            AccountcustomerClient accClient=new AccountcustomerClient();
            GenericType<Accountcustomer> gAcc=new GenericType<Accountcustomer>(){};
         Accountcustomer acc=  accClient.find_JSON(gAcc, accountcustomer.getAccountCustomerId().toString());
            
            StringGenerator gen=new StringGenerator();
            encrypt en=new encrypt();
         
            
            if(newPass.length()<8){
                request.setAttribute("err", "New Password length must be at least 8 characters");
                request.getRequestDispatcher("Booking/infor.jsp").forward(request, response);
            }else  if(!newPass.equals(confirm)){
                request.setAttribute("err", "Confirm password doesn't match New Password ");
                request.getRequestDispatcher("Booking/infor.jsp").forward(request, response);
            }else if(!acc.getPassword().equals(en.changed(oldPass))){
                request.setAttribute("err", "Old Password incorrect");
                request.getRequestDispatcher("Booking/infor.jsp").forward(request, response);
            }else{
                acc.setPassword(en.changed(newPass));
                acc.setToken(gen.generate(newPass.length()));
                accClient.edit_JSON(acc, acc.getAccountCustomerId().toString());
                out.println("<div class='success'></div>");
                request.getRequestDispatcher("Booking/infor.jsp").include(request, response);
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
