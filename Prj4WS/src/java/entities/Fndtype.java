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
 * @author ADMIN
 */
@Entity
@Table(name = "fndtype", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Fndtype.findAll", query = "SELECT f FROM Fndtype f"),
    @NamedQuery(name = "Fndtype.findByTypeId", query = "SELECT f FROM Fndtype f WHERE f.typeId = :typeId"),
    @NamedQuery(name = "Fndtype.findByTypeName", query = "SELECT f FROM Fndtype f WHERE f.typeName = :typeName")})
public class Fndtype implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "TypeId", nullable = false)
    private Integer typeId;
    @Size(max = 100)
    @Column(name = "TypeName", length = 100)
    private String typeName;
    @OneToMany(mappedBy = "typeId")
    private List<Foodanddrink> foodanddrinkList;

    public Fndtype() {
    }

    public Fndtype(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @XmlTransient
    public List<Foodanddrink> getFoodanddrinkList() {
        return foodanddrinkList;
    }

    public void setFoodanddrinkList(List<Foodanddrink> foodanddrinkList) {
        this.foodanddrinkList = foodanddrinkList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (typeId != null ? typeId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Fndtype)) {
            return false;
        }
        Fndtype other = (Fndtype) object;
        if ((this.typeId == null && other.typeId != null) || (this.typeId != null && !this.typeId.equals(other.typeId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Fndtype[ typeId=" + typeId + " ]";
    }
    
}
