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
@Table(name = "roombooking", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Roombooking.findAll", query = "SELECT r FROM Roombooking r"),
    @NamedQuery(name = "Roombooking.findByRoomTypeName", query = "SELECT r FROM Roombooking r WHERE r.roomTypeName = :roomTypeName"),
    @NamedQuery(name = "Roombooking.findByBedOptions", query = "SELECT r FROM Roombooking r WHERE r.bedOptions = :bedOptions"),
    @NamedQuery(name = "Roombooking.findByRoomSize", query = "SELECT r FROM Roombooking r WHERE r.roomSize = :roomSize"),
    @NamedQuery(name = "Roombooking.findByUrl", query = "SELECT r FROM Roombooking r WHERE r.url = :url"),
    @NamedQuery(name = "Roombooking.findByRoomId", query = "SELECT r FROM Roombooking r WHERE r.roomId = :roomId"),
    @NamedQuery(name = "Roombooking.findByPrice", query = "SELECT r FROM Roombooking r WHERE r.price = :price")})
public class Roombooking implements Serializable {
    @Size(max = 45)
    @Column(name = "View", length = 45)
    private String view;
    private static final long serialVersionUID = 1L;
    @Size(max = 50)
    @Column(name = "RoomTypeName", length = 50)
    private String roomTypeName;
    @Size(max = 50)
    @Column(name = "BedOptions", length = 50)
    private String bedOptions;
    @Size(max = 50)
    @Column(name = "RoomSize", length = 50)
    private String roomSize;
    @Size(max = 500)
    @Column(name = "url", length = 500)
    private String url;
    @Basic(optional = false)
    @NotNull
    @Column(name = "RoomId", nullable = false)
    private int roomId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Price", precision = 12)
    private Float price;
    @Id
    private Long id;

    public Roombooking() {
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

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getView() {
        return view;
    }

    public void setView(String view) {
        this.view = view;
    }
    
}
