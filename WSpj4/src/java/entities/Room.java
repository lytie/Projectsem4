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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
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
@Table(name = "room")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Room.findAll", query = "SELECT r FROM Room r")
    , @NamedQuery(name = "Room.findByRoomId", query = "SELECT r FROM Room r WHERE r.roomId = :roomId")
    , @NamedQuery(name = "Room.findByPrice", query = "SELECT r FROM Room r WHERE r.price = :price")
    , @NamedQuery(name = "Room.findByStatus", query = "SELECT r FROM Room r WHERE r.status = :status")
    , @NamedQuery(name = "Room.findByDescription", query = "SELECT r FROM Room r WHERE r.description = :description")
    , @NamedQuery(name = "Room.findByAdultOpacity", query = "SELECT r FROM Room r WHERE r.adultOpacity = :adultOpacity")
    , @NamedQuery(name = "Room.findByChildrenOpacity", query = "SELECT r FROM Room r WHERE r.childrenOpacity = :childrenOpacity")})
public class Room implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "RoomId")
    private Integer roomId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Price")
    private Float price;
    @Column(name = "Status")
    private Boolean status;
    @Size(max = 255)
    @Column(name = "Description")
    private String description;
    @Column(name = "AdultOpacity")
    private Integer adultOpacity;
    @Column(name = "ChildrenOpacity")
    private Integer childrenOpacity;
    @ManyToMany(mappedBy = "roomCollection")
    private Collection<Convenient> convenientCollection;
    @OneToMany(mappedBy = "roomId")
    private Collection<Qrcode> qrcodeCollection;
    @OneToMany(mappedBy = "roomId")
    private Collection<Roomimage> roomimageCollection;
    @JoinColumn(name = "LocationId", referencedColumnName = "LocationId")
    @ManyToOne
    private Location locationId;
    @JoinColumn(name = "RoomTypeId", referencedColumnName = "RoomTypeId")
    @ManyToOne
    private Roomtype roomTypeId;

    public Room() {
    }

    public Room(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getAdultOpacity() {
        return adultOpacity;
    }

    public void setAdultOpacity(Integer adultOpacity) {
        this.adultOpacity = adultOpacity;
    }

    public Integer getChildrenOpacity() {
        return childrenOpacity;
    }

    public void setChildrenOpacity(Integer childrenOpacity) {
        this.childrenOpacity = childrenOpacity;
    }

    @XmlTransient
    public Collection<Convenient> getConvenientCollection() {
        return convenientCollection;
    }

    public void setConvenientCollection(Collection<Convenient> convenientCollection) {
        this.convenientCollection = convenientCollection;
    }

    @XmlTransient
    public Collection<Qrcode> getQrcodeCollection() {
        return qrcodeCollection;
    }

    public void setQrcodeCollection(Collection<Qrcode> qrcodeCollection) {
        this.qrcodeCollection = qrcodeCollection;
    }

    @XmlTransient
    public Collection<Roomimage> getRoomimageCollection() {
        return roomimageCollection;
    }

    public void setRoomimageCollection(Collection<Roomimage> roomimageCollection) {
        this.roomimageCollection = roomimageCollection;
    }

    public Location getLocationId() {
        return locationId;
    }

    public void setLocationId(Location locationId) {
        this.locationId = locationId;
    }

    public Roomtype getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(Roomtype roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (roomId != null ? roomId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Room)) {
            return false;
        }
        Room other = (Room) object;
        if ((this.roomId == null && other.roomId != null) || (this.roomId != null && !this.roomId.equals(other.roomId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Room[ roomId=" + roomId + " ]";
    }
    
}
