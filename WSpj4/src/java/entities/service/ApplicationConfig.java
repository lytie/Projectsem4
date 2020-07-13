/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities.service;

import java.util.Set;
import javax.ws.rs.core.Application;

/**
 *
 * @author longly
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
        resources.add(entities.service.AccountcustomerFacadeREST.class);
        resources.add(entities.service.AccountemployeeFacadeREST.class);
        resources.add(entities.service.ConvenientFacadeREST.class);
        resources.add(entities.service.EntertainmentFacadeREST.class);
        resources.add(entities.service.FeedbackFacadeREST.class);
        resources.add(entities.service.FndtypeFacadeREST.class);
        resources.add(entities.service.FoodanddrinkFacadeREST.class);
        resources.add(entities.service.HistoryFacadeREST.class);
        resources.add(entities.service.LocationFacadeREST.class);
        resources.add(entities.service.QrcodeFacadeREST.class);
        resources.add(entities.service.ReceiptFacadeREST.class);
        resources.add(entities.service.ReceiptcomponentFacadeREST.class);
        resources.add(entities.service.RoleFacadeREST.class);
        resources.add(entities.service.RoomFacadeREST.class);
        resources.add(entities.service.RoombookingFacadeREST.class);
        resources.add(entities.service.RoomimageFacadeREST.class);
        resources.add(entities.service.RoomtypeFacadeREST.class);
        resources.add(entities.service.VConvenientroomFacadeREST.class);
    }
    
}
