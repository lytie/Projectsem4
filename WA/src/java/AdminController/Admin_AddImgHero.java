/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import bean.UploadServlet;
import entities.Accountemployee;
import entities.ImgHero;
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
import wsc.ImgHeroClient;

/**
 *
 * @author longly
 */
public class Admin_AddImgHero extends HttpServlet {

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

        request.getRequestDispatcher("AdminTemplate/Add_ImgHero.jsp").forward(request, response);
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

        UploadServlet upload = new UploadServlet();
        Map<String, Object> listImgHero = upload.Upload(request, "img");
        String top = null;
        String under = null;
        String img = null;
        String choose = null;
        for (Map.Entry<String, Object> entry : listImgHero.entrySet()) {

            if (entry.getKey().equals("top")) {
                top = entry.getValue().toString();
            }
            if (entry.getKey().equals("under")) {
                under = entry.getValue().toString();
            }
            if (entry.getKey().equals("file")) {
                img = entry.getValue().toString();
            }
            if (entry.getKey().equals("choose")) {
                choose = entry.getValue().toString();
            }

        }

        boolean c = false;
        System.out.println("choose:" + choose);
        if (choose != null) {
            if (choose.equals("true")) {

                c = true;
            }
        }

        ImgHeroClient heroClient = new ImgHeroClient();
        ImgHero hero = new ImgHero();

        hero.setChoose(c);

        hero.setImg(img);

        hero.setTextShort(under);

        hero.setTextTitle(top);

        heroClient.create_JSON(hero);

        request.setAttribute("success", "success");
        request.getRequestDispatcher("AdminTemplate/Add_ImgHero.jsp").forward(request, response);

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
