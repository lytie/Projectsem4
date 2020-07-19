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
import java.util.*;
import javax.ws.rs.core.GenericType;
import wsc.*;

/**
 *
 * @author longly
 */
@Named(value = "booking_bookMB")
@SessionScoped
public class Booking_bookMB implements Serializable {

    
    
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
    
    public List<Roombooking> listRoomBook(){
        RoombookingClient rbc=new RoombookingClient();
        GenericType<List<Roombooking>> gRbc=new GenericType<List<Roombooking>>(){};
        return rbc.findAll_JSON(gRbc);
    }
    public List<Roomimage> listRoomImg(int id){
        RoomimageClient ric=new RoomimageClient();
       GenericType<List<Roomimage>> qRic=new GenericType<List<Roomimage>>(){};
       return ric.getImg_JSON(qRic, id);
    }
    public List<Integer> listDot(int id){
        RoomimageClient ric=new RoomimageClient();
       GenericType<List<Roomimage>> qRic=new GenericType<List<Roomimage>>(){};
       List<Roomimage> listImg=ric.getImg_JSON(qRic, id);
       
        List<Integer> listdot=new ArrayList<>();
        for (int i = 1; i < listImg.size(); i++) {
            listdot.add(i);
            
        }
       
        return listdot;
       
    }
   
    public List<VConvenientroom> listConvenient(int id){
        VConvenientroomClient vcrc=new VConvenientroomClient();
       GenericType<List<VConvenientroom>> gvcrc =new GenericType<List<VConvenientroom>>(){};
       return vcrc.convenientImg_JSON(gvcrc, id);
    }
//    public List<> list(){
//        
//       GenericType<> =new GenericType<>(){};
//       return ;
//    }
    
    public Booking_bookMB() {
    }
    
}
