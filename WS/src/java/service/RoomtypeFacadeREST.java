/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import entities.Roomtype;
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
@Path("entities.roomtype")
public class RoomtypeFacadeREST extends AbstractFacade<Roomtype> {
    @PersistenceContext(unitName = "WSPU")
    private EntityManager em;

    public RoomtypeFacadeREST() {
        super(Roomtype.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Roomtype entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, Roomtype entity) {
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
    public Roomtype find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Roomtype> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Roomtype> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }
     @GET
    @Path("topType")
    @Produces({"application/xml", "application/json"})
    public List<Roomtype> topType() {
          String query="select roomtype.RoomTypeId, roomtype.RoomTypeName,roomtype.Description,roomtype.url from qrcode "
                  + "join room on qrcode.RoomId=room.RoomId "
                  + "join roomtype on room.RoomTypeId =roomtype.RoomTypeId  "
                  + "group by roomtype.RoomTypeId  "
                  + "order by count(roomtype.RoomTypeId ) desc "
                  + "limit 6";
        
        List<Roomtype> list= em.createNativeQuery(query,Roomtype.class).getResultList();
        
        if(list.size()<6){
            int limit=6-list.size();
            String q="select roomtype.RoomTypeId, roomtype.RoomTypeName,roomtype.Description,roomtype.url from roomtype where roomtype.RoomTypeId not in "
                    + "(select roomtype.RoomTypeId  from qrcode "
                    + "join room on qrcode.RoomId=room.RoomId "
                    + "join roomtype on room.RoomTypeId =roomtype.RoomTypeId  "
                    + "group by roomtype.RoomTypeId  "
                    + "order by count(roomtype.RoomTypeId ) desc) "
                    + "limit ?;";
            List<Roomtype> l=em.createNativeQuery(q,Roomtype.class).setParameter(1, limit).getResultList();

            list.addAll(l);
        }
        
        return list;
        
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
