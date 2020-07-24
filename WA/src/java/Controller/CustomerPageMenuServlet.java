package Controller;

import entities.Qrcode;
import entities.Service;
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
import wsc.ServiceClient;

/**
 *
 * @author Admin
 */
public class CustomerPageMenuServlet extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");

        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            QrcodeClient qrcodeClient = new QrcodeClient();
            GenericType<Qrcode> genericType = new GenericType<Qrcode>() {
            };
            Qrcode qrcode = new Qrcode();
            if (session.getAttribute("qrcodeid") == null ) {
                if (request.getParameter("id") == null) {
                    out.print("Error");
                } else {
                    qrcode = qrcodeClient.find_JSON(genericType, request.getParameter("id"));
                    if (qrcode != null) {
                        session.setAttribute("qrcodeid", qrcode.getQrCodeId());
                        request.getRequestDispatcher("/CustomerPageMenuServlet").forward(request, response);
                    } else {
                        out.print("Not found qrcode");
                    }
                }
            } else {
                ServiceClient serviceClient = new ServiceClient();
                GenericType<List<Service>> genericListService = new GenericType<List<Service>>() {
                };
                List<Service> listfood = new ArrayList<Service>();
                List<Service> listdrink = new ArrayList<Service>();
                listfood = serviceClient.listfood_JSON(genericListService);
                listdrink = serviceClient.listdrink_JSON(genericListService);
                request.setAttribute("listfood", listfood);
                request.setAttribute("listdrink", listdrink);
                request.getRequestDispatcher("/customerpage/menu.jsp").forward(request, response);
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
