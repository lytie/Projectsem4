/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

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
public class Booking_signUpServlet extends HttpServlet {

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
       
        
        
         String name = request.getParameter("name");
     String email=request.getParameter("email");
     String phone=request.getParameter("phone");
     String pass=request.getParameter("pass");
     String passConfirm=request.getParameter("passconfirm");
     
     
     Booking_signUpMB signup=new Booking_signUpMB();
     signup.setName(name);
     signup.setEmail(email);
     signup.setPhone(phone);
    
      AccountcustomerClient accC=new AccountcustomerClient();
      Accountcustomer accCus=new Accountcustomer();
        GenericType<List<Accountcustomer>> gAcc=new GenericType<List<Accountcustomer>>(){};
     List<Accountcustomer> listAccCus=accC.findAll_JSON(gAcc);
      boolean check =false;
        for (Accountcustomer acc : listAccCus) {
            if (acc.getEmail().equals(email)) {
                check=true;
            }
        }
        
        String errName=null;
        String errEmail=null;
        String errPass=null;
        String errPhone=null;
        String errConfirmPass=null;
        
         
         if(name.isEmpty())
             {
                errName="Please enter Full Name"; 
             }else{
                errName=null; 
             }
         
         if(email.isEmpty())
                {
                     errEmail="Please enter Email";
                }
//                else if(!email.matches("^[a-zA-Z][\\w]+@([\\w]+\\.[\\w]+)$")){
//                    errEmail="Email Invalid format !";
//                }
                else if(check){
                    errEmail="Email have been registered ! ";
                }else{
                   errEmail=null;
                }
         
         if(phone.isEmpty()){
             errPhone="Please enter Phone";
         }
         else if(!phone.matches("^\\d{10,13}$")){
            errPhone="Phone numbers must be 10 to 13 digits";
         }else{
             errPhone=null;
         }
         
        if(pass.isEmpty()){
           errPass="Please enter Password"; 
         }else if(pass.length()<6){
              errPass="Password length must be at least 6 characters";
         }else{
              errPass=null;
         }
        
        if(passConfirm.isEmpty()){
            errConfirmPass="Please enter Confirm Password";
         }else if(!passConfirm.equals(pass)){
             errConfirmPass="Password does not match Confirm Password";
         }else{
              errConfirmPass=null;
         }
        
        encrypt en=new encrypt();
        
         
         if(errName==null&&errEmail==null&&errPass==null&&errPhone==null&&errConfirmPass==null){
             accCus.setEmail(email);
            accCus.setFullName(name);
            accCus.setPassword(en.changed(pass));
            accCus.setPhone(phone);
            accC.create_JSON(accCus);
            request.getRequestDispatcher("Booking/index.jsp").forward(request, response);
         }else{
             
             request.setAttribute("errName", errName);
             request.setAttribute("errEmail", errEmail);
             request.setAttribute("errPass", errPass);
             request.setAttribute("errPhone", errPhone);
             request.setAttribute("errConfirmPass", errConfirmPass);
             request.setAttribute("name", name);
           request.setAttribute("email", email);
             request.setAttribute("phone", phone);
             request.getRequestDispatcher("Booking/signup.jsp").forward(request, response);
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
