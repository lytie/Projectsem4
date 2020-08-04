/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author longly
 */
public class Booking extends HttpServlet {

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

        HttpSession session = request.getSession();
        String check = "true";

        if (session.getAttribute("inDate") == null || session.getAttribute("outDate") == null) {
            check = "false";
        } else {

            int location = 1;
            int adult = 1;
            int children = 1;
            if (session.getAttribute("location") == null) {
                session.setAttribute("location", location);
            }
//
            if (session.getAttribute("adult") == null) {
                session.setAttribute("adult", adult);
//            request.setAttribute("adult", 1);
            }
//
            if (session.getAttribute("children") == null) {
                session.setAttribute("children", children);
            }
//
            if (session.getAttribute("capation") == null) {
                session.setAttribute("capation", adult * 2 + children);
            }

            request.setAttribute("inDate", session.getAttribute("inDate"));
            request.setAttribute("outDate", session.getAttribute("outDate"));
            request.setAttribute("location", location);
            request.setAttribute("adult", adult);
            request.setAttribute("children", children);
        }
        request.setAttribute("check", check);
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
