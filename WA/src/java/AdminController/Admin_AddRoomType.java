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
import java.util.List;
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
public class Admin_AddRoomType extends HttpServlet {

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
            request.getRequestDispatcher("AdminTemplate/addroomtype.jsp").forward(request, response);
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
        try {
            UploadServlet uploadServlet = new UploadServlet();
            RoomtypeClient roomtypeClient = new RoomtypeClient();
            Roomtype roomtype = new Roomtype();

            String name = null;
            String description = null;
            String img = null;
            String existedFile = null;

            Map<String, Object> listRoomType = uploadServlet.Upload(request, "img");

            for (Map.Entry<String, Object> object : listRoomType.entrySet()) {

                if (object.getKey().equals("name")) {
                    name = object.getValue().toString();
                }
                if (object.getKey().equals("decription")) {
                    description = object.getValue().toString();
                }
                if (object.getKey().equals("file")) {
                    img = object.getValue().toString();
                }
                if (object.getKey().equals("existedFile0")) {
                    existedFile = (String) object.getValue();
                }
            }

            roomtype.setDescription(description);
            roomtype.setRoomTypeName(name);
            if (img != null) {
                roomtype.setUrl(img);
            } else {
                roomtype.setUrl(existedFile);
            }
            roomtypeClient.create_JSON(roomtype);

            RoomtypeClient roomtypeClients = new RoomtypeClient();
            GenericType<List<Roomtype>> typ = new GenericType<List<Roomtype>>() {
            };
            List<Roomtype> listType = roomtypeClients.findAll_JSON(typ);
            request.setAttribute("listType", listType);

            request.getRequestDispatcher("AdminTemplate/roomtype.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", e);
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
