package service;

import entities.Location;
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
@Path("entities.location")
public class LocationFacadeREST extends AbstractFacade<Location> {
    @PersistenceContext(unitName = "WSPU")
    private EntityManager em;

    public LocationFacadeREST() {
        super(Location.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Location entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, Location entity) {
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
    public Location find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Location> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Location> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }
    
     @GET
    @Path("topLocation")
    @Produces({"application/xml", "application/json"})
    public List<Location> topLocation() {
        String query="select location.LocationId, location.LocationName,location.LocationUrl from qrcode "
                + "join room on qrcode.RoomId=room.RoomId "
                + "join location on room.LocationId=location.LocationId "
                + "group by room.RoomId"
                + " order by count(room.RoomId) desc "
                + "limit 5";
        
        List<Location> list= em.createNativeQuery(query,Location.class).getResultList();
        
        if(list.size()<5){
            int limit=5-list.size();
            String q="select location.LocationId, location.LocationName,location.LocationUrl from location "
                    + "where location.LocationId not in "
                    + "(select location.LocationId from qrcode join room on qrcode.RoomId=room.RoomId "
                    + "join location on room.LocationId=location.LocationId "
                    + "group by location.LocationId "
                    + "order by count(location.LocationId) desc) limit ?";
            List<Location> l=em.createNativeQuery(q,Location.class).setParameter(1, limit).getResultList();
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