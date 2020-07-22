/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import entities.Qrcode;
import entities.Ticket;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.QrcodeClient;
import wsc.TicketClient;

/**
 *
 * @author Admin
 */
public class CustomerPageTicketServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            QrcodeClient qrcodeClient = new QrcodeClient();
            GenericType<Qrcode> genericType = new GenericType<Qrcode>() {
            };
            Qrcode qrcode = new Qrcode();
            if (session.getAttribute("qrcodeid") == null) {
                if (request.getParameter("id") == null) {
                    out.print("Error");
                } else {
                    qrcode = qrcodeClient.find_JSON(genericType, request.getParameter("id"));
                    if (qrcode != null) {
                        session.setAttribute("qrcodeid", qrcode.getQrCodeId());
                        request.getRequestDispatcher("/CustomerPageTicketServlet").forward(request, response);
                    } else {
                        out.print("Not found qrcode");
                    }
                }
            } else {
                TicketClient ticketClient = new TicketClient();
                GenericType<List<Ticket>> genericListTicket = new GenericType<List<Ticket>>() {
                };
                List<Ticket> list = ticketClient.findTicketByQR_JSON(genericListTicket,session.getAttribute("qrcodeid").toString());
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customerpage/ticket.jsp").forward(request, response);
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
