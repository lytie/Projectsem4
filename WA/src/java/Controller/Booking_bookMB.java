/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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

    private int location;
    private String inDate;
    private String outDate;
    private int adult;
    private int children;
    private float price;
    private float deposit;
    private String fullName;
    private String email;
    private String phone;

    public int getLocation() {
        return location;
    }

    public void setLocation(int location) {
        this.location = location;
    }

    public String getInDate() {
        return inDate;
    }

    public void setInDate(String inDate) {
        this.inDate = inDate;
    }

    public String getOutDate() {
        return outDate;
    }

    public void setOutDate(String outDate) {
        this.outDate = outDate;
    }

    public int getAdult() {
        return adult;
    }

    public void setAdult(int adult) {
        this.adult = adult;
    }

    public int getChildren() {
        return children;
    }

    public void setChildren(int children) {
        this.children = children;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getDeposit() {
        return deposit;
    }

    public void setDeposit(float deposit) {
        this.deposit = deposit;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

//    list Image Hero
    public List<ImgHero> listImgHero() {
        ImgHeroClient ihc = new ImgHeroClient();
        GenericType<List<ImgHero>> gIhc = new GenericType<List<ImgHero>>() {
        };
        return ihc.HeroImg_JSON(gIhc);
    }

//    list Location
    public List<Location> listLocation() {
        LocationClient lc = new LocationClient();
        GenericType<List<Location>> gLc = new GenericType<List<Location>>() {
        };
        return lc.findAll_JSON(gLc);
    }

    //list Room avtive
    public List<Roombooking> listRoomBook(String inDate, String outDate, int location, int capation) {
        RoombookingClient rbc = new RoombookingClient();
        GenericType<List<Roombooking>> gRbc = new GenericType<List<Roombooking>>() {
        };
        return rbc.bookRoom_JSON(gRbc, inDate, outDate, location, capation);
    }

    //room
    public Room room(int id) {
        RoomClient rc = new RoomClient();
        GenericType<Room> gr = new GenericType<Room>() {
        };
        return rc.find_JSON(gr, id);
    }

    //location
    public Location location(int id) {

        return room(id).getLocationId();
    }

    public Location locationt() {
        LocationClient lc = new LocationClient();
        GenericType<Location> glc = new GenericType<Location>() {
        };
        return lc.find_JSON(glc, location);
    }

    //list image room
    public List<Roomimage> listRoomImg(int id) {
        RoomimageClient ric = new RoomimageClient();
        GenericType<List<Roomimage>> qRic = new GenericType<List<Roomimage>>() {
        };
        return ric.getImg_JSON(qRic, id);
    }

    //list dot slide image room
    public List<Integer> listDot(int id) {
        RoomimageClient ric = new RoomimageClient();
        GenericType<List<Roomimage>> qRic = new GenericType<List<Roomimage>>() {
        };
        List<Roomimage> listImg = ric.getImg_JSON(qRic, id);

        List<Integer> listdot = new ArrayList<>();
        for (int i = 1; i < listImg.size(); i++) {
            listdot.add(i);

        }

        return listdot;

    }

    //list convenient room
    public List<VConvenientroom> listConvenient(int id) {
        VConvenientroomClient vcrc = new VConvenientroomClient();
        GenericType<List<VConvenientroom>> gvcrc = new GenericType<List<VConvenientroom>>() {
        };
        return vcrc.convenientImg_JSON(gvcrc, id);
    }

    //list top 5 location
    public List<Location> toplistLocation() {
        LocationClient lc = new LocationClient();
        GenericType<List<Location>> gLc = new GenericType<List<Location>>() {
        };
        return lc.topLocation_JSON(gLc);
    }

    //list top 6 room type
    public List<Roomtype> toplistRoomtype() {
        RoomtypeClient rtc = new RoomtypeClient();
        GenericType<List<Roomtype>> gRtc = new GenericType<List<Roomtype>>() {
        };
        return rtc.topType_JSON(gRtc);
    }

    public Booking_bookMB() {
    }

}
