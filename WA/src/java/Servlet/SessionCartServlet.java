/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entities.Item;
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
import wsc.ServiceClient;

/**
 *
 * @author Admin
 */
public class SessionCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private int isExisting(int id, List<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getService().getServiceId().equals(id)) {
                return i;
            }
        }
        return -1;
    }

    protected void doGet_Buy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServiceClient serviceClient = new ServiceClient();
        GenericType<Service> genericType = new GenericType<Service>() {
        };
        Service service = new Service();
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            List<Item> cart = new ArrayList<Item>();
            cart.add(new Item(serviceClient.find_JSON(genericType, request.getParameter("serviceid")), 1));
            session.setAttribute("cart", cart);
        } else {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            int index = isExisting(Integer.valueOf(request.getParameter("serviceid")), cart);
            if (index == -1) {
                cart.add(new Item(serviceClient.find_JSON(genericType, request.getParameter("serviceid")), 1));
            } else {
                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
    }

    protected void doGet_Remove(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        int index = isExisting(Integer.valueOf(request.getParameter("serviceid")), cart);
        cart.remove(index);
        session.setAttribute("cart", cart);
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
    }

    protected void doGet_Update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") != null) {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            for (Item item : cart) {
                item.setQuantity(Integer.valueOf(request.getParameter("quantity"+cart.indexOf(item))));
            }
            session.setAttribute("cart", cart);
        }
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
    }
    protected void doGet_DisplayCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.sendRedirect("CustomerPageCartServlet?id=" + (String) session.getAttribute("qrcodeid"));
    }
    
    protected void doGet_Confirm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        //response.sendRedirect("CustomerPageCartServlet?id=" + (String) session.getAttribute("qrcodeid"));
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            doGet_DisplayCart(request, response);
        } else {
            if (action.equalsIgnoreCase("add")) {
                doGet_Buy(request, response);
            } else if (action.equalsIgnoreCase("remove")) {
                doGet_Remove(request, response);
            } else if (action.equalsIgnoreCase("update")) {
                doGet_Update(request, response);
            } else if (action.equalsIgnoreCase("confirm")) {
                doGet_Confirm(request, response);
            }
        }
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
