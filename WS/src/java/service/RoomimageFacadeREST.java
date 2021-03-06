package service;

import entities.Roomimage;
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
@Path("entities.roomimage")
public class RoomimageFacadeREST extends AbstractFacade<Roomimage> {
    @PersistenceContext(unitName = "WSPU")
    private EntityManager em;

    public RoomimageFacadeREST() {
        super(Roomimage.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Roomimage entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, Roomimage entity) {
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
    public Roomimage find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Roomimage> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Roomimage> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    
     @GET
    @Path("getImg/{idRoom}")
    @Produces({"application/xml", "application/json"})
    public List<Roomimage> getImg(@PathParam("idRoom") Integer idRoom) {
        
        String query="SELECT * FROM roomimage where RoomId=?";
        return  em.createNativeQuery(query,Roomimage.class).setParameter(1, idRoom).getResultList();
        
        
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