package entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(History.class)
public class History_ { 

    public static volatile SingularAttribute<History, Float> total;
    public static volatile SingularAttribute<History, String> locationName;
    public static volatile SingularAttribute<History, Integer> accountCustomerId;
    public static volatile SingularAttribute<History, Date> checkOutDate;
    public static volatile SingularAttribute<History, Float> subtotal;
    public static volatile SingularAttribute<History, String> roomTypeName;
    public static volatile SingularAttribute<History, Float> tax;
    public static volatile SingularAttribute<History, Long> id;
    public static volatile SingularAttribute<History, Date> checkInDate;
    public static volatile SingularAttribute<History, Integer> receiptId;
    public static volatile SingularAttribute<History, String> url;
    public static volatile SingularAttribute<History, Float> deposits;

}