/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import bean.UploadServlet;
import entities.ImgHero;
import entities.Location;
import entities.Room;
import entities.Roomimage;
import entities.Roomtype;
import entities.VConvenientroom;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.ImgHeroClient;
import wsc.LocationClient;
import wsc.RoomClient;
import wsc.RoomimageClient;
import wsc.RoomtypeClient;
import wsc.VConvenientroomClient;

/**
 *
 * @author ADMIN
 */
public class Admin_UpdateRoom extends HttpServlet {

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
            RoomClient roomClient = new RoomClient();
            RoomtypeClient roomtypeClient = new RoomtypeClient();
            LocationClient client = new LocationClient();
            RoomimageClient roomimageClient = new RoomimageClient();
            VConvenientroomClient vConvenientroomClient = new VConvenientroomClient();
            GenericType<Room> genRoom = new GenericType<Room>() {
            };
            GenericType<List<Location>> genListLocation = new GenericType<List<Location>>() {
            };
            GenericType<List<Roomtype>> genListRoomtype = new GenericType<List<Roomtype>>() {
            };
            GenericType<List<Roomimage>> genListRoomimage = new GenericType<List<Roomimage>>() {
            };
            GenericType<List<VConvenientroom>> genListVConvenientroom = new GenericType<List<VConvenientroom>>() {
            };
            
            Room room = roomClient.find_JSON(genRoom, id);
            List<Location> listLocation = client.findAll_JSON(genListLocation);
            List<Roomtype> listRoomType = roomtypeClient.findAll_JSON(genListRoomtype);
            List<Roomimage> listRoomimage = roomimageClient.getImg_JSON(genListRoomimage, Integer.parseInt(id));
            List<VConvenientroom> listVConvenientrooms = vConvenientroomClient.convenientImg_JSON(genListVConvenientroom, Integer.parseInt(id));
            
            for (Roomimage roomimage : listRoomimage) {
                System.out.println("url:" + roomimage.getUrl());
            }
            request.setAttribute("listVConvenientrooms",listVConvenientrooms);
            request.setAttribute("listRoomimage", listRoomimage);
            request.setAttribute("listLocation", listLocation);
            request.setAttribute("listRoomType", listRoomType);
            request.setAttribute("room", room);
            request.getRequestDispatcher("AdminTemplate/updateroom.jsp").forward(request, response);
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

        RoomClient roomClient = new RoomClient();
        RoomtypeClient roomtypeClient = new RoomtypeClient();
        LocationClient locationClient = new LocationClient();
        RoomimageClient roomimageClient = new RoomimageClient();
        GenericType<Room> genRoom = new GenericType<Room>() {
        };
        GenericType<Location> genLocation = new GenericType<Location>() {
        };
        GenericType<Roomtype> genRoomtype = new GenericType<Roomtype>() {
        };
        GenericType<List<Roomimage>> genListRoomimage = new GenericType<List<Roomimage>>() {
        };
        UploadServlet upload = new UploadServlet();
        Map<String, Object> form = upload.Upload(request, "images");
        String roomid = null;
        String locationid = null;
        String roomtypeid = null;
        String price = null;
        String capacity = null;
        String description = null;
        String bedoption = null;
        String size = null;
        String view = null;
        String demo = null;
        for (Map.Entry<String, Object> entry : form.entrySet()) {
            if (entry.getKey().equals("roomid")) {
                roomid = (String) entry.getValue();
            }
            if (entry.getKey().equals("locationid")) {
                locationid = (String) entry.getValue();
            }
            if (entry.getKey().equals("roomtypeid")) {
                roomtypeid = (String) entry.getValue();
            }
            if (entry.getKey().equals("price")) {
                price = (String) entry.getValue();
            }
            if (entry.getKey().equals("capacity")) {
                capacity = (String) entry.getValue();
            }
            if (entry.getKey().equals("description")) {
                description = (String) entry.getValue();
            }
            if (entry.getKey().equals("bedoption")) {
                bedoption = (String) entry.getValue();
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
        List<String> listImg = new ArrayList<>();
        if (demo != null) {
            for (Map.Entry<String, Object> entry : form.entrySet()) {
                for (int i = 0; i < Integer.parseInt(demo); i++) {
                    if (entry.getKey().equals("image" + i)) {
                        listImg.add((String) entry.getValue());
                    }
                }
            }
        }
        Room room = roomClient.find_JSON(genRoom, roomid);
        List<Roomimage> listRoomimage = roomimageClient.getImg_JSON(genListRoomimage, Integer.parseInt(roomid));
        for (Map.Entry<String, Object> entry : form.entrySet()) {
            for (int i = 0; i < listRoomimage.size(); i++) {
                if (entry.getKey().equals("currentfile" + i)) {
                    listImg.add((String) entry.getValue());
                }
                if (entry.getKey().equals("existedFile" + i)) {
                    listImg.add((String) entry.getValue());
                }
            }
        }
        System.out.println(roomid);
        System.out.println(locationid);
        System.out.println(roomtypeid);
        System.out.println(price);
        System.out.println(capacity);
        System.out.println(description);
        System.out.println(bedoption);
        System.out.println(size);
        System.out.println(view);
        System.out.println(demo);
        System.out.println(form);
        System.out.println(listImg);

        room.setLocationId(locationClient.find_JSON(genLocation, Integer.parseInt(locationid)));
        room.setRoomTypeId(roomtypeClient.find_JSON(genRoomtype, roomtypeid));
        room.setPrice(Float.parseFloat(price));
        room.setStatus(Boolean.TRUE);
        room.setCapacity(Integer.parseInt(capacity));
        room.setDescription(description);
        room.setBedOption(bedoption);
        room.setSize(size);
        room.setView(view);

        for (Roomimage roomimage : listRoomimage) {
            roomimageClient.remove(roomimage.getRoomImageId().toString());
        }
        Roomimage roomimage = new Roomimage();
        for (int i = 0; i < listImg.size(); i++) {
            roomimage.setRoomId(room);
            roomimage.setUrl(listImg.get(i));
            roomimageClient.create_JSON(roomimage);
        }
        System.out.println("locationid:" + room.getLocationId());
        System.out.println("RoomTypeId:" + room.getRoomTypeId());
        System.out.println("price:" + room.getPrice());
        System.out.println("capacity:" + room.getCapacity());
        System.out.println("description:" + room.getDescription());
        System.out.println("description lenght" + room.getDescription().length());
        System.out.println("bedoption:" + room.getBedOption());
        System.out.println("size:" + room.getSize());
        System.out.println("view:" + room.getView());

        roomClient.edit_XML(room, roomid);
        //processRequest(request, response);
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
