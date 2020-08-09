/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import bean.UploadImg;
import bean.UploadServlet;
import entities.Accountemployee;
import entities.Location;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import wsc.AccountemployeeClient;
import wsc.LocationClient;

/**
 *
 * @author ADMIN
 */
public class Admin_AddLocation extends HttpServlet {

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
            request.getRequestDispatcher("AdminTemplate/addlocation.jsp").forward(request, response);
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
            if (session.getAttribute("accountemployeeid") != null) {
                int accountId =  (int) session.getAttribute("accountemployeeid");
                AccountemployeeClient accountemployeeClient = new AccountemployeeClient();
                GenericType<Accountemployee> genAccountemployee = new GenericType<Accountemployee>() {
                };
                Accountemployee accountemployee = accountemployeeClient.find_JSON(genAccountemployee, String.valueOf(accountId));
                if (accountemployee != null && accountemployee.getRoleId().getRoleId() == 1) {
                    //do your job
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
        try (PrintWriter out = response.getWriter()) {
            UploadServlet uploadServlet = new UploadServlet();

            LocationClient locationClient = new LocationClient();
            Location location = new Location();
            String name = null;
            String address = null;
            String introduce = null;
            String file = null;
            String existedFile = null;
            Map<String, Object> listrequest = uploadServlet.Upload(request, "img");
            for (Map.Entry<String, Object> entry : listrequest.entrySet()) {
                if (entry.getKey().equals("name")) {
                    name = (String) entry.getValue();
                }
                if (entry.getKey().equals("address")) {
                    address = (String) entry.getValue();
                }
                if (entry.getKey().equals("introduce")) {
                    introduce = (String) entry.getValue();
                }
                if (entry.getKey().equals("file")) {
                    file = (String) entry.getValue();
                }
                if (entry.getKey().equals("existedFile0")) {
                    existedFile = (String) entry.getValue();
                }
            }
            System.out.println("name:" + name);
            System.out.println("address:" + address);
            System.out.println("introduce:" + introduce);
            System.out.println("file:" + file);
            System.out.println(listrequest);

            location.setAddress(address);
            location.setIntroduce(introduce);
            location.setLocationName(name);
            if (file != null) {
                location.setLocationUrl(file);
            } else {
                location.setLocationUrl(existedFile);
            }

            locationClient.create_JSON(location);
            request.getRequestDispatcher("Admin_Location").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("AdminTemplate/addlocation.jsp").forward(request, response);
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
