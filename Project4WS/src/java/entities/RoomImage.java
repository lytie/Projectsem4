/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "RoomImage", catalog = "Project4DB", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RoomImage.findAll", query = "SELECT r FROM RoomImage r"),
    @NamedQuery(name = "RoomImage.findByRoomImgID", query = "SELECT r FROM RoomImage r WHERE r.roomImgID = :roomImgID"),
    @NamedQuery(name = "RoomImage.findByImagePath", query = "SELECT r FROM RoomImage r WHERE r.imagePath = :imagePath")})
public class RoomImage implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "RoomImgID", nullable = false)
    private Integer roomImgID;
    @Size(max = 500)
    @Column(name = "ImagePath", length = 500)
    private String imagePath;
    @JoinColumn(name = "RoomTypeID", referencedColumnName = "RoomTypeID")
    @ManyToOne
    private RoomType roomTypeID;

    public RoomImage() {
    }

    public RoomImage(Integer roomImgID) {
        this.roomImgID = roomImgID;
    }

    public Integer getRoomImgID() {
        return roomImgID;
    }

    public void setRoomImgID(Integer roomImgID) {
        this.roomImgID = roomImgID;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public RoomType getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(RoomType roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (roomImgID != null ? roomImgID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RoomImage)) {
            return false;
        }
        RoomImage other = (RoomImage) object;
        if ((this.roomImgID == null && other.roomImgID != null) || (this.roomImgID != null && !this.roomImgID.equals(other.roomImgID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.RoomImage[ roomImgID=" + roomImgID + " ]";
    }
    
}
