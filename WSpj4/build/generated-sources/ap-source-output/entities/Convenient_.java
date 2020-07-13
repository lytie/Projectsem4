package entities;

import entities.Room;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Convenient.class)
public class Convenient_ { 

    public static volatile SingularAttribute<Convenient, Integer> convenientId;
    public static volatile CollectionAttribute<Convenient, Room> roomCollection;
    public static volatile SingularAttribute<Convenient, String> convenientName;
    public static volatile SingularAttribute<Convenient, String> url;

}