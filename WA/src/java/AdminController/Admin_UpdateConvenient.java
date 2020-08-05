/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package AdminController;

import bean.UploadServlet;
import entities.Convenient;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.ConvenientClient;

/**
 *
 * @author ADMIN
 */
public class Admin_UpdateConvenient extends HttpServlet {

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
            String id=request.getParameter("id");
            ConvenientClient client=new ConvenientClient();
            GenericType<Convenient> type=new GenericType<Convenient>(){};
            Convenient convenient=client.find_JSON(type, Integer.parseInt(id));
            
            request.setAttribute("convenient", convenient);
             request.getRequestDispatcher("AdminTemplate/updateconvenient.jsp").forward(request, response);
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
            throws ServletException, IOException
    {
        String id=request.getParameter("id");
       try (PrintWriter out = response.getWriter()){
            UploadServlet uploadServlet = new UploadServlet();

            ConvenientClient convenientClient = new ConvenientClient();
            GenericType<Convenient> type=new GenericType<Convenient>(){};
             String ids = null;
            String name = null;
            String file = null;
            Map<String,Object> listrequest = uploadServlet.Upload(request, "img");
            for (Map.Entry<String, Object> entry : listrequest.entrySet()) {
                if (entry.getKey().equals("id")) {
                    ids = (String) entry.getValue();
                }
                if (entry.getKey().equals("name")) {
                    name = (String) entry.getValue();
                }
                
                if (entry.getKey().equals("file")) {
                    file = (String) entry.getValue();
                }
            }
             System.out.println("id:"+ids);
            System.out.println("name:"+name);
            System.out.println("file:"+file);
            System.out.println(listrequest);
            Convenient convenient = convenientClient.find_JSON(type, Integer.parseInt(ids));

            convenient.setConvenientName(name);
            if(file!=null){
            convenient.setUrl(file);
            }

            convenientClient.edit_JSON(convenient, ids);
            request.getRequestDispatcher("Admin_Convenient").forward(request, response);
        } catch (Exception ex) {
             ConvenientClient client=new ConvenientClient();
            GenericType<Convenient> type=new GenericType<Convenient>(){};
            Convenient convenient=client.find_JSON(type, Integer.parseInt(id));
            
            request.setAttribute("convenient", convenient);
            request.setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("AdminTemplate/addconvenient.jsp").forward(request, response);
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
