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
import entities.Roombooking;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.RoomClient;
import wsc.RoombookingClient;

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
            String price = request.getParameter("price");

            RoomClient roomClient = new RoomClient();
            GenericType<Room> roomGenericType = new GenericType<Room>() {
            };
            Room r = roomClient.find_JSON(roomGenericType, idRoom);

            int capation = Integer.parseInt(children) + Integer.parseInt(adult) * 2;

            RoombookingClient roombookingClient = new RoombookingClient();
            GenericType<List<Roombooking>> listRoomBook = new GenericType<List<Roombooking>>() {
            };
            List<Roombooking> list = roombookingClient.bookRoom_JSON(listRoomBook, inDate, outDate, r.getLocationId().getLocationId(), capation);

            boolean exists = true;
            for (Roombooking roombooking : list) {
                if (roombooking.getRoomId() == Integer.valueOf(idRoom)) {
                    exists = false;
                }
            }

            if (exists) {

                request.setAttribute("exists", "<div class=\"exists\"></div><script type=\"text/javascript\">\n"
                        + "            $('.exists').each(function () {\n"
                        + "                 swal(\"Book room fail \", \"The room has been booked\", \"warning\");\n"
                        + "            });\n"
                        + "        </script>");
                request.getRequestDispatcher("Haven").forward(request, response);

            } else {

                RoomClient client = new RoomClient();
                GenericType<Room> gt = new GenericType<Room>() {
                };

                Room room = client.find_JSON(gt, idRoom);
                String idName = room.getRoomTypeId().getRoomTypeName() + "-" + room.getLocationId().getLocationName() + idRoom;

                PaymentServices paymentServices = new PaymentServices();

                System.out.println("test name:" + name);

                if (request.getParameter("idCus") != null) {
                    String idCus = request.getParameter("idCus");
                    response.sendRedirect(paymentServices.authorizePayment(String.valueOf((Float.valueOf(price) / 10)), idName, name, email, "http://localhost:8080/WA/Booking_payment?name=" + name.replace(" ", "+") + "&email=" + email + "&phone=" + phone + "&inDate=" + inDate + "&outDate=" + outDate + "&adult=" + adult + "&children=" + children + "&idRoom=" + idRoom + "&price=" + price + "&idCus=" + idCus));

                } else {
                    response.sendRedirect(paymentServices.authorizePayment(String.valueOf((Float.valueOf(price) / 10)), idName, name, email, "http://localhost:8080/WA/Booking_payment?name=" + name.replace(" ", "+") + "&email=" + email + "&phone=" + phone + "&inDate=" + inDate + "&outDate=" + outDate + "&adult=" + adult + "&children=" + children + "&idRoom=" + idRoom + "&price=" + price));
                }
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
        String price = request.getParameter("price");
        SendMail send = new SendMail();

        RoomClient roomClient = new RoomClient();
        GenericType<Room> roomGenericType = new GenericType<Room>() {
        };
        Room r = roomClient.find_JSON(roomGenericType, idRoom);
        
        int capation = Integer.parseInt(children) + Integer.parseInt(adult) * 2;
        
        RoombookingClient roombookingClient = new RoombookingClient();
        GenericType<List<Roombooking>> listRoomBook = new GenericType<List<Roombooking>>() {
        };
        List<Roombooking> list = roombookingClient.bookRoom_JSON(listRoomBook, inDate, outDate, r.getLocationId().getLocationId(), capation);

        boolean exists = true;
        for (Roombooking roombooking : list) {
            if (roombooking.getRoomId() == Integer.valueOf(idRoom)) {
                exists = false;
            }
        }

        if (exists) {

            request.setAttribute("exists", "<div class=\"exists\"></div><script type=\"text/javascript\">\n"
                    + "            $('.exists').each(function () {\n"
                    + "                swal(\"The room has been booked \", \"\", \"warning\");\n"
                    + "            });\n"
                    + "        </script>");
            request.getRequestDispatcher("Haven").forward(request, response);

        } else {
            HttpSession session = request.getSession();
            if (session.getAttribute("user") != null) {
                Accountcustomer accountcustomer = (Accountcustomer) session.getAttribute("user");
                send.sendToken(email, "Account Verification ", "Please click on the link below to verify your email and pay your bill with paypal\n "
                        + "http://localhost:8080/WA/Booking_Process?status=true&name=" + name.replace(" ", "+") + "&email=" + email + "&phone=" + phone + "&inDate=" + inDate + "&outDate=" + outDate + "&adult=" + adult + "&children=" + children + "&idRoom=" + idRoom + "&price=" + price + "&idCus=" + accountcustomer.getAccountCustomerId());

            } else {
                send.sendToken(email, "Account Verification ", "Please click on the link below to verify your email and pay your bill with paypal \n "
                        + "http://localhost:8080/WA/Booking_Process?status=true&name=" + name.replace(" ", "+") + "&email=" + email + "&phone=" + phone + "&inDate=" + inDate + "&outDate=" + outDate + "&adult=" + adult + "&children=" + children + "&idRoom=" + idRoom + "&price=" + price);

            }

            request.setAttribute("success", "<div class=\"success\"></div><script type=\"text/javascript\">\n"
                    + "            $('.success').each(function () {\n"
                    + "                swal(\"Please check your email to pay by paypal\", \"Email sended to: " + email + "\", \"success\");\n"
                    + "            });\n"
                    + "        </script>");

            request.setAttribute("id", idRoom);
            request.getRequestDispatcher("Booking/index.jsp").forward(request, response);
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
