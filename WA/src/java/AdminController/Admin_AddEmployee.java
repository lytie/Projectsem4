/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package AdminController;

import Generator.StringGenerator;
import bean.encrypt;
import entities.Accountemployee;
import entities.Role;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.AccountemployeeClient;
import wsc.RoleClient;

/**
 *
 * @author Admin
 */
public class Admin_AddEmployee extends HttpServlet {

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
            
            RoleClient roleClient=new RoleClient();
            GenericType<List<Role>> roleType=new GenericType<List<Role>>(){};
            List<Role> list=roleClient.findAll_JSON(roleType);
            
            request.setAttribute("list", list);
            
            request.getRequestDispatcher("AdminTemplate/addemployee.jsp").forward(request, response);
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
            String email=request.getParameter("email");
            String name=request.getParameter("name");
            String phone=request.getParameter("phone");
            String password=request.getParameter("password");
            String datepicker=request.getParameter("datepicker");
            String role=request.getParameter("role");
            
            RoleClient client=new RoleClient();
            GenericType<Role> rType=new GenericType<Role>(){};
            Role role1=client.find_JSON(rType, role);
            
            SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
            Date dob=format.parse(datepicker);
            
            AccountemployeeClient clientAcc=new AccountemployeeClient();
            GenericType<List<Accountemployee>> accType=new GenericType<List<Accountemployee>>(){};
            List<Accountemployee> listAcc=clientAcc.findAll_JSON(accType);
            StringGenerator gen=new StringGenerator();
            String token=null;
            boolean check=false;
            do {       
               token= gen.generate(password.length());
                for (Accountemployee acc : listAcc) {
                    if(token.equals(acc.getToken())){
                        check=true;
                    }
                }
                
            } while (check);
            
            for (Accountemployee acc : listAcc) {
                    if(email.equals(acc.getEmail())){
                         request.setAttribute("success", "<div class='success'></div>"
                        + "         <script type=\"text/javascript\">\n"
                        + "            $('.success').each(function () {\n"
                        + "                swal(\"Email already exists!!!\", \"\", \"error\");\n"
                        + "            });\n"
                        + "        </script>");
                         processRequest(request, response);
                    }
                }
            Accountemployee accountemployee=new Accountemployee();
            accountemployee.setDateOfBirth(dob);
            accountemployee.setEmail(email);
            accountemployee.setFullName(name);
            accountemployee.setPassword(password);
            accountemployee.setPhone(phone);
            accountemployee.setRoleId(role1);
            accountemployee.setStatus(Boolean.TRUE);
            accountemployee.setToken(token);
            
            clientAcc.create_JSON(accountemployee);
            
            
        } catch (ParseException ex) {
            Logger.getLogger(Admin_AddEmployee.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("success", " ");
        request.getRequestDispatcher("Admin_Employee").forward(request, response);
        
        
                
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
