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
@Table(name = "ServiceType", catalog = "Project4DB", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ServiceType.findAll", query = "SELECT s FROM ServiceType s"),
    @NamedQuery(name = "ServiceType.findByServiceTypeID", query = "SELECT s FROM ServiceType s WHERE s.serviceTypeID = :serviceTypeID"),
    @NamedQuery(name = "ServiceType.findByServiceTypeName", query = "SELECT s FROM ServiceType s WHERE s.serviceTypeName = :serviceTypeName")})
public class ServiceType implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ServiceTypeID", nullable = false)
    private Integer serviceTypeID;
    @Size(max = 50)
    @Column(name = "ServiceTypeName", length = 50)
    private String serviceTypeName;
    @OneToMany(mappedBy = "serviceTypeID")
    private List<Service> serviceList;

    public ServiceType() {
    }

    public ServiceType(Integer serviceTypeID) {
        this.serviceTypeID = serviceTypeID;
    }

    public Integer getServiceTypeID() {
        return serviceTypeID;
    }

    public void setServiceTypeID(Integer serviceTypeID) {
        this.serviceTypeID = serviceTypeID;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    @XmlTransient
    public List<Service> getServiceList() {
        return serviceList;
    }

    public void setServiceList(List<Service> serviceList) {
        this.serviceList = serviceList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (serviceTypeID != null ? serviceTypeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ServiceType)) {
            return false;
        }
        ServiceType other = (ServiceType) object;
        if ((this.serviceTypeID == null && other.serviceTypeID != null) || (this.serviceTypeID != null && !this.serviceTypeID.equals(other.serviceTypeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.ServiceType[ serviceTypeID=" + serviceTypeID + " ]";
    }
    
}
