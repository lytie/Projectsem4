/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import entities.Accountcustomer;
import entities.Feedback;
import entities.Qrcode;
import entities.Receipt;
import entities.Receiptcomponent;
import entities.Room;
import entities.Ticket;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.AccountcustomerClient;
import wsc.AdminIndexClient;
import wsc.QrcodeClient;
import wsc.ReceiptClient;

/**
 *
 * @author Admin
 */
public class AdminIndexServlet extends HttpServlet {

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
            AdminIndexClient adminIndexClient = new AdminIndexClient();
            QrcodeClient qrcodeClient = new QrcodeClient();
            ReceiptClient receiptClient = new ReceiptClient();
            GenericType<List<Receiptcomponent>> genListReceiptcomponent = new GenericType<List<Receiptcomponent>>() {
            };
            GenericType<List<Qrcode>> genListQrcode = new GenericType<List<Qrcode>>() {
            };
            GenericType<List<Feedback>> genListFeedback = new GenericType<List<Feedback>>() {
            };
            GenericType<List<Ticket>> genListTicket = new GenericType<List<Ticket>>() {
            };
            GenericType<List<Accountcustomer>> genListAccountcustomer = new GenericType<List<Accountcustomer>>() {
            };
            GenericType<List<Receipt>> genListReceipt = new GenericType<List<Receipt>>() {
            };
            //List<Accountcustomer> listAccountcustomers = accountcustomerClient.findAll_JSON(typ);
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            cal.setTime(dateFormat.parse(dateFormat.format(date)));
            cal.add(Calendar.DATE, 1);
            Calendar calyesterday = Calendar.getInstance();
            calyesterday.add(Calendar.DATE, -1);
            
            String today = dateFormat.format(date);
            String nextday = dateFormat.format(cal.getTime());
            String yesterday = dateFormat.format(calyesterday.getTime());
            
            List<Receiptcomponent> listReceiptcomponents = adminIndexClient.getnewFoodandDrinkOrders(genListReceiptcomponent, today, nextday);
            List<Qrcode> listQrcodes = adminIndexClient.getnewRoomBooked(genListQrcode, today, nextday);
            List<Feedback> listFeedbacks = adminIndexClient.getnewFeedBack(genListFeedback, today, nextday);
            List<Ticket> listTickets = adminIndexClient.getnewTicketSold(genListTicket, today, nextday);
            List<Accountcustomer> listAccountcustomers = adminIndexClient.getnewUserRegistrations(genListAccountcustomer, today, nextday);
            List<Receipt> listReceipts = adminIndexClient.getnewPaidReceipt(genListReceipt, today, nextday);
            
            float yesterdayrevenue = 0;
            float allrevenue = 0;
            float allbookingdepositsrevenue =0;
            float allpaidbillrevenue = 0;
            List<Qrcode> listyesterdayQrcodes = adminIndexClient.getnewRoomBooked(genListQrcode, yesterday, today);
            List<Receipt> listyesterdayReceipts = adminIndexClient.getnewPaidReceipt(genListReceipt, yesterday, today);
            for (Receipt receipt : listyesterdayReceipts) {
                yesterdayrevenue += receipt.getTotal();
            }
            for (Qrcode qrcode : listyesterdayQrcodes) {
                yesterdayrevenue += qrcode.getDeposits();
            }
            List<Qrcode> listAllQrcodes = qrcodeClient.findAll_JSON(genListQrcode);
            List<Receipt> listAllReceipts = receiptClient.findAll_JSON(genListReceipt);
            for (Receipt receipt : listAllReceipts) {
                if(receipt.getTotal()!=null){
                    allpaidbillrevenue += receipt.getTotal();
                }
            }
            for (Qrcode qrcode : listAllQrcodes) {
                if (qrcode.getDeposits()!=null) {
                  allbookingdepositsrevenue += qrcode.getDeposits();  
                }
            }
            allrevenue = allpaidbillrevenue +allbookingdepositsrevenue;
            request.setAttribute("listReceiptcomponents", listReceiptcomponents);
            request.setAttribute("listQrcodes", listQrcodes);
            request.setAttribute("listFeedbacks", listFeedbacks);
            request.setAttribute("listTickets", listTickets);
            request.setAttribute("listAccountcustomers", listAccountcustomers);
            request.setAttribute("listReceipts", listReceipts);
            request.setAttribute("yesterdayrevenue", yesterdayrevenue);
            request.setAttribute("allpaidbillrevenue", allpaidbillrevenue);
            request.setAttribute("allbookingdepositsrevenue", allbookingdepositsrevenue);
            request.setAttribute("allrevenue", allrevenue);
            request.getRequestDispatcher("AdminTemplate/index.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AdminIndexServlet.class.getName()).log(Level.SEVERE, null, ex);
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
