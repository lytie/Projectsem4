/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entities.Roombooking;
import java.sql.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TemporalType;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author longly
 */
@Stateless
@Path("entities.roombooking")
public class RoombookingFacadeREST extends AbstractFacade<Roombooking> {

    @PersistenceContext(unitName = "WSPU")
    private EntityManager em;

    public RoombookingFacadeREST() {
        super(Roombooking.class);
    }

    @POST
    @Override
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(Roombooking entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Integer id, Roombooking entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Roombooking find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Roombooking> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Roombooking> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("bookRoom/{InDate}/{OutDate}/{Location}/{Capacity}")
    @Produces({"application/xml", "application/json"})
    public List<Roombooking> bookRoom(@PathParam("InDate") String InDate, @PathParam("OutDate") String OutDate,@PathParam("Location") Integer Location,@PathParam("Capacity") Integer Capacity) {

        String query = "select * from roombooking " +
"                where RoomId in(select RoomId  from room " +
"                where RoomId not in(select qrcode.RoomId from qrcode " +
"                where (CheckInDate  between ? and ?) " +
"                or (CheckOutDate between ? and ?)" +
"                 or (? between CheckInDate and CheckOutDate))" +
"                 and  LocationId= ?" +
"                 and capacity>= ? and Status=1)";

       
        return em.createNativeQuery(query, Roombooking.class)
                .setParameter(1, InDate)
                .setParameter(2, OutDate)
                .setParameter(3, InDate)
                .setParameter(4, OutDate)
                .setParameter(5, InDate)
                .setParameter(6, Location)
                .setParameter(7, Capacity).getResultList(); 
        

    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

}
