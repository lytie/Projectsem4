package service;

import java.util.Set;
import javax.ws.rs.core.Application;

/**
 *
 * @author Admin
 */
@javax.ws.rs.ApplicationPath("webresources")
public class ApplicationConfig extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        addRestResourceClasses(resources);
        return resources;
    }

    /**
     * Do not modify addRestResourceClasses() method.
     * It is automatically populated with
     * all resources defined in the project.
     * If required, comment out calling this method in getClasses().
     */
    private void addRestResourceClasses(Set<Class<?>> resources) {
        resources.add(service.AccountcustomerFacadeREST.class);
        resources.add(service.AccountemployeeFacadeREST.class);
        resources.add(service.AdminIndexFacadeREST.class);
        resources.add(service.ConvenientFacadeREST.class);
        resources.add(service.FeedbackFacadeREST.class);
        resources.add(service.HistoryFacadeREST.class);
        resources.add(service.ImgHeroFacadeREST.class);
        resources.add(service.LocationFacadeREST.class);
        resources.add(service.QrcodeFacadeREST.class);
        resources.add(service.ReceiptFacadeREST.class);
        resources.add(service.ReceiptcomponentFacadeREST.class);
        resources.add(service.RoleFacadeREST.class);
        resources.add(service.RoomFacadeREST.class);
        resources.add(service.RoombookingFacadeREST.class);
        resources.add(service.RoomconvenientFacadeREST.class);
        resources.add(service.RoomimageFacadeREST.class);
        resources.add(service.RoomtypeFacadeREST.class);
        resources.add(service.ServiceFacadeREST.class);
        resources.add(service.ServicetypeFacadeREST.class);
        resources.add(service.TicketFacadeREST.class);
        resources.add(service.VConvenientroomFacadeREST.class);
    }
    
}