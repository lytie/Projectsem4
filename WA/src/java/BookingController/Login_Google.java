/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import Generator.SendMail;
import Generator.StringGenerator;
import bean.GooglePojo;
import bean.GoogleUtils;
import bean.encrypt;
import entities.Accountcustomer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericType;
import wsc.AccountcustomerClient;

/**
 *
 * @author longly
 */
public class Login_Google extends HttpServlet {

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
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("Login").forward(request, response);
        } else {
            String token = GoogleUtils.getToken(code);
            GooglePojo pojo = GoogleUtils.getUserInfo(token);

            HttpSession session = request.getSession();

            System.out.println("" + pojo.getEmail());

            AccountcustomerClient client = new AccountcustomerClient();
            GenericType<List<Accountcustomer>> type = new GenericType<List<Accountcustomer>>() {
            };
            List<Accountcustomer> list = client.findAll_JSON(type);
            Accountcustomer accsession = new Accountcustomer();

            boolean check = false;
            for (Accountcustomer acc : list) {
                if (acc.getEmail().equals(pojo.getEmail())) {
                    check = true;
                    accsession.setAccountCustomerId(acc.getAccountCustomerId());
                    accsession.setEmail(acc.getEmail());
                    accsession.setFullName(acc.getFullName());
                    accsession.setPhone(acc.getPhone());
                }
            }
            if (check) {

                if (session.getAttribute("user") == null) {
                    session.setAttribute("user", accsession);
                }
                request.getRequestDispatcher("Haven").forward(request, response);
            } else {
                request.setAttribute("email", pojo.getEmail());
                request.getRequestDispatcher("Booking/infomation.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        String passConfirm = request.getParameter("passconfirm");

        AccountcustomerClient accC = new AccountcustomerClient();
        Accountcustomer accCus = new Accountcustomer();
        GenericType<List<Accountcustomer>> gAcc = new GenericType<List<Accountcustomer>>() {
        };
        List<Accountcustomer> listAccCus = accC.findAll_JSON(gAcc);

        //check email khong trung
        boolean check = false;
        for (Accountcustomer acc : listAccCus) {
            if (acc.getEmail().equals(email)) {
                check = true;
            }
        }

        //error
        String errName = null;
        String errEmail = null;
        String errPass = null;
        String errPhone = null;
        String errConfirmPass = null;

        //bat loi
        if (name.trim().isEmpty()) {
            errName = "Please enter Full Name";
        } else {
            errName = null;
        }

        if (email.isEmpty()) {
            errEmail = "Please enter Email";
        } //                else if(!email.matches("^[a-zA-Z][\\w]+@([\\w]+\\.[\\w]+)$")){
        //                    errEmail="Email Invalid format !";
        //                }
        else if (check) {
            errEmail = "Email have been registered ! ";
        } else {
            errEmail = null;
        }

        if (phone.isEmpty()) {
            errPhone = "Please enter Phone";
        } else if (!phone.matches("^\\d{10,13}$")) {
            errPhone = "Phone numbers must be 10 to 13 digits";
        } else {
            errPhone = null;
        }

        if (pass.isEmpty()) {
            errPass = "Please enter Password";
        } else if (pass.length() < 8) {
            errPass = "Password length must be at least 8 characters";
        } else {
            errPass = null;
        }

        if (passConfirm.isEmpty()) {
            errConfirmPass = "Please enter Confirm Password";
        } else if (!passConfirm.equals(pass)) {
            errConfirmPass = "Confirm Password does not match Password";
        } else {
            errConfirmPass = null;
        }

        encrypt en = new encrypt(); //ma hoa password
        StringGenerator gen = new StringGenerator(); //get token
        //bat token trung 
        String token;
        boolean c = false;
        do {
            c = false;
            token = gen.generate(pass.length() * 3);
            for (Accountcustomer acc : listAccCus) {
                if (token.equals(acc.getToken())) {

                    c = true;
                }
            }

        } while (c == true);

        Date d = new Date();
        //thuc thi neu err... null nguoc lai tra ve loi
        if (errName == null && errEmail == null && errPass == null && errPhone == null && errConfirmPass == null) {

            accCus.setEmail(email);
            accCus.setFullName(name);
            accCus.setPassword(en.changed(pass));
            accCus.setPhone(phone);
            accCus.setToken(token);
            accCus.setActive(true);
            accCus.setCreateDate(d);
            accC.create_JSON(accCus);
            
            
            AccountcustomerClient accClinet = new AccountcustomerClient();
        GenericType<List<Accountcustomer>> genAcc = new GenericType<List<Accountcustomer>>() {
        };
        List<Accountcustomer> listAcCus = accClinet.findAll_JSON(genAcc);
            int id=1;
            for (Accountcustomer listAccCu : listAcCus) {
                if(listAccCu.getEmail().equals(email)){
                    id=listAccCu.getAccountCustomerId();
                }
            }
            
            System.out.println("id=" +id);
            Accountcustomer accsession = new Accountcustomer();
            accsession.setAccountCustomerId(id);
            accsession.setEmail(accCus.getEmail());
            accsession.setFullName(accCus.getFullName());
            accsession.setPhone(accCus.getPhone());
            HttpSession session = request.getSession();
            if (session.getAttribute("user") == null) {
                session.setAttribute("user", accsession);
            }

            request.getRequestDispatcher("Haven").include(request, response);
        } else {

            request.setAttribute("errName", errName);
            request.setAttribute("errEmail", errEmail);
            request.setAttribute("errPass", errPass);
            request.setAttribute("errPhone", errPhone);
            request.setAttribute("errConfirmPass", errConfirmPass);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.getRequestDispatcher("Booking/infomation.jsp").forward(request, response);
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
