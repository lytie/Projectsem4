/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "qrcode", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Qrcode.findAll", query = "SELECT q FROM Qrcode q"),
    @NamedQuery(name = "Qrcode.findByQrCodeId", query = "SELECT q FROM Qrcode q WHERE q.qrCodeId = :qrCodeId"),
    @NamedQuery(name = "Qrcode.findByCustomerName", query = "SELECT q FROM Qrcode q WHERE q.customerName = :customerName"),
    @NamedQuery(name = "Qrcode.findByEmailSendedTo", query = "SELECT q FROM Qrcode q WHERE q.emailSendedTo = :emailSendedTo"),
    @NamedQuery(name = "Qrcode.findByCreateDate", query = "SELECT q FROM Qrcode q WHERE q.createDate = :createDate"),
    @NamedQuery(name = "Qrcode.findByCheckInDate", query = "SELECT q FROM Qrcode q WHERE q.checkInDate = :checkInDate"),
    @NamedQuery(name = "Qrcode.findByCheckOutDate", query = "SELECT q FROM Qrcode q WHERE q.checkOutDate = :checkOutDate"),
    @NamedQuery(name = "Qrcode.findByAdultsNum", query = "SELECT q FROM Qrcode q WHERE q.adultsNum = :adultsNum"),
    @NamedQuery(name = "Qrcode.findByChildrenNum", query = "SELECT q FROM Qrcode q WHERE q.childrenNum = :childrenNum"),
    @NamedQuery(name = "Qrcode.findByDeposits", query = "SELECT q FROM Qrcode q WHERE q.deposits = :deposits"),
    @NamedQuery(name = "Qrcode.findByUrl", query = "SELECT q FROM Qrcode q WHERE q.url = :url")})
public class Qrcode implements Serializable {
    @Column(name = "AccountCustomerId")
    private Integer accountCustomerId;
    @Column(name = "Status")
    private Boolean status;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "QrCodeId", nullable = false, length = 255)
    private String qrCodeId;
    @Size(max = 100)
    @Column(name = "CustomerName", length = 100)
    private String customerName;
    @Size(max = 100)
    @Column(name = "EmailSendedTo", length = 100)
    private String emailSendedTo;
    @Column(name = "CreateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "CheckInDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkInDate;
    @Column(name = "CheckOutDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkOutDate;
    @Column(name = "AdultsNum")
    private Integer adultsNum;
    @Column(name = "ChildrenNum")
    private Integer childrenNum;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Deposits", precision = 12, scale = 0)
    private Float deposits;
    @Size(max = 255)
    @Column(name = "Url", length = 255)
    private String url;
    @JoinColumn(name = "ReceiptId", referencedColumnName = "ReceiptId")
    @ManyToOne
    private Receipt receiptId;
    @JoinColumns({
        @JoinColumn(name = "RoomId", referencedColumnName = "RoomId"),
        @JoinColumn(name = "RoomId", referencedColumnName = "RoomId")})
    @ManyToOne
    private Room room;
    @OneToMany(mappedBy = "qrCodeId")
    private List<Feedback> feedbackList;

    public Qrcode() {
    }

    public Qrcode(String qrCodeId) {
        this.qrCodeId = qrCodeId;
    }

    public String getQrCodeId() {
        return qrCodeId;
    }

    public void setQrCodeId(String qrCodeId) {
        this.qrCodeId = qrCodeId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEmailSendedTo() {
        return emailSendedTo;
    }

    public void setEmailSendedTo(String emailSendedTo) {
        this.emailSendedTo = emailSendedTo;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public Integer getAdultsNum() {
        return adultsNum;
    }

    public void setAdultsNum(Integer adultsNum) {
        this.adultsNum = adultsNum;
    }

    public Integer getChildrenNum() {
        return childrenNum;
    }

    public void setChildrenNum(Integer childrenNum) {
        this.childrenNum = childrenNum;
    }

    public Float getDeposits() {
        return deposits;
    }

    public void setDeposits(Float deposits) {
        this.deposits = deposits;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Receipt getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(Receipt receiptId) {
        this.receiptId = receiptId;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @XmlTransient
    public List<Feedback> getFeedbackList() {
        return feedbackList;
    }

    public void setFeedbackList(List<Feedback> feedbackList) {
        this.feedbackList = feedbackList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (qrCodeId != null ? qrCodeId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Qrcode)) {
            return false;
        }
        Qrcode other = (Qrcode) object;
        if ((this.qrCodeId == null && other.qrCodeId != null) || (this.qrCodeId != null && !this.qrCodeId.equals(other.qrCodeId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Qrcode[ qrCodeId=" + qrCodeId + " ]";
    }

    public Integer getAccountCustomerId() {
        return accountCustomerId;
    }

    public void setAccountCustomerId(Integer accountCustomerId) {
        this.accountCustomerId = accountCustomerId;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
    
}
