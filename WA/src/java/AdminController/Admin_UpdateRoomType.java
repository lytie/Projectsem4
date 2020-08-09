/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import bean.UploadServlet;
import entities.Accountemployee;
import entities.Roomtype;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.AccountemployeeClient;
import wsc.RoomtypeClient;

/**
 *
 * @author ADMIN
 */
public class Admin_UpdateRoomType extends HttpServlet {

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
            RoomtypeClient client = new RoomtypeClient();
            GenericType<Roomtype> type = new GenericType<Roomtype>() {
            };
            Roomtype roomtype = client.find_JSON(type, id);

            request.setAttribute("roomtype", roomtype);
            request.getRequestDispatcher("AdminTemplate/updateroomtype.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        try (PrintWriter out = response.getWriter()) {
            UploadServlet uploadServlet = new UploadServlet();

            RoomtypeClient roomtypeClient = new RoomtypeClient();
            GenericType<Roomtype> type = new GenericType<Roomtype>() {
            };
            String ids = null;
            String name = null;
            String description = null;
            String file = null;
            String existedFile = null;
            Map<String, Object> listrequest = uploadServlet.Upload(request, "img");
            for (Map.Entry<String, Object> entry : listrequest.entrySet()) {
                if (entry.getKey().equals("id")) {
                    ids = (String) entry.getValue();
                }
                if (entry.getKey().equals("name")) {
                    name = (String) entry.getValue();
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
            System.out.println("id:" + ids);
            System.out.println("name:" + name);
            System.out.println("description:" + description);
            System.out.println("file:" + file);
            System.out.println(listrequest);
            Roomtype roomtype = roomtypeClient.find_JSON(type, ids);

            roomtype.setRoomTypeName(name);
            roomtype.setDescription(description);
            if (file != null) {
                if (existedFile !=null) {
                    roomtype.setUrl(existedFile);
                }else{
                    roomtype.setUrl(file);
                }
            }

            roomtypeClient.edit_JSON(roomtype, ids);
            request.getRequestDispatcher("Admin_RoomType").forward(request, response);
        } catch (Exception ex) {
            RoomtypeClient client = new RoomtypeClient();
            GenericType<Roomtype> type = new GenericType<Roomtype>() {
            };
            Roomtype roomtype = client.find_JSON(type, id);

            request.setAttribute("roomtype", roomtype);
            request.setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("AdminTemplate/addroomtype.jsp").forward(request, response);
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
