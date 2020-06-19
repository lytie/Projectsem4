/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.io.Serializable;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "Service", catalog = "Project4DB", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Service.findAll", query = "SELECT s FROM Service s"),
    @NamedQuery(name = "Service.findByServiceID", query = "SELECT s FROM Service s WHERE s.serviceID = :serviceID"),
    @NamedQuery(name = "Service.findByServiceName", query = "SELECT s FROM Service s WHERE s.serviceName = :serviceName"),
    @NamedQuery(name = "Service.findByServicePrice", query = "SELECT s FROM Service s WHERE s.servicePrice = :servicePrice")})
public class Service implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ServiceID", nullable = false)
    private Integer serviceID;
    @Size(max = 50)
    @Column(name = "ServiceName", length = 50)
    private String serviceName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "ServicePrice", precision = 53)
    private Double servicePrice;
    @OneToMany(mappedBy = "serviceID")
    private List<ReceiptComponent> receiptComponentList;
    @JoinColumn(name = "ServiceTypeID", referencedColumnName = "ServiceTypeID")
    @ManyToOne
    private ServiceType serviceTypeID;

    public Service() {
    }

    public Service(Integer serviceID) {
        this.serviceID = serviceID;
    }

    public Integer getServiceID() {
        return serviceID;
    }

    public void setServiceID(Integer serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Double getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(Double servicePrice) {
        this.servicePrice = servicePrice;
    }

    @XmlTransient
    public List<ReceiptComponent> getReceiptComponentList() {
        return receiptComponentList;
    }

    public void setReceiptComponentList(List<ReceiptComponent> receiptComponentList) {
        this.receiptComponentList = receiptComponentList;
    }

    public ServiceType getServiceTypeID() {
        return serviceTypeID;
    }

    public void setServiceTypeID(ServiceType serviceTypeID) {
        this.serviceTypeID = serviceTypeID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (serviceID != null ? serviceID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Service)) {
            return false;
        }
        Service other = (Service) object;
        if ((this.serviceID == null && other.serviceID != null) || (this.serviceID != null && !this.serviceID.equals(other.serviceID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Service[ serviceID=" + serviceID + " ]";
    }
    
}
