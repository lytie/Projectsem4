/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entities.Accountcustomer;
import entities.Accountemployee;
import entities.Feedback;
import entities.Qrcode;
import entities.Receipt;
import entities.Receiptcomponent;
import entities.Room;
import entities.Service;
import entities.Ticket;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;

/**
 * REST Web Service
 *
 * @author Admin
 */
@Stateless
@Path("adminindex")
public class AdminIndexFacadeREST {

    @PersistenceContext(unitName = "WSPU")
    private EntityManager em;

    public AdminIndexFacadeREST() {
    }

    /**
     * Retrieves representation of an instance of service.AdminIndexFacadeREST
     *
     * @return an instance of java.lang.String
     */
    @GET
    @Path("getnewfndorders/{today}/{nextday}")
    @Produces("application/json")
    public List<Receiptcomponent> getnewFoodandDrinkOrders(@PathParam("today") String today, @PathParam("nextday") String nextday) {
        String query1 = "SELECT * FROM receiptcomponent where OrderDate >= ? and OrderDate < ?";
        String query2 = "SELECT * FROM ticket where BuyDate >= ? and BuyDate < ?";
        String query3 = "SELECT * FROM service ";
        List<Receiptcomponent> listReceiptcomponent = (List<Receiptcomponent>) em.createNativeQuery(query1, Receiptcomponent.class).setParameter(1, today)
                .setParameter(2, nextday)
                .getResultList();
        List<Ticket> listTicket = (List<Ticket>) em.createNativeQuery(query2, Ticket.class).setParameter(1, today)
                .setParameter(2, nextday)
                .getResultList();
        List<Service> listService = em.createNativeQuery(query3, Service.class).getResultList();
        System.out.println("listReceiptcomponent:" + listReceiptcomponent.size());
        System.out.println("listTicket:" + listTicket.size());
        System.out.println("listService:" + listService.size());

        List<Receiptcomponent> listnewFoodandDrinkOrders = new ArrayList<Receiptcomponent>();
        for (Service service : listService) {
            try {
                for (Receiptcomponent receiptcomponent : listReceiptcomponent) {
                    if (service.getServiceName().equals(receiptcomponent.getComponentName())) {
                        listnewFoodandDrinkOrders.add(receiptcomponent);
                    }
                }
            } catch (Exception e) {
                System.out.println("erorrrr:" + e.getMessage());
            }

        }
        return listnewFoodandDrinkOrders;
    }

    @GET
    @Path("getnewroombooked/{today}/{nextday}")
    @Produces("application/json")
    public List<Qrcode> getnewRoomBooked(@PathParam("today") String today, @PathParam("nextday") String nextday) {
        String query = "SELECT * FROM qrcode WHERE CreateDate >= ? and CreateDate < ?";
        List<Qrcode> listQrcode = (List<Qrcode>) em.createNativeQuery(query, Qrcode.class)
                .setParameter(1, today)
                .setParameter(2, nextday)
                .getResultList();
        return listQrcode;
    }

    @GET
    @Path("getnewuserregistrations/{today}/{nextday}")
    @Produces("application/json")
    public List<Accountcustomer> getnewUserRegistrations(@PathParam("today") String today, @PathParam("nextday") String nextday) throws ParseException {
        String query = "SELECT * FROM accountcustomer WHERE CreateDate >= ? and CreateDate < ?";
        List<Accountcustomer> listaAccountcustomer = (List<Accountcustomer>) em.createNativeQuery(query, Accountcustomer.class)
                .setParameter(1, today)
                .setParameter(2, nextday)
                .getResultList();
        return listaAccountcustomer;
    }

    @GET
    @Path("getnewfeedback/{today}/{nextday}")
    @Produces("application/json")
    public List<Feedback> getnewFeedBack(@PathParam("today") String today, @PathParam("nextday") String nextday) {
        String query = "SELECT * FROM feedback WHERE FeedBackTime >= ? and FeedBackTime < ?";
        List<Feedback> listFeedback = (List<Feedback>) em.createNativeQuery(query, Feedback.class).setParameter(1, today)
                .setParameter(2, nextday)
                .getResultList();
        return listFeedback;
    }

    @GET
    @Path("getnewticketsold/{today}/{nextday}")
    @Produces("application/json")
    public List<Ticket> getnewTicketSold(@PathParam("today") String today, @PathParam("nextday") String nextday) {
        String query = "SELECT * FROM ticket WHERE BuyDate >= ? and BuyDate < ?";
        List<Ticket> listTicket = (List<Ticket>) em.createNativeQuery(query, Ticket.class).setParameter(1, today)
                .setParameter(2, nextday)
                .getResultList();
        return listTicket;
    }

