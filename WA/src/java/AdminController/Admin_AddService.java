/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import bean.UploadServlet;
import entities.Accountemployee;
import entities.Service;
import entities.Servicetype;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.AccountemployeeClient;
import wsc.ServiceClient;
import wsc.ServicetypeClient;

/**
 *
 * @author ADMIN
 */
public class Admin_AddService extends HttpServlet {

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
            ServicetypeClient servicetypeClient=new ServicetypeClient();
            GenericType<List<Servicetype>> genericType=new GenericType<List<Servicetype>>(){};
            List<Servicetype> servicetypes=servicetypeClient.findAll_JSON(genericType);
            List<Servicetype> listServicetype = new ArrayList<>();
            for (Servicetype servicetype : servicetypes) {
                if (servicetype.getServiceTypeId()<4) {
                    listServicetype.add(servicetype);
                }
            }
            request.setAttribute("serviceType", listServicetype);
            /* TODO output your page here. You may use following sample code. */
            request.getRequestDispatcher("AdminTemplate/addservice.jsp").forward(request, response);
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
                    processRequest(request, response);
                    //end your job
                } else {
                    out.print("<h1>You do not have permission</h1>");
                }
            }else{
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
       
       
            UploadServlet uploadServlet = new UploadServlet();
            ServiceClient serviceClient=new ServiceClient();
            
            Service service=new Service();
            
            String serviceType=null;
            String name=null;
            String price=null;
            String decription=null;
            String file=null;
            String existedFile = null;
            Map<String,Object> listService=uploadServlet.Upload(request, "services");
            
            for (Map.Entry<String, Object> entry : listService.entrySet()) {
                if(entry.getKey().equals("serviceType")){
                    serviceType=entry.getValue().toString();
                }
                if(entry.getKey().equals("name")){
                    name=entry.getValue().toString();
                }
                if(entry.getKey().equals("price")){
                    price=entry.getValue().toString();
                }
                if(entry.getKey().equals("decription")){
                    decription=entry.getValue().toString();
                }
                if(entry.getKey().equals("file")){
                    file=entry.getValue().toString();
                }
                if (entry.getKey().equals("existedFile0")) {
                    existedFile = (String) entry.getValue();
                }
            }
            
            ServicetypeClient servicetypeClient=new ServicetypeClient();
            GenericType<Servicetype> genericType=new GenericType<Servicetype>(){};
            Servicetype servicetypes=servicetypeClient.find_JSON(genericType, serviceType);
            
            service.setStatus(Boolean.TRUE);
            service.setSerivceTypeId(servicetypes);
            service.setServiceDescription(decription);
            service.setServiceName(name);
            service.setServicePrice(Float.parseFloat(price));
            if (file != null) {
                service.setServiceurl(file);
            } else {
                service.setServiceurl(existedFile);
            }
            
            serviceClient.create_JSON(service);
            response.sendRedirect("Admin_Services");
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
