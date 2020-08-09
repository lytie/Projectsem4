/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import entities.Accountemployee;
import entities.ImgHero;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.AccountemployeeClient;
import wsc.ImgHeroClient;

/**
 *
 * @author longly
 */
public class Admin_ImgHero extends HttpServlet {

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

        ImgHeroClient imgHeroClient = new ImgHeroClient();
        GenericType<List<ImgHero>> imgHeroType = new GenericType<List<ImgHero>>() {
        };
        List<ImgHero> list = imgHeroClient.findAll_JSON(imgHeroType);

        request.setAttribute("listImg", list);
        request.getRequestDispatcher("AdminTemplate/Img_Hero.jsp").forward(request, response);

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

        ImgHeroClient imgHeroClient = new ImgHeroClient();
        GenericType<List<ImgHero>> imgHeroType = new GenericType<List<ImgHero>>() {
        };
        List<ImgHero> list = imgHeroClient.findAll_JSON(imgHeroType);

        for (ImgHero imgHero : list) {

            imgHero.setChoose(Boolean.FALSE);
            imgHeroClient.edit_JSON(imgHero, imgHero.getIdHero().toString());

        }

        for (int i = 1; i <= list.size(); i++) {

            String c = request.getParameter("choose" + i);
            System.out.println("choose" + c);
            String top=request.getParameter("top"+i);
            String under=request.getParameter("under"+i);
            for (ImgHero imgHero : list) {
                if (c != null) {
                    if (imgHero.getIdHero() == Integer.parseInt(c)) {
                        imgHero.setChoose(Boolean.TRUE);
                        imgHeroClient.edit_JSON(imgHero, imgHero.getIdHero().toString());
                    }
                }
                if(imgHero.getIdHero()==i){
                    imgHero.setTextShort(under);
                    imgHero.setTextTitle(top);
                    imgHeroClient.edit_JSON(imgHero, imgHero.getIdHero().toString());
                }

            }

        }
    request.setAttribute("success", "success");
        request.setAttribute("listImg", list);
        request.getRequestDispatcher("AdminTemplate/Img_Hero.jsp").forward(request, response);
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
