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
@Table(name = "RoomType", catalog = "Project4DB", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RoomType.findAll", query = "SELECT r FROM RoomType r"),
    @NamedQuery(name = "RoomType.findByRoomTypeID", query = "SELECT r FROM RoomType r WHERE r.roomTypeID = :roomTypeID"),
    @NamedQuery(name = "RoomType.findByRoomTypeName", query = "SELECT r FROM RoomType r WHERE r.roomTypeName = :roomTypeName"),
    @NamedQuery(name = "RoomType.findByAvailableNum", query = "SELECT r FROM RoomType r WHERE r.availableNum = :availableNum"),
    @NamedQuery(name = "RoomType.findByRoomTypePrice", query = "SELECT r FROM RoomType r WHERE r.roomTypePrice = :roomTypePrice"),
    @NamedQuery(name = "RoomType.findByMaximumAdultCapacity", query = "SELECT r FROM RoomType r WHERE r.maximumAdultCapacity = :maximumAdultCapacity"),
    @NamedQuery(name = "RoomType.findByMaximumChildrenCapacity", query = "SELECT r FROM RoomType r WHERE r.maximumChildrenCapacity = :maximumChildrenCapacity")})
public class RoomType implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "RoomTypeID", nullable = false)
    private Integer roomTypeID;
    @Size(max = 70)
    @Column(name = "RoomTypeName", length = 70)
    private String roomTypeName;
    @Column(name = "AvailableNum")
    private Integer availableNum;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "RoomTypePrice", precision = 53)
    private Double roomTypePrice;
    @Column(name = "MaximumAdultCapacity")
    private Integer maximumAdultCapacity;
    @Column(name = "MaximumChildrenCapacity")
    private Integer maximumChildrenCapacity;
    @OneToMany(mappedBy = "currentRoomTypeID")
    private List<QRCode> qRCodeList;
    @JoinColumn(name = "LocationID", referencedColumnName = "LocationID")
    @ManyToOne
    private Location locationID;
    @OneToMany(mappedBy = "roomTypeID")
    private List<RoomImage> roomImageList;
    @OneToMany(mappedBy = "roomTypeID")
    private List<Room> roomList;

    public RoomType() {
    }

    public RoomType(Integer roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public Integer getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(Integer roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public Integer getAvailableNum() {
        return availableNum;
    }

    public void setAvailableNum(Integer availableNum) {
        this.availableNum = availableNum;
    }

    public Double getRoomTypePrice() {
        return roomTypePrice;
    }

    public void setRoomTypePrice(Double roomTypePrice) {
        this.roomTypePrice = roomTypePrice;
    }

    public Integer getMaximumAdultCapacity() {
        return maximumAdultCapacity;
    }

    public void setMaximumAdultCapacity(Integer maximumAdultCapacity) {
        this.maximumAdultCapacity = maximumAdultCapacity;
    }

    public Integer getMaximumChildrenCapacity() {
        return maximumChildrenCapacity;
    }

    public void setMaximumChildrenCapacity(Integer maximumChildrenCapacity) {
        this.maximumChildrenCapacity = maximumChildrenCapacity;
    }

    @XmlTransient
    public List<QRCode> getQRCodeList() {
        return qRCodeList;
    }

    public void setQRCodeList(List<QRCode> qRCodeList) {
        this.qRCodeList = qRCodeList;
    }

    public Location getLocationID() {
        return locationID;
    }

    public void setLocationID(Location locationID) {
        this.locationID = locationID;
    }

    @XmlTransient
    public List<RoomImage> getRoomImageList() {
        return roomImageList;
    }

    public void setRoomImageList(List<RoomImage> roomImageList) {
        this.roomImageList = roomImageList;
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
        hash += (roomTypeID != null ? roomTypeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RoomType)) {
            return false;
        }
        RoomType other = (RoomType) object;
        if ((this.roomTypeID == null && other.roomTypeID != null) || (this.roomTypeID != null && !this.roomTypeID.equals(other.roomTypeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.RoomType[ roomTypeID=" + roomTypeID + " ]";
    }
    
}
