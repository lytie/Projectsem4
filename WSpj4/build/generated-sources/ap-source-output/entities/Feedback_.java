package entities;

import entities.Qrcode;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Feedback.class)
public class Feedback_ { 

    public static volatile SingularAttribute<Feedback, Qrcode> qrCodeId;
    public static volatile SingularAttribute<Feedback, String> feedBackMessage;
    public static volatile SingularAttribute<Feedback, Integer> feedBackId;

}