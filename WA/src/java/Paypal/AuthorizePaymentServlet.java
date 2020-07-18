/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paypal;

import com.paypal.base.rest.PayPalRESTException;
import entities.Qrcode;
import entities.Receipt;
import entities.Receiptcomponent;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.QrcodeClient;
import wsc.ReceiptClient;
import wsc.ReceiptcomponentClient;

/**
 *
 * @author Admin
 */
public class AuthorizePaymentServlet extends HttpServlet {

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
            String qrcodeid = request.getParameter("id");
            QrcodeClient qrcodeClient = new QrcodeClient();
            GenericType<Qrcode> genericType = new GenericType<Qrcode>() {
            };
            Qrcode qrcode = new Qrcode();
            qrcode = qrcodeClient.find_JSON(genericType, qrcodeid);
            if (qrcode != null) {
                HttpSession session = request.getSession();
                session.setAttribute("qrcodeid", qrcodeid);
                ReceiptcomponentClient receiptcomponentClient = new ReceiptcomponentClient();
                ReceiptClient receiptClient = new ReceiptClient();
                GenericType<List<Receiptcomponent>> genType = new GenericType<List<Receiptcomponent>>() {
                };
                GenericType<Receipt> receiptgenericType = new GenericType<Receipt>() {
                };
                List<Receiptcomponent> list = new ArrayList<Receiptcomponent>();
                Receipt receipt = receiptClient.find_JSON(receiptgenericType, String.valueOf(qrcode.getReceiptId().getReceiptId()));
                list = receiptcomponentClient.findbyReceiptID_JSON(genType, String.valueOf(qrcode.getReceiptId().getReceiptId()));
                try {
                    PaymentServices paymentServices = new PaymentServices();
                    String approvalLink = paymentServices.authorizePayment(receipt, list,qrcode);
                    response.sendRedirect(approvalLink);

                } catch (PayPalRESTException ex) {
                    request.setAttribute("errorMessage", ex.getMessage());
                    ex.printStackTrace();
                    request.getRequestDispatcher("/customerpage/error.jsp").forward(request, response);
                }
            } else {

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
