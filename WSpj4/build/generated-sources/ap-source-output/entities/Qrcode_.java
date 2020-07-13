package entities;

import entities.Feedback;
import entities.Receipt;
import entities.Room;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Qrcode.class)
public class Qrcode_ { 

    public static volatile SingularAttribute<Qrcode, String> qrCodeId;
    public static volatile CollectionAttribute<Qrcode, Feedback> feedbackCollection;
    public static volatile SingularAttribute<Qrcode, String> emailSendedTo;
    public static volatile SingularAttribute<Qrcode, Date> checkInDate;
    public static volatile SingularAttribute<Qrcode, Integer> adultsNum;
    public static volatile SingularAttribute<Qrcode, String> customerName;
    public static volatile SingularAttribute<Qrcode, Float> deposits;
    public static volatile SingularAttribute<Qrcode, String> url;
    public static volatile SingularAttribute<Qrcode, Room> roomId;
    public static volatile SingularAttribute<Qrcode, Integer> accountCustomerId;
    public static volatile SingularAttribute<Qrcode, Date> checkOutDate;
    public static volatile SingularAttribute<Qrcode, Integer> childrenNum;
    public static volatile SingularAttribute<Qrcode, Receipt> receiptId;
    public static volatile SingularAttribute<Qrcode, Date> createDate;
    public static volatile SingularAttribute<Qrcode, Boolean> status;

}