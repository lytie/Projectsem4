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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author longly
 */
@Entity
@Table(name = "roomimage")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Roomimage.findAll", query = "SELECT r FROM Roomimage r")
    , @NamedQuery(name = "Roomimage.findByRoomImageId", query = "SELECT r FROM Roomimage r WHERE r.roomImageId = :roomImageId")
    , @NamedQuery(name = "Roomimage.findByUrl", query = "SELECT r FROM Roomimage r WHERE r.url = :url")})
public class Roomimage implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "RoomImageId")
    private Integer roomImageId;
    @Size(max = 500)
    @Column(name = "Url")
    private String url;
    @JoinColumn(name = "RoomId", referencedColumnName = "RoomId")
    @ManyToOne
    private Room roomId;

    public Roomimage() {
    }

    public Roomimage(Integer roomImageId) {
        this.roomImageId = roomImageId;
    }

    public Integer getRoomImageId() {
        return roomImageId;
    }

    public void setRoomImageId(Integer roomImageId) {
        this.roomImageId = roomImageId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Room getRoomId() {
        return roomId;
    }

    public void setRoomId(Room roomId) {
        this.roomId = roomId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (roomImageId != null ? roomImageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Roomimage)) {
            return false;
        }
        Roomimage other = (Roomimage) object;
        if ((this.roomImageId == null && other.roomImageId != null) || (this.roomImageId != null && !this.roomImageId.equals(other.roomImageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Roomimage[ roomImageId=" + roomImageId + " ]";
    }
    
}
