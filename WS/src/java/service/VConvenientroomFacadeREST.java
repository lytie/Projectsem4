/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import entities.VConvenientroom;
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
@Path("entities.vconvenientroom")
public class VConvenientroomFacadeREST extends AbstractFacade<VConvenientroom> {
    @PersistenceContext(unitName = "WSPU")
    private EntityManager em;

    public VConvenientroomFacadeREST() {
        super(VConvenientroom.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(VConvenientroom entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") String id, VConvenientroom entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") String id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({"application/xml", "application/json"})
    public VConvenientroom find(@PathParam("id") String id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<VConvenientroom> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<VConvenientroom> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }
    
     @GET
    @Path("convenientImg/{idRoom}")
    @Produces({"application/xml", "application/json"})
    public List<VConvenientroom> convenientImg(@PathParam("idRoom") int idRoom) {
          String query="SELECT * FROM v_convenientroom where RoomId=?";
        return  em.createNativeQuery(query,VConvenientroom.class).setParameter(1, idRoom).getResultList();
    }
    

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
