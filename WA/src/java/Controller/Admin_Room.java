/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import entities.Location;
import entities.Room;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.LocationClient;
import wsc.RoomClient;

/**
 *
 * @author ADMIN
 */
public class Admin_Room extends HttpServlet {

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
           RoomClient roomClient = new RoomClient();
            GenericType<List<Room>> typ = new GenericType<List<Room>>() {
            };
            List<Room> listroom = roomClient.findAll_JSON(typ);
            
            List<Room> list=new ArrayList<>();
            
            int loca=1;
            
            if(request.getParameter("location")!=null){
                loca=Integer.valueOf(request.getParameter("location"));
            }
            
            
            for (Room room : listroom) {
                if(room.getLocationId().getLocationId()==loca){
                    list.add(room);
                }
            }
            
            request.setAttribute("listroom", list);
           
            
            LocationClient locationCli=new LocationClient();
            GenericType<Location> gLocation=new GenericType<Location>(){};
            Location oneLocation= locationCli.find_JSON(gLocation, loca);
            
            request.setAttribute("locationOne", oneLocation);

             request.getRequestDispatcher("AdminTemplate/room.jsp").forward(request, response);
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
