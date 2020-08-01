/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paypal;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import entities.Qrcode;
import entities.Receiptcomponent;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.QrcodeClient;
import wsc.ReceiptcomponentClient;

/**
 *
 * @author Admin
 */
public class ExecutePaymentServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ExecutePaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExecutePaymentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        HttpSession session = request.getSession();
        QrcodeClient qrcodeClient = new QrcodeClient();
        ReceiptcomponentClient receiptcomponentClient = new ReceiptcomponentClient();
        GenericType<Qrcode> genericType = new GenericType<Qrcode>() {
        };
        GenericType<List<Receiptcomponent>> genType = new GenericType<List<Receiptcomponent>>() {};
        Qrcode qrcode = new Qrcode();
        if (session.getAttribute("qrcodeid") == null) {
            if (request.getParameter("id") == null) {
                System.out.print("Error");
            } else {
                qrcode = qrcodeClient.find_JSON(genericType, request.getParameter("id"));
                if (qrcode != null) {
                    session.setAttribute("qrcodeid", qrcode.getQrCodeId());
                    request.getRequestDispatcher("/CustomerPageCartServlet").forward(request, response);
                } else {
                    System.out.print("Not found qrcode");
                }
            }
        } else {
            try {
                
                
                qrcode = qrcodeClient.find_JSON(genericType, session.getAttribute("qrcodeid").toString());
                List<Receiptcomponent> list = receiptcomponentClient.findbyReceiptID_JSON(genType, String.valueOf(qrcode.getReceiptId().getReceiptId()));
                PaymentServices paymentServices = new PaymentServices();
                Payment payment = paymentServices.executePayment(paymentId, payerId);
                for (Receiptcomponent receiptcomponent : list) {
                    receiptcomponent.setStatus(Boolean.TRUE);
                    receiptcomponent.setPayDate(new Date());
                    receiptcomponentClient.edit_JSON(receiptcomponent, receiptcomponent.getReceiptComponentId().toString());
                }
                
                PayerInfo payerInfo = payment.getPayer().getPayerInfo();
                Transaction transaction = payment.getTransactions().get(0);

                request.setAttribute("payer", payerInfo);
                request.setAttribute("transaction", transaction);

                request.getRequestDispatcher("/customerpage/receipt.jsp").forward(request, response);

            } catch (PayPalRESTException ex) {
                request.setAttribute("errorMessage", ex.getMessage());
                ex.printStackTrace();
                request.getRequestDispatcher("/customerpage/error.jsp").forward(request, response);
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
