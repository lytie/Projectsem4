/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import entities.Qrcode;
import entities.Receipt;
import entities.Receiptcomponent;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.QrcodeClient;
import wsc.ReceiptClient;
import wsc.ReceiptcomponentClient;

/**
 *
 * @author Admin
 */
public class Employee_Checkout extends HttpServlet {

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
            String qrcodeid = request.getParameter("qrcodeid");
            String action = request.getParameter("action");
            QrcodeClient qrcodeClient = new QrcodeClient();
            ReceiptClient receiptClient = new ReceiptClient();
            ReceiptcomponentClient receiptcomponentClient = new ReceiptcomponentClient();
            SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
            GenericType<Qrcode> genQrcode = new GenericType<Qrcode>() {
            };
            GenericType<Receipt> genReceipt = new GenericType<Receipt>() {
            };
            GenericType<List<Receiptcomponent>> genReceiptcomponent = new GenericType<List<Receiptcomponent>>() {
            };
            if (qrcodeid != null) {
                Qrcode qrcode = qrcodeClient.find_JSON(genQrcode, qrcodeid);
                List<Receiptcomponent> listReceiptcomponents = receiptcomponentClient.findbyReceiptID_JSON(genReceiptcomponent, qrcode.getReceiptId().getReceiptId().toString());
                Receipt receipt = receiptClient.find_JSON(genReceipt, qrcode.getReceiptId().getReceiptId().toString());
                float realpay = 0;
                for (Receiptcomponent receiptcomponent : listReceiptcomponents) {
                    if (receiptcomponent.getStatus() != null) {
                        if (receiptcomponent.getStatus()) {
                            realpay += receiptcomponent.getSubtotal();
                        }
                    }
                }
                if (action != null && action.equals("deactive")) {
                    if (realpay == receipt.getTotal()) {
                        request.setAttribute("msg", "<div class='success'></div>"
                                + "         <script type=\"text/javascript\">\n"
                                + "            $('.success').each(function () {\n"
                                + "                swal(\"Check out successfully!!!\", \"\", \"success\");\n"
                                + "            });\n"
                                + "        </script>");
                    } else {
                        request.setAttribute("msg", "<div class='success'></div>"
                                + "         <script type=\"text/javascript\">\n"
                                + "            $('.success').each(function () {\n"
                                + "                swal(\"Check out fail,pay your bill first!!!\", \"\", \"error\");\n"
                                + "            });\n"
                                + "        </script>");
                    }
                }
                request.setAttribute("qrcode", qrcode);
            }

            request.getRequestDispatcher("AdminTemplate/employeecheckout.jsp").forward(request, response);
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
