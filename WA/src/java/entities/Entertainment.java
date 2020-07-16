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
@Table(name = "entertainment", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Entertainment.findAll", query = "SELECT e FROM Entertainment e"),
    @NamedQuery(name = "Entertainment.findByEntertainmentId", query = "SELECT e FROM Entertainment e WHERE e.entertainmentId = :entertainmentId"),
    @NamedQuery(name = "Entertainment.findByEntertainmentName", query = "SELECT e FROM Entertainment e WHERE e.entertainmentName = :entertainmentName"),
    @NamedQuery(name = "Entertainment.findByTicketPrice", query = "SELECT e FROM Entertainment e WHERE e.ticketPrice = :ticketPrice"),
    @NamedQuery(name = "Entertainment.findByEntertainmentDescription", query = "SELECT e FROM Entertainment e WHERE e.entertainmentDescription = :entertainmentDescription"),
    @NamedQuery(name = "Entertainment.findByEntertainmentUrl", query = "SELECT e FROM Entertainment e WHERE e.entertainmentUrl = :entertainmentUrl")})
public class Entertainment implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "EntertainmentId", nullable = false)
    private Integer entertainmentId;
    @Size(max = 100)
    @Column(name = "EntertainmentName", length = 100)
    private String entertainmentName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "TicketPrice", precision = 12)
    private Float ticketPrice;
    @Size(max = 255)
    @Column(name = "EntertainmentDescription", length = 255)
    private String entertainmentDescription;
    @Size(max = 500)
    @Column(name = "EntertainmentUrl", length = 500)
    private String entertainmentUrl;

    public Entertainment() {
    }

    public Entertainment(Integer entertainmentId) {
        this.entertainmentId = entertainmentId;
    }

    public Integer getEntertainmentId() {
        return entertainmentId;
    }

    public void setEntertainmentId(Integer entertainmentId) {
        this.entertainmentId = entertainmentId;
    }

    public String getEntertainmentName() {
        return entertainmentName;
    }

    public void setEntertainmentName(String entertainmentName) {
        this.entertainmentName = entertainmentName;
    }

    public Float getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(Float ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getEntertainmentDescription() {
        return entertainmentDescription;
    }

    public void setEntertainmentDescription(String entertainmentDescription) {
        this.entertainmentDescription = entertainmentDescription;
    }

    public String getEntertainmentUrl() {
        return entertainmentUrl;
    }

    public void setEntertainmentUrl(String entertainmentUrl) {
        this.entertainmentUrl = entertainmentUrl;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (entertainmentId != null ? entertainmentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Entertainment)) {
            return false;
        }
        Entertainment other = (Entertainment) object;
        if ((this.entertainmentId == null && other.entertainmentId != null) || (this.entertainmentId != null && !this.entertainmentId.equals(other.entertainmentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Entertainment[ entertainmentId=" + entertainmentId + " ]";
    }
    
}
