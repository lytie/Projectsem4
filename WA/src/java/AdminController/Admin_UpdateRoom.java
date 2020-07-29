/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package AdminController;

import entities.ImgHero;
import entities.Room;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.ImgHeroClient;
import wsc.RoomClient;

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
            /* TODO output your page here. You may use following sample code. */
            
            
//            int id=Integer.parseInt(request.getParameter("IdRoom"));
//            float price=Float.valueOf(request.getParameter("priceUp"));
            RoomClient roomClient=new RoomClient();
            GenericType<Room> gtRoom=new GenericType<Room>(){};
            Room room=roomClient.find_JSON(gtRoom, 2);
//            out.println(room.getPrice());
            room.setPrice(60.0f);
//            out.println(room.getPrice());
            roomClient.edit_JSON(room, room.getRoomId().toString());
//            
//            out.println(room.getPrice());
//            
             Room room1=roomClient.find_JSON(gtRoom, 2);
             out.println(room1.getPrice());


//                ImgHeroClient client=new ImgHeroClient();
//                GenericType<ImgHero> gtHero=new GenericType<ImgHero>(){};
//                ImgHero img=client.find_JSON(gtHero, 1);
//                img.setTextTitle("maybe");
//                client.edit_JSON(img, img.getIdHero().toString());
//                
//                ImgHero img1=client.find_JSON(gtHero, 1);
//               
//                out.print(img.getTextTitle());
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
