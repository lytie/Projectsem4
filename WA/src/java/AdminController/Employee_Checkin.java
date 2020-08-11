/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package AdminController;

import entities.Accountemployee;
import entities.Qrcode;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.QrcodeClient;

/**
 *
 * @author Admin
 */
public class Employee_Checkin extends HttpServlet {

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
            String qrcodeid = request.getParameter("qrcodeid");
            String action = request.getParameter("action");
            QrcodeClient qrcodeClient = new QrcodeClient();
            SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
            GenericType<Qrcode> genQrcode = new GenericType<Qrcode>(){};
            Qrcode qrcode = qrcodeClient.find_JSON(genQrcode, qrcodeid);
            
            if (action!=null && action.equals("active")) {
                if (dateFormat.format(qrcode.getCheckInDate()).equals(dateFormat.format(new Date()))) {
                    qrcode.setStatus(Boolean.TRUE);
                    qrcodeClient.edit_JSON(qrcode, qrcode.getQrCodeId());
                    request.setAttribute("msg", "<div class='success'></div>"
                        + "         <script type=\"text/javascript\">\n"
                        + "            $('.success').each(function () {\n"
                        + "                swal(\"Check in successfully!!!\", \"\", \"success\");\n"
                        + "            });\n"
                        + "        </script>");
                }else{
                    request.setAttribute("msg", "<div class='success'></div>"
                        + "         <script type=\"text/javascript\">\n"
                        + "            $('.success').each(function () {\n"
                        + "                swal(\"Your check in date is not today!!!\", \"\", \"error\");\n"
                        + "            });\n"
                        + "        </script>");
                }
            }
            request.setAttribute("qrcode", qrcode);
            request.getRequestDispatcher("AdminTemplate/employeecheckin.jsp").forward(request, response);
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
            HttpSession session = request.getSession();
            Accountemployee sessionAccountemployee = (Accountemployee) session.getAttribute("accountemployee");
            if (sessionAccountemployee != null) {
                if (sessionAccountemployee.getStatus()) {
                    //do your job here
                    processRequest(request, response);
                    //end your job
                } else {
                    out.print("<h1>You do not have permission</h1>");
                }
            } else {
                request.getRequestDispatcher("Admin_Login").forward(request, response);
            }
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
