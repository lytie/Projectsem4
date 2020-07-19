/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import entities.Service;
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
@Path("entities.service")
public class ServiceFacadeREST extends AbstractFacade<Service> {
    @PersistenceContext(unitName = "WSPU")
    private EntityManager em;

    public ServiceFacadeREST() {
        super(Service.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Service entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, Service entity) {
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
    public Service find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Service> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Service> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }

    @GET
    @Path("listfood")
    @Produces({"application/xml", "application/json"})
    public List<Service> listfood() {
        String query = "SELECT * FROM service where SerivceTypeId = 1";
        return em.createNativeQuery(query, Service.class).getResultList();
    }
    @GET
    @Path("listdrink")
    @Produces({"application/xml", "application/json"})
    public List<Service> listdrink() {
        String query = "SELECT * FROM service where SerivceTypeId = 2";
        return em.createNativeQuery(query, Service.class).getResultList();
    }
    @GET
    @Path("listticket")
    @Produces({"application/xml", "application/json"})
    public List<Service> listticket() {
        String query = "SELECT * FROM service where SerivceTypeId = 3";
        return em.createNativeQuery(query, Service.class).getResultList();
    }
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
