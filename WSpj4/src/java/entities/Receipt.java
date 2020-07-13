/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author longly
 */
@Entity
@Table(name = "receipt")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Receipt.findAll", query = "SELECT r FROM Receipt r")
    , @NamedQuery(name = "Receipt.findByReceiptId", query = "SELECT r FROM Receipt r WHERE r.receiptId = :receiptId")
    , @NamedQuery(name = "Receipt.findByPayDate", query = "SELECT r FROM Receipt r WHERE r.payDate = :payDate")
    , @NamedQuery(name = "Receipt.findBySubtotal", query = "SELECT r FROM Receipt r WHERE r.subtotal = :subtotal")
    , @NamedQuery(name = "Receipt.findByTax", query = "SELECT r FROM Receipt r WHERE r.tax = :tax")
    , @NamedQuery(name = "Receipt.findByTotal", query = "SELECT r FROM Receipt r WHERE r.total = :total")
    , @NamedQuery(name = "Receipt.findByPayStatus", query = "SELECT r FROM Receipt r WHERE r.payStatus = :payStatus")})
public class Receipt implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ReceiptId")
    private Integer receiptId;
    @Column(name = "PayDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date payDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Subtotal")
    private Float subtotal;
    @Column(name = "Tax")
    private Float tax;
    @Column(name = "Total")
    private Float total;
    @Column(name = "PayStatus")
    private Boolean payStatus;
    @OneToMany(mappedBy = "receiptId")
    private Collection<Qrcode> qrcodeCollection;
    @OneToMany(mappedBy = "receiptId")
    private Collection<Receiptcomponent> receiptcomponentCollection;

    public Receipt() {
    }

    public Receipt(Integer receiptId) {
        this.receiptId = receiptId;
    }

    public Integer getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(Integer receiptId) {
        this.receiptId = receiptId;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public Float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Float subtotal) {
        this.subtotal = subtotal;
    }

    public Float getTax() {
        return tax;
    }

    public void setTax(Float tax) {
        this.tax = tax;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public Boolean getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Boolean payStatus) {
        this.payStatus = payStatus;
    }

    @XmlTransient
    public Collection<Qrcode> getQrcodeCollection() {
        return qrcodeCollection;
    }

    public void setQrcodeCollection(Collection<Qrcode> qrcodeCollection) {
        this.qrcodeCollection = qrcodeCollection;
    }

    @XmlTransient
    public Collection<Receiptcomponent> getReceiptcomponentCollection() {
        return receiptcomponentCollection;
    }

    public void setReceiptcomponentCollection(Collection<Receiptcomponent> receiptcomponentCollection) {
        this.receiptcomponentCollection = receiptcomponentCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (receiptId != null ? receiptId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Receipt)) {
            return false;
        }
        Receipt other = (Receipt) object;
        if ((this.receiptId == null && other.receiptId != null) || (this.receiptId != null && !this.receiptId.equals(other.receiptId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Receipt[ receiptId=" + receiptId + " ]";
    }
    
}
