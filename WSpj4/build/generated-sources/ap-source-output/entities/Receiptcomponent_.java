package entities;

import entities.Receipt;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Receiptcomponent.class)
public class Receiptcomponent_ { 

    public static volatile SingularAttribute<Receiptcomponent, Integer> receiptComponentId;
    public static volatile SingularAttribute<Receiptcomponent, Integer> quantity;
    public static volatile SingularAttribute<Receiptcomponent, Float> price;
    public static volatile SingularAttribute<Receiptcomponent, Float> subtotal;
    public static volatile SingularAttribute<Receiptcomponent, String> componentName;
    public static volatile SingularAttribute<Receiptcomponent, Date> orderDate;
    public static volatile SingularAttribute<Receiptcomponent, String> ordererName;
    public static volatile SingularAttribute<Receiptcomponent, Receipt> receiptId;
    public static volatile SingularAttribute<Receiptcomponent, String> url;

}