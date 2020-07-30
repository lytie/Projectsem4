/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import Generator.SendMail;
import Paypal.PaymentServices;
import com.paypal.base.rest.PayPalRESTException;
import entities.Accountcustomer;
import entities.Room;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.RoomClient;

/**
 *
 * @author longly
 */
public class Booking_Process extends HttpServlet {

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
           
            String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String inDate = request.getParameter("inDate");
        String outDate = request.getParameter("outDate");
        String adult = request.getParameter("adult");
        String children = request.getParameter("children");
        String idRoom = request.getParameter("idRoom");
        String deposit = request.getParameter("deposit");
        
        
        
            
        
            RoomClient client=new RoomClient();
            GenericType<Room> gt=new GenericType<Room>(){};
            
           Room room= client.find_JSON(gt, idRoom);
            String idName=room.getRoomTypeId().getRoomTypeName()+"-"+room.getLocationId().getLocationName()+idRoom;
        
        
            PaymentServices paymentServices=new PaymentServices();
            
            
          if(request.getParameter("idCus")!=null){
            String idCus = request.getParameter("idCus");
            response.sendRedirect(paymentServices.authorizePayment(deposit, idName,name,email,"http://localhost:8080/WA/Booking_payment?name="+name+"&email="+email+"&phone="+phone+"&inDate="+inDate+"&outDate="+outDate+"&adult="+adult+"&children="+children+"&idRoom="+idRoom+"&deposit="+deposit+"&idCus="+idCus));

        }else{
                          response.sendRedirect(paymentServices.authorizePayment(deposit, idName,name,email,"http://localhost:8080/WA/Booking_payment?name="+name+"&email="+email+"&phone="+phone+"&inDate="+inDate+"&outDate="+outDate+"&adult="+adult+"&children="+children+"&idRoom="+idRoom+"&deposit="+deposit));
          }  
            
            
        } catch (PayPalRESTException ex) {
            Logger.getLogger(Booking_Process.class.getName()).log(Level.SEVERE, null, ex);
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
            String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String inDate = request.getParameter("start");
        String outDate = request.getParameter("end");
        String adult = request.getParameter("selectAdult");
        String children = request.getParameter("selectChildren");
        String idRoom = request.getParameter("idRoom");
        String deposit = request.getParameter("deposit");
        SendMail send = new SendMail();
        
       
        HttpSession session =request.getSession();
        if(session.getAttribute("user")!=null){
             Accountcustomer accountcustomer = (Accountcustomer) session.getAttribute("user");
             send.sendToken(email, "Account Verification ", "Please click on the link below to verify your email\n "
                + "http://localhost:8080/WA/Booking_Process?status=true&name="+name+"&email="+email+"&phone="+phone+"&inDate="+inDate+"&outDate="+outDate+"&adult="+adult+"&children="+children+"&idRoom="+idRoom+"&deposit="+deposit+"&idCus="+accountcustomer.getAccountCustomerId());

             
        }else{
            send.sendToken(email, "Account Verification ", "Please click on the link below to verify your email\n "
                + "http://localhost:8080/WA/Booking_Process?status=true&name="+name+"&email="+email+"&phone="+phone+"&inDate="+inDate+"&outDate="+outDate+"&adult="+adult+"&children="+children+"&idRoom="+idRoom+"&deposit="+deposit);

        }
        
        
        
         request.setAttribute("id", idRoom);
        request.getRequestDispatcher("Booking/confirm_infomation.jsp").forward(request, response);
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
