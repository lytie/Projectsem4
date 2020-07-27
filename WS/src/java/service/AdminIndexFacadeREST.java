/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import entities.Accountcustomer;
import entities.Feedback;
import entities.Qrcode;
import entities.Receipt;
import entities.Receiptcomponent;
import entities.Ticket;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
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
     * @return an instance of java.lang.String
     */
    @GET
    @Path("getnewfndorders/{today}/{nextday}")
    @Produces("application/json")
    public List<Receiptcomponent> getnewFoodandDrinkOrders(@PathParam("today")String today,@PathParam("nextday")String nextday) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-mm-dd");
        String query1 = "SELECT * FROM receiptcomponent where OrderDate >= ? and OrderDate < ?";
        String query2 = "SELECT * FROM ticket where BuyDate >= ? and BuyDate < ?";
        List<Receiptcomponent> listReceiptcomponent = (List<Receiptcomponent>) em.createNativeQuery(query1,Receiptcomponent.class).setParameter(1,today)
                .setParameter(2, nextday)
                .getResultList();
        List<Ticket> listTicket = (List<Ticket>) em.createNativeQuery(query2,Ticket.class).setParameter(1,today)
                .setParameter(2, nextday)
                .getResultList();
        for (Ticket ticket : listTicket) {
            for (Receiptcomponent receiptcomponent : listReceiptcomponent) {
                if(ticket.getTicketName().equals(receiptcomponent.getComponentName())){
                    listReceiptcomponent.remove(receiptcomponent);
                }
            }
        }
        return listReceiptcomponent;
    }
    
    @GET
    @Path("getnewroombooked/{today}/{nextday}")
    @Produces("application/json")
    public List<Qrcode> getnewRoomBooked(@PathParam("today")String today,@PathParam("nextday")String nextday){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-mm-dd");
        String query = "SELECT * FROM qrcode WHERE CreateDate >= ? and CreateDate < ?";
        List<Qrcode> listQrcode = (List<Qrcode>) em.createNativeQuery(query,Qrcode.class)
                .setParameter(1,today)
                .setParameter(2, nextday)
                .getResultList();
        return listQrcode;
    }
    
    @GET
    @Path("getnewuserregistrations/{today}/{nextday}")
    @Produces("application/json")
    public List<Accountcustomer> getnewUserRegistrations(@PathParam("today")String today,@PathParam("nextday")String nextday) throws ParseException{
        String query = "SELECT * FROM accountcustomer WHERE CreateDate >= ? and CreateDate < ?"; 
        List<Accountcustomer> listaAccountcustomer = (List<Accountcustomer>) em.createNativeQuery(query,Accountcustomer.class)
                .setParameter(1,today)
                .setParameter(2, nextday)
                .getResultList();
        return listaAccountcustomer;
    }

    @GET
    @Path("getnewfeedback/{today}/{nextday}")
    @Produces("application/json")
    public List<Feedback> getnewFeedBack(@PathParam("today")String today,@PathParam("nextday")String nextday){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-mm-dd");
        String query = "SELECT * FROM feedback WHERE FeedBackTime >= ? and FeedBackTime < ?";
        List<Feedback> listFeedback = (List<Feedback>) em.createNativeQuery(query,Feedback.class).setParameter(1,today)
                .setParameter(2, nextday)
                .getResultList();
        return listFeedback;
    }
    
    @GET
    @Path("getnewticketsold/{today}/{nextday}")
    @Produces("application/json")
    public List<Ticket> getnewTicketSold(@PathParam("today")String today,@PathParam("nextday")String nextday){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-mm-dd");
        String query = "SELECT * FROM ticket WHERE BuyDate >= ? and BuyDate < ?";
        List<Ticket> listTicket = (List<Ticket>) em.createNativeQuery(query,Ticket.class).setParameter(1,today)
                .setParameter(2, nextday)
                .getResultList();
        return listTicket;
    }
    
    @GET
    @Path("getnewpaidreceipt/{today}/{nextday}")
    @Produces("application/json")
    public List<Receipt> getnewPaidReceipt(@PathParam("today")String today,@PathParam("nextday")String nextday){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-mm-dd");
        String query = "SELECT * FROM receipt WHERE PayDate >= ? and PayDate < ?";
        List<Receipt> listReceipt = (List<Receipt>) em.createNativeQuery(query,Receipt.class).setParameter(1,today)
                .setParameter(2, nextday)
                .getResultList();
        return listReceipt;
    }
}
