/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import bean.UploadImg;
import bean.UploadServlet;
import entities.Accountemployee;
import entities.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.AccountemployeeClient;
import wsc.ServiceClient;

/**
 *
 * @author ADMIN
 */
public class Admin_UpdateService extends HttpServlet {

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
            String id = request.getParameter("id");
            ServiceClient serviceClient = new ServiceClient();
            GenericType<Service> genService = new GenericType<Service>() {
            };
            Service service = serviceClient.find_JSON(genService, id);
            request.setAttribute("service", service);
            request.getRequestDispatcher("AdminTemplate/updateservice.jsp").forward(request, response);
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
                if (sessionAccountemployee.getRoleId().getRoleId() == 1) {
                    //do your job here
                    String id = request.getParameter("id");
                    String action = request.getParameter("action");
                    if (action != null) {
                        ServiceClient serviceClient = new ServiceClient();
                        GenericType<Service> genService = new GenericType<Service>() {
                        };
                        Service service = serviceClient.find_JSON(genService, id);
                        if (action.equals("deactive")) {
                            service.setStatus(Boolean.FALSE);
                        }
                        if (action.equals("active")) {
                            service.setStatus(Boolean.TRUE);
                        }
                        serviceClient.edit_JSON(service, service.getServiceId().toString());
                        request.getRequestDispatcher("Admin_Services").forward(request, response);
                    } else {
                        processRequest(request, response);
                    }
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

        try (PrintWriter out = response.getWriter()) {
            UploadServlet uploadServlet = new UploadServlet();

            ServiceClient serviceClient = new ServiceClient();
            GenericType<Service> genService = new GenericType<Service>() {
            };

            String id = null;
            String name = null;
            String price = null;
            String description = null;
            String file = null;
            String existedFile = null;
            Map<String, Object> listrequest = uploadServlet.Upload(request, "services");
            for (Map.Entry<String, Object> entry : listrequest.entrySet()) {
                if (entry.getKey().equals("id")) {
                    id = (String) entry.getValue();
                }
                if (entry.getKey().equals("name")) {
                    name = (String) entry.getValue();
                }
                if (entry.getKey().equals("price")) {
                    price = (String) entry.getValue();
                }
                if (entry.getKey().equals("description")) {
                    description = (String) entry.getValue();
                }
                if (entry.getKey().equals("file")) {
                    file = (String) entry.getValue();
                }
                if (entry.getKey().equals("existedFile")) {
                    existedFile = (String) entry.getValue();
                }
            }
            System.out.println("id:" + id);
            System.out.println("name:" + name);
            System.out.println("price:" + price);
            System.out.println("description:" + description);
            System.out.println("file:" + file);
            System.out.println(listrequest);
            Service service = serviceClient.find_JSON(genService, id);

            service.setServiceName(name);
            service.setServicePrice(Float.parseFloat(price));
            service.setServiceDescription(description);
            if (file != null) {
                if (existedFile != null) {
                    service.setServiceurl(existedFile);
                } else {
                    service.setServiceurl(file);
                }
            }
            serviceClient.edit_JSON(service, id);
            request.getRequestDispatcher("Admin_Services").forward(request, response);
        } catch (Exception ex) {
            processRequest(request, response);
            System.out.println(ex.getMessage());
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
