package entities;

import entities.Role;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Accountemployee.class)
public class Accountemployee_ { 

    public static volatile SingularAttribute<Accountemployee, Integer> accountId;
    public static volatile SingularAttribute<Accountemployee, String> password;
    public static volatile SingularAttribute<Accountemployee, String> phone;
    public static volatile SingularAttribute<Accountemployee, Role> roleId;
    public static volatile SingularAttribute<Accountemployee, String> fullName;
    public static volatile SingularAttribute<Accountemployee, Date> dateOfBirth;
    public static volatile SingularAttribute<Accountemployee, String> email;

}