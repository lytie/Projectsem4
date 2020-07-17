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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "roomconvenient", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Roomconvenient.findAll", query = "SELECT r FROM Roomconvenient r"),
    @NamedQuery(name = "Roomconvenient.findById", query = "SELECT r FROM Roomconvenient r WHERE r.id = :id")})
public class Roomconvenient implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @JoinColumn(name = "ConvenientId", referencedColumnName = "ConvenientId")
    @ManyToOne
    private Convenient convenientId;
    @JoinColumn(name = "RoomId", referencedColumnName = "RoomId")
    @ManyToOne
    private Room roomId;

    public Roomconvenient() {
    }

    public Roomconvenient(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Convenient getConvenientId() {
        return convenientId;
    }

    public void setConvenientId(Convenient convenientId) {
        this.convenientId = convenientId;
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
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Roomconvenient)) {
            return false;
        }
        Roomconvenient other = (Roomconvenient) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Roomconvenient[ id=" + id + " ]";
    }
    
}
