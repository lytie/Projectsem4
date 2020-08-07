/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import Generator.SendMail;
import entities.Accountcustomer;
import entities.Roombooking;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.RoombookingClient;

/**
 *
 * @author longly
 */
public class Booking_ConfirmInfo extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");

            int idRoom = Integer.valueOf(request.getParameter("id"));

            

            HttpSession session = request.getSession();

            String in = session.getAttribute("inDate").toString();

            String out = session.getAttribute("outDate").toString();

            String capation = session.getAttribute("capation").toString();
            String location = session.getAttribute("location").toString();

            RoombookingClient roombookingClient=new RoombookingClient();
            GenericType<List<Roombooking>>  listRoomBook=new GenericType<List<Roombooking>>(){};
            List<Roombooking> list=roombookingClient.bookRoom_JSON(listRoomBook,in,out,Integer.parseInt(location),Integer.parseInt(capation));
             
            boolean exists=true;
            for (Roombooking roombooking : list) {
                if(roombooking.getRoomId()==idRoom){
                    exists=false;
                }
            }
            
            if(exists){
                
                 request.setAttribute("exists", "<div class=\"exists\"></div><script type=\"text/javascript\">\n" +
"            $('.exists').each(function () {\n" +
"                 swal(\"Book room fail \", \"The room has been booked\", \"warning\");\n" +
"            });\n" +
"        </script>");
                 request.getRequestDispatcher("Haven").forward(request, response);
                
            }else{
            
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date datein = df.parse(in);
            Date dateout = df.parse(out);

            Calendar calIn = Calendar.getInstance();
            Calendar calOut = Calendar.getInstance();
            calIn.setTime(datein);
            calOut.setTime(dateout);
            long date = (dateout.getTime() - datein.getTime()) / ((24 * 3600 * 1000));

            if (session.getAttribute("user") != null) {
                Accountcustomer accountcustomer = (Accountcustomer) session.getAttribute("user");
                request.setAttribute("AccCus", accountcustomer);

            }
            request.setAttribute("id", idRoom);
            request.setAttribute("date", date);
            request.getRequestDispatcher("Booking/confirm_infomation.jsp").forward(request, response);}
        } catch (ParseException ex) {
            Logger.getLogger(Booking_ConfirmInfo.class.getName()).log(Level.SEVERE, null, ex);
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

        //processRequest(request, response);
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
