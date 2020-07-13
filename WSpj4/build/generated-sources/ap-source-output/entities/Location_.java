package entities;

import entities.Room;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Location.class)
public class Location_ { 

    public static volatile SingularAttribute<Location, String> locationUrl;
    public static volatile SingularAttribute<Location, String> locationName;
    public static volatile SingularAttribute<Location, Integer> locationId;
    public static volatile CollectionAttribute<Location, Room> roomCollection;

}