/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        response.setContentType("text/html;charset=UTF-8");

        String inDate = request.getParameter("start");
        String outDate = request.getParameter("end");
        int location = Integer.parseInt(request.getParameter("selectLocation"));
        int adult = Integer.parseInt(request.getParameter("selectAdult"));
        int children = Integer.parseInt(request.getParameter("selectChildren"));
        if (request.getParameter("end").isEmpty() || request.getParameter("end").isEmpty()) {
            request.setAttribute("check", "false");
        }else{
            request.setAttribute("check", "true");
        }
        HttpSession session = request.getSession();
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
//        Date date = new Date();  
//
//        if (session.getAttribute("inDate") == null) {
            session.setAttribute("inDate", inDate);
//            request.setAttribute("inDate", formatter.format(date));
//        } else {
//            session.setAttribute("inDate", inDate);
//            request.setAttribute("inDate", (String) session.getAttribute("inDate"));
//        }
//
//        if (session.getAttribute("outDate") == null) {
            session.setAttribute("outDate", outDate);
//            request.setAttribute("outDate", formatter.format(date));
//        } else {
//            session.setAttribute("outDate", outDate);
//            request.setAttribute("outDate", (String) session.getAttribute("outDate"));
//        }
//
//        if (session.getAttribute("location") == null) {
            session.setAttribute("location", location);
//            request.setAttribute("location", 1);
//        } else {
//            session.setAttribute("location", location);
//            request.setAttribute("location", Integer.valueOf(String.valueOf(session.getAttribute("location"))));
//        }
//
//        if (session.getAttribute("adult") == null) {
            session.setAttribute("adult", adult);
//            request.setAttribute("adult", 1);
//        } else {
//            session.setAttribute("adult", adult);
//            request.setAttribute("adult", Integer.valueOf(String.valueOf(session.getAttribute("adult"))));
//        }
//
//        if (session.getAttribute("children") == null) {
            session.setAttribute("children", children);
//            request.setAttribute("children", 1);
//        } else {
//            session.setAttribute("children", children);
//            request.setAttribute("children", Integer.valueOf(String.valueOf(session.getAttribute("children"))));
//        }
//
//        if (session.getAttribute("capation") == null) {
            session.setAttribute("capation", adult*2 + children);
//            request.setAttribute("capation", 3);
//        } else {
//            session.setAttribute("capation", adult + children);
//            request.setAttribute("capation", Integer.valueOf(String.valueOf(session.getAttribute("capation"))));
//        }
        request.getRequestDispatcher("Booking/booking.jsp").forward(request, response);

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
