package entities;

import entities.Room;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Roomtype.class)
public class Roomtype_ { 

    public static volatile SingularAttribute<Roomtype, String> roomSize;
    public static volatile SingularAttribute<Roomtype, String> roomTypeName;
    public static volatile CollectionAttribute<Roomtype, Room> roomCollection;
    public static volatile SingularAttribute<Roomtype, String> description;
    public static volatile SingularAttribute<Roomtype, String> bedOptions;
    public static volatile SingularAttribute<Roomtype, Integer> roomTypeId;
    public static volatile SingularAttribute<Roomtype, String> url;

}