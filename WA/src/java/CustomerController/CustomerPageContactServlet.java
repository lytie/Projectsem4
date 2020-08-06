package CustomerController;

import entities.Feedback;
import entities.Qrcode;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Instant;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.FeedbackClient;
import wsc.QrcodeClient;

/**
 *
 * @author Admin
 */
public class CustomerPageContactServlet extends HttpServlet {

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
                        session.setAttribute("status", qrcode.getStatus());
                        request.getRequestDispatcher("/CustomerPageContactServlet").forward(request, response);
                    } else {
                        out.print("Not found qrcode");
                    }
                }
            } else {
                request.getRequestDispatcher("/customerpage/contact.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        if (session.getAttribute("qrcodeid") != null) {
            String message = request.getParameter("message");
            String id = session.getAttribute("qrcodeid").toString();
            QrcodeClient qrcodeClient = new QrcodeClient();
            GenericType<Qrcode> genericType = new GenericType<Qrcode>() {
            };
            Qrcode qrcode = qrcodeClient.find_JSON(genericType, id);
            FeedbackClient feedbackClient = new FeedbackClient();
            Feedback feedback = new Feedback();
            feedback.setQrCodeId(qrcode);
            feedback.setFeedBackMessage(message);
            feedback.setFeedBackTime(Date.from(Instant.now()));
            feedbackClient.create_JSON(feedback);
            request.getRequestDispatcher("CustomerPageIndexServlet").forward(request, response);
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
