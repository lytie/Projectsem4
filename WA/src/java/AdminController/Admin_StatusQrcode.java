/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import entities.Qrcode;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.QrcodeClient;

/**
 *
 * @author longly
 */
public class Admin_StatusQrcode extends HttpServlet {

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
            
            
            
            String status=request.getParameter("status");
            String id=request.getParameter("id");
            
            QrcodeClient qrcodeClient = new QrcodeClient();
            GenericType<Qrcode> genericType = new GenericType<Qrcode>() {
            };
            Qrcode qrcode = qrcodeClient.find_JSON(genericType, id);
            
            
            Date date=new Date();
                   
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.DATE, -1);
           
            
            
            
            if(status.equals("deactivate")){
                qrcode.setStatus(Boolean.FALSE);
                qrcode.setCheckOutDate(cal.getTime());
                
                
            }else if(status.equals("active")){
                qrcode.setStatus(Boolean.TRUE);
                
            }else if(status.equals("cancel")){
                qrcode.setStatus(Boolean.FALSE);
                qrcode.setAccountCustomerId(null);
                qrcode.setCheckInDate(cal.getTime());
                qrcode.setCheckOutDate(cal.getTime());
            }
            qrcodeClient.edit_JSON(qrcode,id);
            request.getRequestDispatcher("Admin_QrCode").forward(request, response);
            
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
