/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import entities.Accountemployee;
import entities.Qrcode;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.AdminIndexClient;

/**
 *
 * @author Admin
 */
public class EmployeeIndexServlet extends HttpServlet {

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
            AdminIndexClient adminIndexClient = new AdminIndexClient();
            GenericType<List<Qrcode>> genListQrcode = new GenericType<List<Qrcode>>() {
            };
            GenericType<List<Accountemployee>> genListAccountemployee = new GenericType<List<Accountemployee>>() {
            };
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat dateFormatday = new SimpleDateFormat("dd");
            SimpleDateFormat dateFormatmonth = new SimpleDateFormat("MM");
            SimpleDateFormat dateFormatyear = new SimpleDateFormat("YYYY");
            Calendar cal = Calendar.getInstance();
            cal.setTime(dateFormat.parse(dateFormat.format(date)));
            cal.add(Calendar.DATE, 1);
            Calendar calyesterday = Calendar.getInstance();
            calyesterday.add(Calendar.DATE, -1);

            String today = dateFormat.format(date);
            String nextday = dateFormat.format(cal.getTime());
            String yesterday = dateFormat.format(calyesterday.getTime());

            List<Qrcode> listCheckInSchedule = adminIndexClient.getCheckInSchedule(genListQrcode, yesterday, today);
            List<Qrcode> listCheckOutSchedule = adminIndexClient.getCheckOutSchedule(genListQrcode, yesterday, today);
            List<Accountemployee> listEmployeeBirthDay = adminIndexClient.getEmployeeBirthDay(genListAccountemployee, yesterday, today);
            Accountemployee employeeBirthDay = listEmployeeBirthDay.get(0);
            int newcustomer = 0;
            for (Qrcode qrcode : listCheckInSchedule) {
                if (qrcode.getChildrenNum() != null) {
                    newcustomer += qrcode.getChildrenNum();
                }
                if (qrcode.getAdultsNum() != null) {
                    newcustomer += qrcode.getAdultsNum();
                }
            }
            int bdyear = Integer.valueOf(dateFormatyear.format(employeeBirthDay.getDateOfBirth()));
            int bdmonth = Integer.valueOf(dateFormatmonth.format(employeeBirthDay.getDateOfBirth()));
            int bdday = Integer.valueOf(dateFormatday.format(employeeBirthDay.getDateOfBirth()));
            LocalDate lcToday = LocalDate.now();
            LocalDate birthday = LocalDate.of(bdyear, bdmonth, bdday);
            LocalDate nextBDay = birthday.withYear(lcToday.getYear());
            if (nextBDay.isBefore(lcToday) || nextBDay.isEqual(lcToday)) {
                nextBDay = nextBDay.plusYears(1);
            }
            Period p = Period.between(lcToday, nextBDay);
            long p2 = ChronoUnit.DAYS.between(lcToday, nextBDay);
            System.out.println("There are " + p.getMonths() + " months, and "
                    + p.getDays() + " days until your next birthday. ("
                    + p2 + " total)");

            Calendar c = Calendar.getInstance();    
            c.setFirstDayOfWeek(Calendar.MONDAY);
            c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek());
            String weekstartDate = dateFormat.format(c.getTime());
            c.add(Calendar.DATE, 6);
            String weekendDate = dateFormat.format(c.getTime());

            List<Qrcode> listWeekCheckInSchedule = adminIndexClient.getCheckInSchedule(genListQrcode, weekstartDate, weekendDate);
            System.out.println("listweek size:"+listWeekCheckInSchedule.size());
            int monday =0;
            int tuesday =0;
            int wednesday =0;
            int thursday =0;
            int friday =0;
            int saturday =0;
            int sunday =0;
            for (Qrcode qrcode : listWeekCheckInSchedule) {
                c.setTime(qrcode.getCheckInDate());
                if (c.get(Calendar.DAY_OF_WEEK)==Calendar.MONDAY)  {
                    monday += qrcode.getAdultsNum()+qrcode.getChildrenNum();
                }
                if (c.get(Calendar.DAY_OF_WEEK)==Calendar.TUESDAY)  {
                    tuesday += qrcode.getAdultsNum()+qrcode.getChildrenNum();
                }
                if (c.get(Calendar.DAY_OF_WEEK)==Calendar.WEDNESDAY)  {
                    wednesday += qrcode.getAdultsNum()+qrcode.getChildrenNum();
                }
                if (c.get(Calendar.DAY_OF_WEEK)==Calendar.THURSDAY)  {
                    thursday += qrcode.getAdultsNum()+qrcode.getChildrenNum();
                }
                if (c.get(Calendar.DAY_OF_WEEK)==Calendar.FRIDAY)  {
                    friday += qrcode.getAdultsNum()+qrcode.getChildrenNum();
                }
                if (c.get(Calendar.DAY_OF_WEEK)==Calendar.SATURDAY)  {
                    saturday += qrcode.getAdultsNum()+qrcode.getChildrenNum();
                }
                if (c.get(Calendar.DAY_OF_WEEK)==Calendar.SUNDAY)  {
                    sunday += qrcode.getAdultsNum()+qrcode.getChildrenNum();
                }
            }
            request.setAttribute("monday", monday);
            request.setAttribute("tuesday", tuesday);
            request.setAttribute("wednesday", wednesday);
            request.setAttribute("thursday", thursday);
            request.setAttribute("friday", friday);
            request.setAttribute("saturday", saturday);
            request.setAttribute("sunday", sunday);
            request.setAttribute("employeeBirthDay", employeeBirthDay);
            request.setAttribute("untilbirthday", p2);
            request.setAttribute("newcustomer", newcustomer);
            request.setAttribute("listCheckInSchedule", listCheckInSchedule);
            request.setAttribute("listCheckOutSchedule", listCheckOutSchedule);
            request.getRequestDispatcher("AdminTemplate/index2.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(EmployeeIndexServlet.class.getName()).log(Level.SEVERE, null, ex);
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
