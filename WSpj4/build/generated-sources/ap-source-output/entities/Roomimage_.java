package entities;

import entities.Room;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Roomimage.class)
public class Roomimage_ { 

    public static volatile SingularAttribute<Roomimage, Integer> roomImageId;
    public static volatile SingularAttribute<Roomimage, String> url;
    public static volatile SingularAttribute<Roomimage, Room> roomId;

}