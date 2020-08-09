/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import bean.UploadServlet;
import entities.Accountemployee;
import entities.Location;
import entities.Room;
import entities.Roomimage;
import entities.Roomtype;
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
import wsc.LocationClient;
import wsc.RoomClient;
import wsc.RoomimageClient;
import wsc.RoomtypeClient;

/**
 *
 * @author ADMIN
 */
public class Admin_AddRoom extends HttpServlet {

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

            LocationClient client = new LocationClient();
            GenericType<List<Location>> locationType = new GenericType<List<Location>>() {
            };
            List<Location> listLocation = client.findAll_JSON(locationType);

            RoomtypeClient roomtypeClient = new RoomtypeClient();
            GenericType<List<Roomtype>> type = new GenericType<List<Roomtype>>() {
            };
            List<Roomtype> listRoomType = roomtypeClient.findAll_JSON(type);

            request.setAttribute("location", listLocation);
            request.setAttribute("roomType", listRoomType);

            request.getRequestDispatcher("AdminTemplate/addroom.jsp").forward(request, response);
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

            UploadServlet upload = new UploadServlet();
            Map<String, Object> listRoom = upload.Upload(request, "images");

            String location = null;
            String roomType = null;
            String price = null;
            String adult = null;
            String children = null;
            String description = null;
            String bed = null;
            String size = null;
            String view = null;
            String demo = null;
            for (Map.Entry<String, Object> entry : listRoom.entrySet()) {
                if (entry.getKey().equals("location")) {
                    location = (String) entry.getValue();
                }
                if (entry.getKey().equals("roomType")) {
                    roomType = (String) entry.getValue();
                }
                if (entry.getKey().equals("price")) {
                    price = (String) entry.getValue();
                }
                if (entry.getKey().equals("adult")) {
                    adult = (String) entry.getValue();
                }
                if (entry.getKey().equals("children")) {
                    children = (String) entry.getValue();
                }
                if (entry.getKey().equals("description")) {
                    description = (String) entry.getValue();
                }
                if (entry.getKey().equals("bed")) {
                    bed = (String) entry.getValue();
                }
                if (entry.getKey().equals("size")) {
                    size = (String) entry.getValue();
                }
                if (entry.getKey().equals("view")) {
                    view = (String) entry.getValue();
                }
                if (entry.getKey().equals("demo")) {
                    demo = (String) entry.getValue();
                }
            }
            System.out.println(listRoom);
            System.out.println(location);
            System.out.println(roomType);
            System.out.println(price);
            System.out.println(adult);
            System.out.println(children);
            System.out.println(description);
            System.out.println(bed);
            System.out.println(size);
            System.out.println(view);
            System.out.println(demo);
            int capacity = Integer.parseInt(adult) * 2 + Integer.parseInt(children);

            LocationClient locationClient = new LocationClient();
            GenericType<Location> locaType = new GenericType<Location>() {
            };
            Location l = locationClient.find_JSON(locaType, Integer.parseInt(location));

            RoomtypeClient typeClient = new RoomtypeClient();
            GenericType<Roomtype> typeGen = new GenericType<Roomtype>() {
            };
            Roomtype r = typeClient.find_JSON(typeGen, roomType);

            RoomClient roomClient = new RoomClient();
            Room room = new Room();

            room.setBedOption(bed);
            room.setCapacity(capacity);
            room.setDescription(description);
            room.setLocationId(l);
            room.setPrice(Float.parseFloat(price));
            room.setRoomTypeId(r);
            room.setSize(size);
            room.setStatus(Boolean.FALSE);
            room.setView(view);
            room.setStatus(Boolean.TRUE);
            roomClient.create_JSON(room);

            List<String> listImg = new ArrayList<>();

            for (Map.Entry<String, Object> entry : listRoom.entrySet()) {

                for (int i = 0; i < Integer.parseInt(demo); i++) {
                    if (entry.getKey().equals("image" + i)) {
                        listImg.add((String) entry.getValue());
                    }
                }
            }

            GenericType<Room> roomGen = new GenericType<Room>() {
            };
            Room lRoom = roomClient.last_JSON(roomGen);

            RoomimageClient roomimageClient = new RoomimageClient();

            for (String st : listImg) {
                Roomimage roomimage = new Roomimage();
                roomimage.setUrl(st);
                System.out.println("anh upload" + st);
                roomimage.setRoomId(lRoom);
                roomimageClient.create_JSON(roomimage);

            }

            request.getRequestDispatcher("Admin_ListRoom").forward(request, response);

        } catch (Exception e) {
            LocationClient client = new LocationClient();
            GenericType<List<Location>> locationType = new GenericType<List<Location>>() {
            };
            List<Location> listLocation = client.findAll_JSON(locationType);

            RoomtypeClient roomtypeClient = new RoomtypeClient();
            GenericType<List<Roomtype>> type = new GenericType<List<Roomtype>>() {
            };
            List<Roomtype> listRoomType = roomtypeClient.findAll_JSON(type);

            request.setAttribute("location", listLocation);
            request.setAttribute("roomType", listRoomType);
            request.setAttribute("error", e);
            request.getRequestDispatcher("AdminTemplate/addroom.jsp").forward(request, response);
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
