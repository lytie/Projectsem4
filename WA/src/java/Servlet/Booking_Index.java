/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import wsc.*;
import entities.*;
import javax.ws.rs.core.GenericType;

/**
 *
 * @author longly
 */
public class Booking_Index extends HttpServlet {

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

//      list  img_hero
        Img_hero ih = new Img_hero();
        GenericType<List<ImgHero>> responseType = new GenericType< List<ImgHero>>() {
        };

        List<ImgHero> list = ih.findAll_JSON(responseType);
        request.setAttribute("listImgHero", list);

//            list location
        LocationClient location = new LocationClient();
        GenericType<List<Location>> gen = new GenericType<List<Location>>() {
        };
        List<Location> listLoc = location.findAll_JSON(gen);
        request.setAttribute("listLocation", listLoc);

//Top type room
        RoomtypeClient type = new RoomtypeClient();
        GenericType<List<Roomtype>> typ = new GenericType<List<Roomtype>>() {
        };
        List<Roomtype> listType = type.findAll_JSON(typ);
        request.setAttribute("listType", listType);

        request.getRequestDispatcher("Booking/index.jsp").forward(request, response);

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

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
