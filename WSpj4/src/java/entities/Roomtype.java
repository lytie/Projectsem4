/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
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
 * @author longly
 */
@Entity
@Table(name = "roomtype")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Roomtype.findAll", query = "SELECT r FROM Roomtype r")
    , @NamedQuery(name = "Roomtype.findByRoomTypeId", query = "SELECT r FROM Roomtype r WHERE r.roomTypeId = :roomTypeId")
    , @NamedQuery(name = "Roomtype.findByRoomTypeName", query = "SELECT r FROM Roomtype r WHERE r.roomTypeName = :roomTypeName")
    , @NamedQuery(name = "Roomtype.findByBedOptions", query = "SELECT r FROM Roomtype r WHERE r.bedOptions = :bedOptions")
    , @NamedQuery(name = "Roomtype.findByDescription", query = "SELECT r FROM Roomtype r WHERE r.description = :description")
    , @NamedQuery(name = "Roomtype.findByRoomSize", query = "SELECT r FROM Roomtype r WHERE r.roomSize = :roomSize")
    , @NamedQuery(name = "Roomtype.findByUrl", query = "SELECT r FROM Roomtype r WHERE r.url = :url")})
public class Roomtype implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "RoomTypeId")
    private Integer roomTypeId;
    @Size(max = 50)
    @Column(name = "RoomTypeName")
    private String roomTypeName;
    @Size(max = 50)
    @Column(name = "BedOptions")
    private String bedOptions;
    @Size(max = 500)
    @Column(name = "Description")
    private String description;
    @Size(max = 50)
    @Column(name = "RoomSize")
    private String roomSize;
    @Size(max = 500)
    @Column(name = "url")
    private String url;
    @OneToMany(mappedBy = "roomTypeId")
    private Collection<Room> roomCollection;

    public Roomtype() {
    }

    public Roomtype(Integer roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public Integer getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(Integer roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public String getBedOptions() {
        return bedOptions;
    }

    public void setBedOptions(String bedOptions) {
        this.bedOptions = bedOptions;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRoomSize() {
        return roomSize;
    }

    public void setRoomSize(String roomSize) {
        this.roomSize = roomSize;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @XmlTransient
    public Collection<Room> getRoomCollection() {
        return roomCollection;
    }

    public void setRoomCollection(Collection<Room> roomCollection) {
        this.roomCollection = roomCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (roomTypeId != null ? roomTypeId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Roomtype)) {
            return false;
        }
        Roomtype other = (Roomtype) object;
        if ((this.roomTypeId == null && other.roomTypeId != null) || (this.roomTypeId != null && !this.roomTypeId.equals(other.roomTypeId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Roomtype[ roomTypeId=" + roomTypeId + " ]";
    }
    
}
