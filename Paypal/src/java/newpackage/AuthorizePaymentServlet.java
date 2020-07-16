/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import com.paypal.base.rest.PayPalRESTException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AuthorizePaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AuthorizePaymentServlet at " + request.getContextPath() + "</h1>");
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
        String product = request.getParameter("product");
        Float subtotal = Float.parseFloat(request.getParameter("subtotal"));
        Float shipping = Float.parseFloat(request.getParameter("shipping"));
        Float tax = Float.parseFloat(request.getParameter("tax"));
        Float total = Float.parseFloat(request.getParameter("total"));

        OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);
        /*try (PrintWriter out = response.getWriter()) {
            out.println(orderDetail.getSubtotal() + "<br/>");
            out.println(orderDetail.getShipping() + "<br/>");
            out.println(orderDetail.getTax() + "<br/>");
            out.println(orderDetail.getTotal()+ "<br/>");

        }*/
        try {
         PaymentServices paymentServices = new PaymentServices();
         String approvalLink = paymentServices.authorizePayment(orderDetail);

         response.sendRedirect(approvalLink);
			
         } catch (PayPalRESTException ex) {
         request.setAttribute("errorMessage", ex.getMessage());
         ex.printStackTrace();
         request.getRequestDispatcher("error.jsp").forward(request, response);
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
