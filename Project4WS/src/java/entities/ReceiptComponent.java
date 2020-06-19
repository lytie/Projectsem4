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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "ReceiptComponent", catalog = "Project4DB", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReceiptComponent.findAll", query = "SELECT r FROM ReceiptComponent r"),
    @NamedQuery(name = "ReceiptComponent.findByReceiptComponentID", query = "SELECT r FROM ReceiptComponent r WHERE r.receiptComponentID = :receiptComponentID"),
    @NamedQuery(name = "ReceiptComponent.findByQuantity", query = "SELECT r FROM ReceiptComponent r WHERE r.quantity = :quantity"),
    @NamedQuery(name = "ReceiptComponent.findBySubtotal", query = "SELECT r FROM ReceiptComponent r WHERE r.subtotal = :subtotal")})
public class ReceiptComponent implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ReceiptComponentID", nullable = false)
    private Integer receiptComponentID;
    @Column(name = "Quantity")
    private Integer quantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Subtotal", precision = 53)
    private Double subtotal;
    @JoinColumn(name = "ReceiptID", referencedColumnName = "ReceiptID")
    @ManyToOne
    private Receipt receiptID;
    @JoinColumn(name = "ServiceID", referencedColumnName = "ServiceID")
    @ManyToOne
    private Service serviceID;

    public ReceiptComponent() {
    }

    public ReceiptComponent(Integer receiptComponentID) {
        this.receiptComponentID = receiptComponentID;
    }

    public Integer getReceiptComponentID() {
        return receiptComponentID;
    }

    public void setReceiptComponentID(Integer receiptComponentID) {
        this.receiptComponentID = receiptComponentID;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Receipt getReceiptID() {
        return receiptID;
    }

    public void setReceiptID(Receipt receiptID) {
        this.receiptID = receiptID;
    }

    public Service getServiceID() {
        return serviceID;
    }

    public void setServiceID(Service serviceID) {
        this.serviceID = serviceID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (receiptComponentID != null ? receiptComponentID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReceiptComponent)) {
            return false;
        }
        ReceiptComponent other = (ReceiptComponent) object;
        if ((this.receiptComponentID == null && other.receiptComponentID != null) || (this.receiptComponentID != null && !this.receiptComponentID.equals(other.receiptComponentID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.ReceiptComponent[ receiptComponentID=" + receiptComponentID + " ]";
    }
    
}
