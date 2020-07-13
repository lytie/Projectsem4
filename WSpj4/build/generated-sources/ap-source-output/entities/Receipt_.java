package entities;

import entities.Qrcode;
import entities.Receiptcomponent;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Receipt.class)
public class Receipt_ { 

    public static volatile CollectionAttribute<Receipt, Receiptcomponent> receiptcomponentCollection;
    public static volatile SingularAttribute<Receipt, Float> total;
    public static volatile SingularAttribute<Receipt, Float> subtotal;
    public static volatile SingularAttribute<Receipt, Float> tax;
    public static volatile SingularAttribute<Receipt, Integer> receiptId;
    public static volatile SingularAttribute<Receipt, Boolean> payStatus;
    public static volatile SingularAttribute<Receipt, Date> payDate;
    public static volatile CollectionAttribute<Receipt, Qrcode> qrcodeCollection;

}