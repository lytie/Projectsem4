/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "feedback", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Feedback.findAll", query = "SELECT f FROM Feedback f"),
    @NamedQuery(name = "Feedback.findByFeedBackId", query = "SELECT f FROM Feedback f WHERE f.feedBackId = :feedBackId"),
    @NamedQuery(name = "Feedback.findByFeedBackMessage", query = "SELECT f FROM Feedback f WHERE f.feedBackMessage = :feedBackMessage")})
public class Feedback implements Serializable {
    @Column(name = "FeedBackTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date feedBackTime;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "FeedBackId", nullable = false)
    private Integer feedBackId;
    @Size(max = 255)
    @Column(name = "FeedBackMessage", length = 255)
    private String feedBackMessage;
    @JoinColumn(name = "QrCodeId", referencedColumnName = "QrCodeId")
    @ManyToOne
    private Qrcode qrCodeId;

    public Feedback() {
    }

    public Feedback(Integer feedBackId) {
        this.feedBackId = feedBackId;
    }

    public Integer getFeedBackId() {
        return feedBackId;
    }

    public void setFeedBackId(Integer feedBackId) {
        this.feedBackId = feedBackId;
    }

    public String getFeedBackMessage() {
        return feedBackMessage;
    }

    public void setFeedBackMessage(String feedBackMessage) {
        this.feedBackMessage = feedBackMessage;
    }

    public Qrcode getQrCodeId() {
        return qrCodeId;
    }

    public void setQrCodeId(Qrcode qrCodeId) {
        this.qrCodeId = qrCodeId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (feedBackId != null ? feedBackId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Feedback)) {
            return false;
        }
        Feedback other = (Feedback) object;
        if ((this.feedBackId == null && other.feedBackId != null) || (this.feedBackId != null && !this.feedBackId.equals(other.feedBackId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Feedback[ feedBackId=" + feedBackId + " ]";
    }

    public Date getFeedBackTime() {
        return feedBackTime;
    }

    public void setFeedBackTime(Date feedBackTime) {
        this.feedBackTime = feedBackTime;
    }
    
}
