/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import bean.encrypt;
import entities.Accountcustomer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class Login extends HttpServlet {

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
       
         request.setAttribute("err", null);
        request.getRequestDispatcher("Booking/login.jsp").forward(request, response);
        
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
        
           try (PrintWriter out = response.getWriter()) {   
       String email= request.getParameter("email");
       String pass= request.getParameter("pass");
        
        AccountcustomerClient accC=new AccountcustomerClient();
        GenericType<List<Accountcustomer>> gAcc=new GenericType<List<Accountcustomer>>(){};
     List<Accountcustomer> listAccCus=accC.findAll_JSON(gAcc);
        
     boolean check=false;
     boolean active=false;
     encrypt en=new encrypt();
     Accountcustomer accsession = new Accountcustomer();
     for (Accountcustomer acc : listAccCus) {
            if (acc.getEmail().equals(email)) {
                if(acc.getPassword().equals(en.changed(pass))){
                     
                    check=true;
                    if(acc.getActive()){
                        active=true;
                        accsession.setAccountCustomerId(acc.getAccountCustomerId());
                        accsession.setEmail(acc.getEmail());
                        accsession.setFullName(acc.getFullName());
                        accsession.setPhone(acc.getPhone());
                        
                    }
                }
            }
        }
     
     
     
        if (check) {
            if(!active){
                out.println("<div class=\"active\"></div>");
                request.getRequestDispatcher("Booking/login.jsp").include(request, response);
            }else{
                HttpSession session=request.getSession();
                if(session.getAttribute("user")==null){
                    session.setAttribute("user", accsession);
                }
                
            request.getRequestDispatcher("Haven").forward(request, response);
            }
        } else {
            request.setAttribute("err", "Username or password incorrect");
            request.getRequestDispatcher("Booking/login.jsp").forward(request, response);
        }
     
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
