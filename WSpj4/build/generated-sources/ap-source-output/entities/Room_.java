package entities;

import entities.Convenient;
import entities.Location;
import entities.Qrcode;
import entities.Roomimage;
import entities.Roomtype;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Room.class)
public class Room_ { 

    public static volatile CollectionAttribute<Room, Convenient> convenientCollection;
    public static volatile SingularAttribute<Room, Integer> childrenOpacity;
    public static volatile SingularAttribute<Room, Float> price;
    public static volatile SingularAttribute<Room, Location> locationId;
    public static volatile SingularAttribute<Room, String> description;
    public static volatile SingularAttribute<Room, Integer> adultOpacity;
    public static volatile SingularAttribute<Room, Integer> roomId;
    public static volatile SingularAttribute<Room, Roomtype> roomTypeId;
    public static volatile SingularAttribute<Room, Boolean> status;
    public static volatile CollectionAttribute<Room, Qrcode> qrcodeCollection;
    public static volatile CollectionAttribute<Room, Roomimage> roomimageCollection;

}