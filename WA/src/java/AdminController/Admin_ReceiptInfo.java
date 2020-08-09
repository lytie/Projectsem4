/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import entities.Accountemployee;
import entities.Receipt;
import entities.Receiptcomponent;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.AccountemployeeClient;
import wsc.ReceiptClient;
import wsc.ReceiptcomponentClient;

/**
 *
 * @author Admin
 */
public class Admin_ReceiptInfo extends HttpServlet {

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
            Accountemployee sessionAccountemployee = (Accountemployee) session.getAttribute("accountemployee");
            if (sessionAccountemployee != null) {
                if (sessionAccountemployee.getRoleId().getRoleId() == 1) {
                    //do your job here
                    request.setAttribute("navbar", true);
                   
                    //end your job
                } else {
                    request.setAttribute("navbar", false);

                   
                }
            
            
            /* TODO output your page here. You may use following sample code. */
            String receiptid = request.getParameter("receiptid");
            ReceiptcomponentClient receiptcomponentClient = new ReceiptcomponentClient();
            ReceiptClient receiptClient = new ReceiptClient();
            GenericType<List<Receiptcomponent>> genListReceiptcomponent = new GenericType<List<Receiptcomponent>>() {
            };
            GenericType<Receipt> genReceipt = new GenericType<Receipt>() {
            };
            List<Receiptcomponent> listReceiptcomponent = receiptcomponentClient.findbyReceiptID_JSON(genListReceiptcomponent, receiptid);
            Receipt receipt = receiptClient.find_JSON(genReceipt, receiptid);
            float Prepayment = 0;
            boolean o = false;
            for (Receiptcomponent receiptcomponent : listReceiptcomponent) {

                if (receiptcomponent.getStatus()) {
                    Prepayment = Prepayment + receiptcomponent.getSubtotal() + receiptcomponent.getSubtotal() / 10;
                    System.out.println("Prepayment" + Prepayment);
                    o = true;
                }
            }

            if (!o) {
                Prepayment = Prepayment + 50;
            }

            request.setAttribute("prepayment", Prepayment);
            request.setAttribute("listReceiptcomponent", listReceiptcomponent);
            request.setAttribute("receipt", receipt);
            request.getRequestDispatcher("AdminTemplate/receiptinfo.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("Admin_Login").forward(request, response);
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
        try (PrintWriter out = response.getWriter()) {

             processRequest(request, response);

        }
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
        String id = request.getParameter("receiptid");
        ReceiptClient receiptClient = new ReceiptClient();

        System.out.println("id=" + id);

        ReceiptcomponentClient receiptcomponentClient = new ReceiptcomponentClient();

        GenericType<List<Receiptcomponent>> genListReceiptcomponent = new GenericType<List<Receiptcomponent>>() {
        };
        GenericType<Receipt> genReceipt = new GenericType<Receipt>() {
        };
        List<Receiptcomponent> listReceiptcomponent = receiptcomponentClient.findbyReceiptID_JSON(genListReceiptcomponent, id);
        Receipt re = receiptClient.find_JSON(genReceipt, id);

        for (Receiptcomponent receiptcomponent : listReceiptcomponent) {
            receiptcomponent.setPayDate(new Date());
            receiptcomponent.setStatus(Boolean.TRUE);
            receiptcomponentClient.edit_JSON(receiptcomponent, receiptcomponent.getReceiptComponentId().toString());
        }

        float Prepayment = 0;
        boolean o = false;
        for (Receiptcomponent receiptcomponent : listReceiptcomponent) {

            if (receiptcomponent.getStatus()) {
                Prepayment = Prepayment + receiptcomponent.getSubtotal() + receiptcomponent.getSubtotal() / 10;
                System.out.println("Prepayment" + Prepayment);
                o = true;
            }
        }

        if (!o) {
            Prepayment = Prepayment + 50;
        }

        request.setAttribute("prepayment", Prepayment);

        request.setAttribute("listReceiptcomponent", listReceiptcomponent);
        request.setAttribute("receipt", re);
        request.getRequestDispatcher("AdminTemplate/receiptinfo.jsp").forward(request, response);

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
