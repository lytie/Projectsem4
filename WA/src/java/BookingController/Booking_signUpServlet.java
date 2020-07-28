/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import Generator.SendMail;
import Generator.StringGenerator;
import bean.encrypt;
import entities.Accountcustomer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.AccountcustomerClient;

/**
 *
 * @author longly
 */
public class Booking_signUpServlet extends HttpServlet {

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
        //get info
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
        if (name.isEmpty()) {
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

        //thuc thi neu err... null nguoc lai tra ve loi
        if (errName == null && errEmail == null && errPass == null && errPhone == null && errConfirmPass == null) {
            
            

            accCus.setEmail(email);
            accCus.setFullName(name);
            accCus.setPassword(en.changed(pass));
            accCus.setPhone(phone);
            accCus.setToken(token);
            accCus.setActive(false);
            accC.create_JSON(accCus);

                out.println("<div class=\"success\"></div>");
                request.setAttribute("e", email);
                
                SendMail send=new SendMail();
                send.sendToken(email, "Account Verification ", "Please click on the link below to verify your account\n http://localhost:8080/WA/VerifyAccountCustomer?token="+token);
                
            request.getRequestDispatcher("Booking/login.jsp").include(request, response);
        } else {

            request.setAttribute("errName", errName);
            request.setAttribute("errEmail", errEmail);
            request.setAttribute("errPass", errPass);
            request.setAttribute("errPhone", errPhone);
            request.setAttribute("errConfirmPass", errConfirmPass);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.getRequestDispatcher("Booking/signup.jsp").forward(request, response);
        }
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
