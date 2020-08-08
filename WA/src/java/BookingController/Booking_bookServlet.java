/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author longly
 */
public class Booking_bookServlet extends HttpServlet {

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

            String inDate = request.getParameter("start");
            String outDate = request.getParameter("end");
            int location = Integer.parseInt(request.getParameter("selectLocation"));
            int adult = Integer.parseInt(request.getParameter("selectAdult"));
            int children = Integer.parseInt(request.getParameter("selectChildren"));
            if (request.getParameter("end").isEmpty() || request.getParameter("end").isEmpty()) {
                request.setAttribute("check", "false");
            } else {
                request.setAttribute("check", "true");
            }
            HttpSession session = request.getSession();

            session.setAttribute("inDate", inDate);

//
            session.setAttribute("outDate", outDate);

            session.setAttribute("location", location);

            session.setAttribute("adult", adult);

            session.setAttribute("children", children);

            session.setAttribute("capation", adult * 2 + children);

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date inD = df.parse(inDate);
            Date outD = df.parse(outDate);
            System.out.println("ngay in:" + inD);
            System.out.println("ngay out:" + outD);
            System.out.println("so sanh ngay:" + inD.compareTo(outD));

            boolean error = true;
            if (inD.compareTo(outD) == 0) {
                Calendar cal = Calendar.getInstance();
                cal.setTime(outD);
                cal.add(Calendar.DATE, 1);
                //session.setAttribute("outDate", cal.getTime());
//                error=false;

                request.setAttribute("error", "<div class=\"err\"></div><script type=\"text/javascript\">\n"
                        + "            $('.err').each(function () {\n"
                        + "                swal(\"The checkin date cannot be the same as the checkout date \", \"\", \"error\");\n"
                        + "            });\n"
                        + "        </script>");

                outD = cal.getTime();
                outDate = df.format(outD);

            }

            System.out.println("outDate: " + outDate);
            session.setAttribute("inDate", inDate);
            session.setAttribute("outDate", outDate);

            request.getRequestDispatcher("Booking/booking.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(Booking_bookServlet.class.getName()).log(Level.SEVERE, null, ex);
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
