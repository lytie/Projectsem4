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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "convenient", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Convenient.findAll", query = "SELECT c FROM Convenient c"),
    @NamedQuery(name = "Convenient.findByConvenientId", query = "SELECT c FROM Convenient c WHERE c.convenientId = :convenientId"),
    @NamedQuery(name = "Convenient.findByConvenientName", query = "SELECT c FROM Convenient c WHERE c.convenientName = :convenientName"),
    @NamedQuery(name = "Convenient.findByUrl", query = "SELECT c FROM Convenient c WHERE c.url = :url")})
public class Convenient implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ConvenientId", nullable = false)
    private Integer convenientId;
    @Size(max = 50)
    @Column(name = "ConvenientName", length = 50)
    private String convenientName;
    @Size(max = 500)
    @Column(name = "url", length = 500)
    private String url;
    @JoinTable(name = "roomconvenient", joinColumns = {
        @JoinColumn(name = "ConvenientId", referencedColumnName = "ConvenientId")}, inverseJoinColumns = {
        @JoinColumn(name = "RoomId", referencedColumnName = "RoomId")})
    @ManyToMany
    private List<Room> roomList;

    public Convenient() {
    }

    public Convenient(Integer convenientId) {
        this.convenientId = convenientId;
    }

    public Integer getConvenientId() {
        return convenientId;
    }

    public void setConvenientId(Integer convenientId) {
        this.convenientId = convenientId;
    }

    public String getConvenientName() {
        return convenientName;
    }

    public void setConvenientName(String convenientName) {
        this.convenientName = convenientName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @XmlTransient
    public List<Room> getRoomList() {
        return roomList;
    }

    public void setRoomList(List<Room> roomList) {
        this.roomList = roomList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (convenientId != null ? convenientId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Convenient)) {
            return false;
        }
        Convenient other = (Convenient) object;
        if ((this.convenientId == null && other.convenientId != null) || (this.convenientId != null && !this.convenientId.equals(other.convenientId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Convenient[ convenientId=" + convenientId + " ]";
    }
    
}
