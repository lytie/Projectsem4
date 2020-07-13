/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author ADMIN
 */
@ManagedBean
@SessionScoped
public class EntertainmentMB {

    private String EntertainmentName;
    private float TicketPrice;
    private String EntertainmentDescription;
    private String EntertainmentUrl;
    public EntertainmentMB() {
    }
    
}
