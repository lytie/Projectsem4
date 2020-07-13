/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "foodanddrink", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Foodanddrink.findAll", query = "SELECT f FROM Foodanddrink f"),
    @NamedQuery(name = "Foodanddrink.findByFoodAndDrinkId", query = "SELECT f FROM Foodanddrink f WHERE f.foodAndDrinkId = :foodAndDrinkId"),
    @NamedQuery(name = "Foodanddrink.findByFoodAndDrinkName", query = "SELECT f FROM Foodanddrink f WHERE f.foodAndDrinkName = :foodAndDrinkName"),
    @NamedQuery(name = "Foodanddrink.findByFoodAndDrinkPrice", query = "SELECT f FROM Foodanddrink f WHERE f.foodAndDrinkPrice = :foodAndDrinkPrice"),
    @NamedQuery(name = "Foodanddrink.findByFoodAndDrinkDescription", query = "SELECT f FROM Foodanddrink f WHERE f.foodAndDrinkDescription = :foodAndDrinkDescription"),
    @NamedQuery(name = "Foodanddrink.findByFoodAndDrinkurl", query = "SELECT f FROM Foodanddrink f WHERE f.foodAndDrinkurl = :foodAndDrinkurl")})
public class Foodanddrink implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "FoodAndDrinkId", nullable = false)
    private Integer foodAndDrinkId;
    @Size(max = 50)
    @Column(name = "FoodAndDrinkName", length = 50)
    private String foodAndDrinkName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "FoodAndDrinkPrice", precision = 12, scale = 0)
    private Float foodAndDrinkPrice;
    @Size(max = 255)
    @Column(name = "FoodAndDrinkDescription", length = 255)
    private String foodAndDrinkDescription;
    @Size(max = 500)
    @Column(name = "FoodAndDrinkurl", length = 500)
    private String foodAndDrinkurl;
    @JoinColumn(name = "TypeId", referencedColumnName = "TypeId")
    @ManyToOne
    private Fndtype typeId;

    public Foodanddrink() {
    }

    public Foodanddrink(Integer foodAndDrinkId) {
        this.foodAndDrinkId = foodAndDrinkId;
    }

    public Integer getFoodAndDrinkId() {
        return foodAndDrinkId;
    }

    public void setFoodAndDrinkId(Integer foodAndDrinkId) {
        this.foodAndDrinkId = foodAndDrinkId;
    }

    public String getFoodAndDrinkName() {
        return foodAndDrinkName;
    }

    public void setFoodAndDrinkName(String foodAndDrinkName) {
        this.foodAndDrinkName = foodAndDrinkName;
    }

    public Float getFoodAndDrinkPrice() {
        return foodAndDrinkPrice;
    }

    public void setFoodAndDrinkPrice(Float foodAndDrinkPrice) {
        this.foodAndDrinkPrice = foodAndDrinkPrice;
    }

    public String getFoodAndDrinkDescription() {
        return foodAndDrinkDescription;
    }

    public void setFoodAndDrinkDescription(String foodAndDrinkDescription) {
        this.foodAndDrinkDescription = foodAndDrinkDescription;
    }

    public String getFoodAndDrinkurl() {
        return foodAndDrinkurl;
    }

    public void setFoodAndDrinkurl(String foodAndDrinkurl) {
        this.foodAndDrinkurl = foodAndDrinkurl;
    }

    public Fndtype getTypeId() {
        return typeId;
    }

    public void setTypeId(Fndtype typeId) {
        this.typeId = typeId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (foodAndDrinkId != null ? foodAndDrinkId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Foodanddrink)) {
            return false;
        }
        Foodanddrink other = (Foodanddrink) object;
        if ((this.foodAndDrinkId == null && other.foodAndDrinkId != null) || (this.foodAndDrinkId != null && !this.foodAndDrinkId.equals(other.foodAndDrinkId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Foodanddrink[ foodAndDrinkId=" + foodAndDrinkId + " ]";
    }
    
}
