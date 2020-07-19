/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "receiptcomponent", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Receiptcomponent.findAll", query = "SELECT r FROM Receiptcomponent r"),
    @NamedQuery(name = "Receiptcomponent.findByReceiptComponentId", query = "SELECT r FROM Receiptcomponent r WHERE r.receiptComponentId = :receiptComponentId"),
    @NamedQuery(name = "Receiptcomponent.findByComponentName", query = "SELECT r FROM Receiptcomponent r WHERE r.componentName = :componentName"),
    @NamedQuery(name = "Receiptcomponent.findByPrice", query = "SELECT r FROM Receiptcomponent r WHERE r.price = :price"),
    @NamedQuery(name = "Receiptcomponent.findByQuantity", query = "SELECT r FROM Receiptcomponent r WHERE r.quantity = :quantity"),
    @NamedQuery(name = "Receiptcomponent.findBySubtotal", query = "SELECT r FROM Receiptcomponent r WHERE r.subtotal = :subtotal"),
    @NamedQuery(name = "Receiptcomponent.findByUrl", query = "SELECT r FROM Receiptcomponent r WHERE r.url = :url"),
    @NamedQuery(name = "Receiptcomponent.findByOrderDate", query = "SELECT r FROM Receiptcomponent r WHERE r.orderDate = :orderDate"),
    @NamedQuery(name = "Receiptcomponent.findByOrdererName", query = "SELECT r FROM Receiptcomponent r WHERE r.ordererName = :ordererName")})
public class Receiptcomponent implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ReceiptComponentId", nullable = false)
    private Integer receiptComponentId;
    @Size(max = 100)
    @Column(name = "ComponentName", length = 100)
    private String componentName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Price", precision = 12)
    private Float price;
    @Column(name = "Quantity")
    private Integer quantity;
    @Column(name = "Subtotal", precision = 12)
    private Float subtotal;
    @Size(max = 500)
    @Column(name = "url", length = 500)
    private String url;
    @Column(name = "OrderDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    @Size(max = 100)
    @Column(name = "OrdererName", length = 100)
    private String ordererName;
    @JoinColumn(name = "ReceiptId", referencedColumnName = "ReceiptId")
    @ManyToOne
    private Receipt receiptId;

    public Receiptcomponent() {
    }

    public Receiptcomponent(Integer receiptComponentId) {
        this.receiptComponentId = receiptComponentId;
    }

    public Integer getReceiptComponentId() {
        return receiptComponentId;
    }

    public void setReceiptComponentId(Integer receiptComponentId) {
        this.receiptComponentId = receiptComponentId;
    }

    public String getComponentName() {
        return componentName;
    }

    public void setComponentName(String componentName) {
        this.componentName = componentName;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Float subtotal) {
        this.subtotal = subtotal;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrdererName() {
        return ordererName;
    }

    public void setOrdererName(String ordererName) {
        this.ordererName = ordererName;
    }

    public Receipt getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(Receipt receiptId) {
        this.receiptId = receiptId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (receiptComponentId != null ? receiptComponentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Receiptcomponent)) {
            return false;
        }
        Receiptcomponent other = (Receiptcomponent) object;
        if ((this.receiptComponentId == null && other.receiptComponentId != null) || (this.receiptComponentId != null && !this.receiptComponentId.equals(other.receiptComponentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Receiptcomponent[ receiptComponentId=" + receiptComponentId + " ]";
    }
    
}
