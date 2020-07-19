/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import entities.Receiptcomponent;
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
@Path("entities.receiptcomponent")
public class ReceiptcomponentFacadeREST extends AbstractFacade<Receiptcomponent> {
    @PersistenceContext(unitName = "WSPU")
    private EntityManager em;

    public ReceiptcomponentFacadeREST() {
        super(Receiptcomponent.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Receiptcomponent entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, Receiptcomponent entity) {
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
    public Receiptcomponent find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Receiptcomponent> findAll() {
        return super.findAll();
    }

    @GET
    @Path("findbyReceiptID/{id}")
    @Produces({"application/xml", "application/json"})
    public List<Receiptcomponent> findbyReceiptID(@PathParam("id") Integer receiptId) {
        String query = "Select * from receiptcomponent where ReceiptId = ?";
        return em.createNativeQuery(query, Receiptcomponent.class).setParameter(1, receiptId).getResultList();
    }
    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Receiptcomponent> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
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
