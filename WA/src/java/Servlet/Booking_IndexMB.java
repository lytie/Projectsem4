/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import entities.*;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.ws.rs.core.GenericType;
import wsc.*;

/**
 *
 * @author longly
 */
@Named(value = "booking_IndexMB")
@SessionScoped
public class Booking_IndexMB implements Serializable {

    
     public List<ImgHero> listImgHero(){
        ImgHeroClient ihc=new ImgHeroClient();
        GenericType<List<ImgHero>> gIhc=new GenericType<List<ImgHero>>(){};
        return ihc.HeroImg_JSON(gIhc);
    }
    public List<Location> listLocation(){
        LocationClient lc=new LocationClient();
        GenericType<List<Location>> gLc=new GenericType<List<Location>>(){};
        return lc.findAll_JSON(gLc);
    }
   
     public List<Location> toplistLocation(){
        LocationClient lc=new LocationClient();
        GenericType<List<Location>> gLc=new GenericType<List<Location>>(){};
        return lc.topLocation_JSON(gLc);
    }
     public List<Roomtype> toplistRoomtype(){
         RoomtypeClient rtc=new RoomtypeClient();
         GenericType<List<Roomtype>> gRtc=new GenericType<List<Roomtype>>(){};
         return rtc.topType_JSON(gRtc);
     }
    public Booking_IndexMB() {
    }
    
}
