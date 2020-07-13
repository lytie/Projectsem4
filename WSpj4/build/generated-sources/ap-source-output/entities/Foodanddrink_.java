package entities;

import entities.Fndtype;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-13T23:14:37")
@StaticMetamodel(Foodanddrink.class)
public class Foodanddrink_ { 

    public static volatile SingularAttribute<Foodanddrink, String> foodAndDrinkName;
    public static volatile SingularAttribute<Foodanddrink, Float> foodAndDrinkPrice;
    public static volatile SingularAttribute<Foodanddrink, String> foodAndDrinkDescription;
    public static volatile SingularAttribute<Foodanddrink, Integer> foodAndDrinkId;
    public static volatile SingularAttribute<Foodanddrink, String> foodAndDrinkurl;
    public static volatile SingularAttribute<Foodanddrink, Fndtype> typeId;

}