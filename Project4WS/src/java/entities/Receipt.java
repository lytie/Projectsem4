/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "Receipt", catalog = "Project4DB", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Receipt.findAll", query = "SELECT r FROM Receipt r"),
    @NamedQuery(name = "Receipt.findByReceiptID", query = "SELECT r FROM Receipt r WHERE r.receiptID = :receiptID"),
    @NamedQuery(name = "Receipt.findByCreateDate", query = "SELECT r FROM Receipt r WHERE r.createDate = :createDate"),
    @NamedQuery(name = "Receipt.findBySubtotal", query = "SELECT r FROM Receipt r WHERE r.subtotal = :subtotal"),
    @NamedQuery(name = "Receipt.findByTax", query = "SELECT r FROM Receipt r WHERE r.tax = :tax"),
    @NamedQuery(name = "Receipt.findByTotal", query = "SELECT r FROM Receipt r WHERE r.total = :total"),
    @NamedQuery(name = "Receipt.findByPaymentMethod", query = "SELECT r FROM Receipt r WHERE r.paymentMethod = :paymentMethod"),
    @NamedQuery(name = "Receipt.findByStatus", query = "SELECT r FROM Receipt r WHERE r.status = :status")})
public class Receipt implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ReceiptID", nullable = false)
    private Integer receiptID;
    @Column(name = "CreateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Subtotal", precision = 53)
    private Double subtotal;
    @Column(name = "Tax", precision = 53)
    private Double tax;
    @Column(name = "Total", precision = 53)
    private Double total;
    @Size(max = 50)
    @Column(name = "PaymentMethod", length = 50)
    private String paymentMethod;
    @Column(name = "Status")
    private Boolean status;
    @OneToMany(mappedBy = "receiptID")
    private List<ReceiptComponent> receiptComponentList;
    @JoinColumn(name = "QRCode", referencedColumnName = "QRCodeID")
    @ManyToOne
    private QRCode qRCode;

    public Receipt() {
    }

    public Receipt(Integer receiptID) {
        this.receiptID = receiptID;
    }

    public Integer getReceiptID() {
        return receiptID;
    }

    public void setReceiptID(Integer receiptID) {
        this.receiptID = receiptID;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax = tax;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @XmlTransient
    public List<ReceiptComponent> getReceiptComponentList() {
        return receiptComponentList;
    }

    public void setReceiptComponentList(List<ReceiptComponent> receiptComponentList) {
        this.receiptComponentList = receiptComponentList;
    }

    public QRCode getQRCode() {
        return qRCode;
    }

    public void setQRCode(QRCode qRCode) {
        this.qRCode = qRCode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (receiptID != null ? receiptID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Receipt)) {
            return false;
        }
        Receipt other = (Receipt) object;
        if ((this.receiptID == null && other.receiptID != null) || (this.receiptID != null && !this.receiptID.equals(other.receiptID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Receipt[ receiptID=" + receiptID + " ]";
    }
    
}
