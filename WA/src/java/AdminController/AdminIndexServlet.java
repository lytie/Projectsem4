/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

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
import java.util.ArrayList;
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
import wsc.ReceiptcomponentClient;

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
            ReceiptcomponentClient receiptcomponentClient = new ReceiptcomponentClient();
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
            String from = request.getParameter("from");
            String to = request.getParameter("to");

            List<Receiptcomponent> listNewFoodandDrinksOrders = adminIndexClient.getnewFoodandDrinkOrders(genListReceiptcomponent, today, nextday);
            List<Receiptcomponent> listNewPaidReceiptcomponents = adminIndexClient.getnewPaidReceiptComponent(genListReceiptcomponent, today, nextday);
            List<Qrcode> listNewRoomBooked = adminIndexClient.getnewRoomBooked(genListQrcode, today, nextday);
            List<Feedback> listNewFeedbacks = adminIndexClient.getnewFeedBack(genListFeedback, today, nextday);
            List<Ticket> listNewTickets = adminIndexClient.getnewTicketSold(genListTicket, today, nextday);
            List<Accountcustomer> listNewAccountcustomers = adminIndexClient.getnewUserRegistrations(genListAccountcustomer, today, nextday);

            List<Qrcode> listYesterdayRoomBooked = adminIndexClient.getnewRoomBooked(genListQrcode, yesterday, today);
            List<Receiptcomponent> listYesterdayReceiptcomponents = adminIndexClient.getnewPaidReceiptComponent(genListReceiptcomponent, yesterday, today);

            List<Qrcode> listAllRoomBooked = qrcodeClient.findAll_JSON(genListQrcode);
            List<Receiptcomponent> listAllReceiptcomponents = receiptcomponentClient.findAll_JSON(genListReceiptcomponent);
            List<Receipt> listAllReceipt = receiptClient.findAll_JSON(genListReceipt);
            
            List<Qrcode> listCustomRoomBooked = new ArrayList<>();
            List<Receiptcomponent> listCustomReceiptcomponents = new ArrayList<>();
            List<Receiptcomponent> listCustomPaidReceiptcomponents = new ArrayList<>();
            System.out.println("from"+from);
            System.out.println("to"+to);
            if (from != null || to != null) {
                listCustomRoomBooked = adminIndexClient.getnewRoomBooked(genListQrcode, from, to);
                listCustomReceiptcomponents = adminIndexClient.getnewPaidReceiptComponent(genListReceiptcomponent, from, to);
                listCustomPaidReceiptcomponents = adminIndexClient.getnewPaidReceiptComponent(genListReceiptcomponent, from, to);     
            } else {
                listCustomRoomBooked = adminIndexClient.getnewRoomBooked(genListQrcode, today, nextday);
                listCustomReceiptcomponents = adminIndexClient.getnewPaidReceiptComponent(genListReceiptcomponent, today, nextday);
                listCustomPaidReceiptcomponents = adminIndexClient.getnewPaidReceiptComponent(genListReceiptcomponent, today, nextday);
            }
            //Begin calculate custom number
            float customRevenue = 0;
            float customServiceRevenue = 0;
            float customBookingDepositsRevenue = 0;
            for (Receiptcomponent receiptcomponent : listCustomPaidReceiptcomponents) {
                customServiceRevenue += receiptcomponent.getSubtotal();
                customRevenue += receiptcomponent.getSubtotal();
            }
            for (Qrcode qrcode : listCustomRoomBooked) {
                if (qrcode.getDeposits() != null) {
                    customBookingDepositsRevenue += qrcode.getDeposits();
                    customRevenue += qrcode.getDeposits();
                }
            }
            //Begin calculate yesterday number
            float yesterdayRevenue = 0;
            for (Receiptcomponent receiptcomponent : listYesterdayReceiptcomponents) {
                yesterdayRevenue += receiptcomponent.getSubtotal();
            }
            for (Qrcode qrcode : listYesterdayRoomBooked) {
                yesterdayRevenue += qrcode.getDeposits();
            }
            out.println("</br>Yesterday Revenue:" + yesterdayRevenue);
            //End calculate yesterday number
            //Begin calculate today number
            float todayRevenue = 0;
            float todayServiceRevenue = 0;
            float todayBookingDepositsRevenue = 0;
            for (Receiptcomponent receiptcomponent : listNewPaidReceiptcomponents) {
                todayServiceRevenue += receiptcomponent.getSubtotal();
                todayRevenue += receiptcomponent.getSubtotal();
            }
            for (Qrcode qrcode : listNewRoomBooked) {
                if (qrcode.getDeposits() != null) {
                    todayBookingDepositsRevenue += qrcode.getDeposits();
                    todayRevenue += qrcode.getDeposits();
                }
            }
            out.println("</br>Today Service Revenue:" + todayServiceRevenue);
            out.println("</br>Today Booking Deposits Revenue:" + todayBookingDepositsRevenue);
            out.println("</br>Today Revenue:" + todayRevenue);
            //End calculate today number
            //Begin calculate all number
            float allServiceRevenue = 0;
            float allBookingDepositsRevenue = 0;
            float allRealRevenue = 0;
            for (Receiptcomponent receiptcomponent : listAllReceiptcomponents) {
                if (receiptcomponent.getPayDate() != null) {
                    allServiceRevenue += receiptcomponent.getSubtotal();
                }
            }
            for (Qrcode qrcode : listAllRoomBooked) {
                if (qrcode.getDeposits() != null) {
                    allBookingDepositsRevenue += qrcode.getDeposits();
                }
            }
            allRealRevenue = allServiceRevenue + allBookingDepositsRevenue;
            out.println("</br>All Service Revenue:" + allServiceRevenue);
            out.println("</br>All Booking Deposits Revenue:" + allBookingDepositsRevenue);
            out.println("</br>All Real Revenue:" + allRealRevenue);
            //End calculate all number
            //Begin calculate growthvalue
            float distance2day = todayRevenue - yesterdayRevenue;
            float growthvalue = distance2day / yesterdayRevenue * 100;
            if (Float.isInfinite(growthvalue)) {
                growthvalue = todayRevenue;
            }
            if (Float.isNaN(growthvalue)) {
                growthvalue = 0;
            }
            out.println("</br>Growthvalue:" + growthvalue + "%");
            //End calculate growthvalue
            //Begin calculate estimated Revenue and unpaidRevenue
            float estimatedRevenue = 0;
            float unpaidRevenue = 0;
            for (Receipt receipt : listAllReceipt) {
                if (receipt.getTotal() != null) {
                    estimatedRevenue += receipt.getTotal();
                }
            }
            unpaidRevenue = estimatedRevenue - allRealRevenue;
            out.println("</br>UnPaid Revenue:" + unpaidRevenue);
            out.println("</br>Estimated Revenue:" + estimatedRevenue);

            request.setAttribute("customRevenue", customRevenue);
            request.setAttribute("customServiceRevenue", customServiceRevenue);
            request.setAttribute("customBookingDepositsRevenue", customBookingDepositsRevenue);
            request.setAttribute("yesterdayRevenue", yesterdayRevenue);
            request.setAttribute("todayRevenue", todayRevenue);
            request.setAttribute("todayServiceRevenue", todayServiceRevenue);
            request.setAttribute("todayBookingDepositsRevenue", todayBookingDepositsRevenue);
            request.setAttribute("allServiceRevenue", allServiceRevenue);
            request.setAttribute("allBookingDepositsRevenue", allBookingDepositsRevenue);
            request.setAttribute("allRealRevenue", allRealRevenue);
            request.setAttribute("growthvalue", growthvalue);
            request.setAttribute("estimatedRevenue", estimatedRevenue);
            request.setAttribute("unpaidRevenue", unpaidRevenue);
            request.setAttribute("listNewFoodandDrinksOrders", listNewFoodandDrinksOrders);
            request.setAttribute("listNewRoomBooked", listNewRoomBooked);
            request.setAttribute("listNewAccountcustomers", listNewAccountcustomers);
            request.setAttribute("listNewFeedbacks", listNewFeedbacks);
            request.setAttribute("listNewTickets", listNewTickets);
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