    @GET
    @Path("getnewpaidreceipt/{today}/{nextday}")
    @Produces("application/json")
    public List<Receipt> getnewPaidReceipt(@PathParam("today") String today, @PathParam("nextday") String nextday) {
        String query = "SELECT * FROM receipt WHERE PayDate >= ? and PayDate < ?";
        List<Receipt> listReceipt = (List<Receipt>) em.createNativeQuery(query, Receipt.class).setParameter(1, today)
                .setParameter(2, nextday)
                .getResultList();
        return listReceipt;
    }

    @GET
    @Path("getqrcodeinuse/{from}/{to}")
    @Produces("application/json")
    public List<Qrcode> getQrcodeInUse(@PathParam("from") String from, @PathParam("to") String to) {
        try {
            String query = "select * from qrcode where QrCodeId in\n"
                    + "                        (\n"
                    + "			      select qrcode.QrCodeId from qrcode where \n"
                    + "                            (CheckInDate  between ? and ?) or\n"
                    + "                            (CheckOutDate between ? and ?) or\n"
                    + "                            (? between CheckInDate and CheckOutDate)\n"
                    + "                        )";
            List<Qrcode> listQrcode = (List<Qrcode>) em.createNativeQuery(query, Qrcode.class)
                    .setParameter(1, from)
                    .setParameter(2, to)
                    .setParameter(3, from)
                    .setParameter(4, to)
                    .setParameter(5, from)
                    .getResultList();
            return listQrcode;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }

    }

    @GET
    @Path("getroomnotinuse/{from}/{to}")
    @Produces("application/json")
    public List<Room> getRoomNotInUse(@PathParam("from") String from, @PathParam("to") String to) {
        try {
            String query = "select * from room where RoomId not in \n"
                    + "		(\n"
                    + "		select qrcode.RoomId from qrcode where QrCodeId in \n"
                    + "			(\n"
                    + "			 select qrcode.QrCodeId from qrcode where \n"
                    + "			 (CheckInDate  between ? and ?) or\n"
                    + "			 (CheckOutDate between ? and ?) or\n"
                    + "			 (? between CheckInDate and CheckOutDate)\n"
                    + "                     )\n"
                    + "             )    ";
            List<Room> listRoom = (List<Room>) em.createNativeQuery(query, Room.class)
                    .setParameter(1, from)
                    .setParameter(2, to)
                    .setParameter(3, from)
                    .setParameter(4, to)
                    .setParameter(5, from)
                    .getResultList();
            return listRoom;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @GET
    @Path("getnewpaidreceiptcomponent/{today}/{nextday}")
    @Produces("application/json")
    public List<Receiptcomponent> getnewPaidReceiptComponent(@PathParam("today") String today, @PathParam("nextday") String nextday) {
        String query = "SELECT * FROM receiptcomponent WHERE PayDate >= ? and PayDate < ?";
        List<Receiptcomponent> listReceiptcomponent = (List<Receiptcomponent>) em.createNativeQuery(query, Receiptcomponent.class)
                .setParameter(1, today)
                .setParameter(2, nextday)
                .getResultList();
        return listReceiptcomponent;
    }

    @GET
    @Path("getcheckinschedule/{from}/{to}")
    @Produces("application/json")
    public List<Qrcode> getCheckInSchedule(@PathParam("from") String from, @PathParam("to") String to) {
        String query = "SELECT * FROM qrcode WHERE CheckInDate between ? AND ?";
        List<Qrcode> listQrcode = (List<Qrcode>) em.createNativeQuery(query, Qrcode.class)
                .setParameter(1, from)
                .setParameter(2, to)
                .getResultList();
        return listQrcode;
    }

    @GET
    @Path("getcheckoutschedule/{from}/{to}")
    @Produces("application/json")
    public List<Qrcode> getCheckOutSchedule(@PathParam("from") String from, @PathParam("to") String to) {
        String query = "SELECT * FROM qrcode WHERE CheckOutDate between ? AND ?";
        List<Qrcode> listQrcode = (List<Qrcode>) em.createNativeQuery(query, Qrcode.class)
                .setParameter(1, from)
                .setParameter(2, to)
                .getResultList();
        return listQrcode;
    }

    @GET
    @Path("getemployeebirthday/{from}/{to}")
    @Produces("application/json")
    public List<Accountemployee> getEmployeeBirthDay() {
        String query = "SELECT * \n"
                + "FROM  accountemployee \n"
                + "WHERE  DATE_ADD(DateOfBirth, \n"
                + "                INTERVAL YEAR(CURDATE())-YEAR(DateOfBirth)\n"
                + "                         + IF(DAYOFYEAR(CURDATE()) > DAYOFYEAR(DateOfBirth),1,0)\n"
                + "                YEAR)  \n"
                + "            BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 365 DAY)";
        List<Accountemployee> listAccountemployee = (List<Accountemployee>) em.createNativeQuery(query, Accountemployee.class)
                .getResultList();
        return listAccountemployee;
    }
}
