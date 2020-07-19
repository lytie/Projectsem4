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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "servicetype", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Servicetype.findAll", query = "SELECT s FROM Servicetype s"),
    @NamedQuery(name = "Servicetype.findByServiceTypeId", query = "SELECT s FROM Servicetype s WHERE s.serviceTypeId = :serviceTypeId"),
    @NamedQuery(name = "Servicetype.findByTypeName", query = "SELECT s FROM Servicetype s WHERE s.typeName = :typeName")})
public class Servicetype implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ServiceTypeId", nullable = false)
    private Integer serviceTypeId;
    @Size(max = 100)
    @Column(name = "TypeName", length = 100)
    private String typeName;
    @OneToMany(mappedBy = "serivceTypeId")
    private List<Service> serviceList;

    public Servicetype() {
    }

    public Servicetype(Integer serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public Integer getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(Integer serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
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
        hash += (serviceTypeId != null ? serviceTypeId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Servicetype)) {
            return false;
        }
        Servicetype other = (Servicetype) object;
        if ((this.serviceTypeId == null && other.serviceTypeId != null) || (this.serviceTypeId != null && !this.serviceTypeId.equals(other.serviceTypeId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Servicetype[ serviceTypeId=" + serviceTypeId + " ]";
    }
    
}
