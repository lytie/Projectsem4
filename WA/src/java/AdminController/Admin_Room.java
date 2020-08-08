/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import com.google.gson.Gson;
import entities.Location;
import entities.Qrcode;
import entities.Room;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.AdminIndexClient;
import wsc.LocationClient;

/**
 *
 * @author Admin
 */
public class Admin_Room extends HttpServlet {

    AdminIndexClient adminIndexClient = new AdminIndexClient();
    LocationClient locationClient = new LocationClient();
    GenericType<List<Qrcode>> genListQrcode = new GenericType<List<Qrcode>>() {
    };
    GenericType<List<Room>> genListRoom = new GenericType<List<Room>>() {
    };
    GenericType<List<Location>> genListLocation = new GenericType<List<Location>>() {
    };
    Date now = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
            String locationid = request.getParameter("locationid");
            String start = request.getParameter("start");
            String end = request.getParameter("end");
            out.println(locationid);
            out.println(start);
            out.println(end);
            Calendar calendar1 = Calendar.getInstance();
            calendar1.setTime(dateFormat.parse(dateFormat.format(now)));
            Calendar calendar2 = Calendar.getInstance();
            List<Location> listLocation = locationClient.findAll_JSON(genListLocation);
            List<Qrcode> listQrcodeInUse;
            List<Room> listRoomNotInUse;

            if (start == null || end == null) {
                request.setAttribute("listLocation", listLocation);
                request.getRequestDispatcher("AdminTemplate/roombooking.jsp").forward(request, response);
                listQrcodeInUse = adminIndexClient.getQrcodeInUse(genListQrcode, "2020-01-01", dateFormat.format(now));
                listRoomNotInUse = adminIndexClient.getRoomNotInUse(genListRoom, "2020-01-01", dateFormat.format(now));
            } else {
                listQrcodeInUse = adminIndexClient.getQrcodeInUse(genListQrcode, start, end);
                listRoomNotInUse = adminIndexClient.getRoomNotInUse(genListRoom, start, end);
            }

            List<Qrcode> listQrcodeInUse2 = new ArrayList<Qrcode>();
            List<Room> listClear = new ArrayList<Room>();
            List<Qrcode> listInUse = new ArrayList<Qrcode>();
            List<Qrcode> listReserved = new ArrayList<Qrcode>();
            List<Qrcode> listPrepareToCheckout = new ArrayList<Qrcode>();
            if (locationid == null || locationid.equals("findall")) {
                for (Qrcode qrcode : listQrcodeInUse) {
                    listQrcodeInUse2.add(qrcode);
                }
                for (Room room : listRoomNotInUse) {
                    listClear.add(room);
                }
            } else {
                for (Qrcode qrcode : listQrcodeInUse) {
                    if (qrcode.getRoomId().getLocationId().getLocationId().equals(Integer.valueOf(locationid))) {
                        listQrcodeInUse2.add(qrcode);
                    }
                }
                for (Room room : listRoomNotInUse) {
                    if (room.getLocationId().getLocationId().equals(Integer.valueOf(locationid))) {
                        listClear.add(room);
                    }
                }
            }

            for (Qrcode qrcode : listQrcodeInUse2) {
                if (qrcode.getStatus()) {
                    //Check if checkout time tomorrow;
                    calendar2.setTime(dateFormat.parse(dateFormat.format(qrcode.getCheckOutDate())));
                    calendar2.add(Calendar.DATE, -1);
                    if (calendar2.getTime().equals(calendar1.getTime())) {
                        listPrepareToCheckout.add(qrcode);
                    } else {
                        listInUse.add(qrcode);
                    }
                } else {
                    listReserved.add(qrcode);
                }
            }

            request.setAttribute("listLocation", listLocation);
            request.setAttribute("listClear", listClear);
            request.setAttribute("listInUse", listInUse);
            request.setAttribute("listReserved", listReserved);
            request.setAttribute("listPrepareToCheckout", listPrepareToCheckout);
            request.getRequestDispatcher("AdminTemplate/roombooking.jsp").forward(request, response);
        } catch (ParseException ex) {
            System.out.println("error:" + ex.getMessage());
            Logger.getLogger(Employee_Room.class.getName()).log(Level.SEVERE, null, ex);
        }

        //processRequest(request, response);
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
