/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "v_convenientroom", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VConvenientroom.findAll", query = "SELECT v FROM VConvenientroom v"),
    @NamedQuery(name = "VConvenientroom.findByRoomId", query = "SELECT v FROM VConvenientroom v WHERE v.roomId = :roomId"),
    @NamedQuery(name = "VConvenientroom.findByConvenientName", query = "SELECT v FROM VConvenientroom v WHERE v.convenientName = :convenientName"),
    @NamedQuery(name = "VConvenientroom.findByUrl", query = "SELECT v FROM VConvenientroom v WHERE v.url = :url")})
public class VConvenientroom implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "RoomId")
    @Id
    private Integer roomId;
    @Size(max = 50)
    @Column(name = "ConvenientName", length = 50)
    private String convenientName;
    @Size(max = 500)
    @Column(name = "url", length = 500)
    private String url;

    public VConvenientroom() {
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
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
    
}
