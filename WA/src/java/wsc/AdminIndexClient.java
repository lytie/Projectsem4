/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package wsc;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;

/**
 * Jersey REST client generated for REST resource:AdminIndexFacadeREST
 * [adminindex]<br>
 * USAGE:
 * <pre>
 *        AdminIndexClient client = new AdminIndexClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Admin
 */
public class AdminIndexClient {
    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/WS/webresources";

    public AdminIndexClient() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("adminindex");
    }

    public <T> T getCheckInSchedule(javax.ws.rs.core.GenericType<T> responseType, String from, String to) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getcheckinschedule/{0}/{1}", new Object[]{from, to}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getCheckOutSchedule(javax.ws.rs.core.GenericType<T> responseType, String from, String to) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getcheckoutschedule/{0}/{1}", new Object[]{from, to}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getActiveAccountEmployee(javax.ws.rs.core.GenericType<T> responseType) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path("getactiveaccountemployee");
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getnewTicketSold(javax.ws.rs.core.GenericType<T> responseType, String today, String nextday) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getnewticketsold/{0}/{1}", new Object[]{today, nextday}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getQrcodeInUse(javax.ws.rs.core.GenericType<T> responseType, String from, String to, String toplus1) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getqrcodeinuse/{0}/{1}/{2}", new Object[]{from, to, toplus1}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getRoomNotInUse(javax.ws.rs.core.GenericType<T> responseType, String from, String to, String toplus1) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getroomnotinuse/{0}/{1}/{2}", new Object[]{from, to, toplus1}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getEmployeeBirthDay(javax.ws.rs.core.GenericType<T> responseType, String from, String to) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getemployeebirthday/{0}/{1}", new Object[]{from, to}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getnewPaidReceipt(javax.ws.rs.core.GenericType<T> responseType, String today, String nextday) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getnewpaidreceipt/{0}/{1}", new Object[]{today, nextday}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getnewRoomBooked(javax.ws.rs.core.GenericType<T> responseType, String today, String nextday) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getnewroombooked/{0}/{1}", new Object[]{today, nextday}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getnewFeedBack(javax.ws.rs.core.GenericType<T> responseType, String today, String nextday) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getnewfeedback/{0}/{1}", new Object[]{today, nextday}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getnewUserRegistrations(javax.ws.rs.core.GenericType<T> responseType, String today, String nextday) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getnewuserregistrations/{0}/{1}", new Object[]{today, nextday}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getnewTicket(javax.ws.rs.core.GenericType<T> responseType, String today, String nextday) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getnewticket/{0}/{1}", new Object[]{today, nextday}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getnewPaidReceiptComponent(javax.ws.rs.core.GenericType<T> responseType, String today, String nextday) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getnewpaidreceiptcomponent/{0}/{1}", new Object[]{today, nextday}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T getnewFoodandDrinkOrders(javax.ws.rs.core.GenericType<T> responseType, String today, String nextday) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getnewfndorders/{0}/{1}", new Object[]{today, nextday}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void close() {
        client.close();
    }
    
}
