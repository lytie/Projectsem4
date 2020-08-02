/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import entities.Room;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author Admin
 */
@Stateless
@Path("entities.room")
public class RoomFacadeREST extends AbstractFacade<Room> {
    @PersistenceContext(unitName = "WSPU")
    private EntityManager em;

    public RoomFacadeREST() {
        super(Room.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Room entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, Room entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({"application/xml", "application/json"})
    public Room find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Room> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Room> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }
     @PUT
    @Path("update/{id}/{price}/{description}/{status}")
    @Consumes({"application/xml", "application/json"})
    public void update(@PathParam("id") Integer id,@PathParam("price") Float price,@PathParam("description") String description,@PathParam("status") Boolean status) {
        
        String query="UPDATE room SET Price = ?, Status = ?, Description = ? WHERE RoomId = ?";
        em.createNativeQuery(query).setParameter(1, price)
                .setParameter(2, status)
                .setParameter(3, description)
                .setParameter(4, id).executeUpdate();
        
        
    }
    
    @GET
     @Path("last")
    @Produces({"application/xml", "application/json"})
    public Room last() {
        String query="SELECT * FROM prj4db.room order by RoomId desc limit 1";
      return (Room)em.createNativeQuery(query, Room.class).getSingleResult();
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
