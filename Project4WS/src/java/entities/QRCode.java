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
@Table(name = "QRCode", catalog = "Project4DB", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "QRCode.findAll", query = "SELECT q FROM QRCode q"),
    @NamedQuery(name = "QRCode.findByQRCodeID", query = "SELECT q FROM QRCode q WHERE q.qRCodeID = :qRCodeID"),
    @NamedQuery(name = "QRCode.findByCustomerName", query = "SELECT q FROM QRCode q WHERE q.customerName = :customerName"),
    @NamedQuery(name = "QRCode.findByIdentityCard", query = "SELECT q FROM QRCode q WHERE q.identityCard = :identityCard"),
    @NamedQuery(name = "QRCode.findByEmailSendedTo", query = "SELECT q FROM QRCode q WHERE q.emailSendedTo = :emailSendedTo"),
    @NamedQuery(name = "QRCode.findByCreateDate", query = "SELECT q FROM QRCode q WHERE q.createDate = :createDate"),
    @NamedQuery(name = "QRCode.findByCheckinDate", query = "SELECT q FROM QRCode q WHERE q.checkinDate = :checkinDate"),
    @NamedQuery(name = "QRCode.findByCheckoutDate", query = "SELECT q FROM QRCode q WHERE q.checkoutDate = :checkoutDate"),
    @NamedQuery(name = "QRCode.findByStatus", query = "SELECT q FROM QRCode q WHERE q.status = :status"),
    @NamedQuery(name = "QRCode.findByCurrentAdult", query = "SELECT q FROM QRCode q WHERE q.currentAdult = :currentAdult"),
    @NamedQuery(name = "QRCode.findByCurrentChildren", query = "SELECT q FROM QRCode q WHERE q.currentChildren = :currentChildren"),
    @NamedQuery(name = "QRCode.findByImagePath", query = "SELECT q FROM QRCode q WHERE q.imagePath = :imagePath")})
public class QRCode implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "QRCodeID", nullable = false, length = 100)
    private String qRCodeID;
    @Size(max = 50)
    @Column(name = "CustomerName", length = 50)
    private String customerName;
    @Size(max = 50)
    @Column(name = "IdentityCard", length = 50)
    private String identityCard;
    @Size(max = 50)
    @Column(name = "EmailSendedTo", length = 50)
    private String emailSendedTo;
    @Column(name = "CreateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "CheckinDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkinDate;
    @Column(name = "CheckoutDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkoutDate;
    @Size(max = 50)
    @Column(name = "Status", length = 50)
    private String status;
    @Column(name = "CurrentAdult")
    private Integer currentAdult;
    @Column(name = "CurrentChildren")
    private Integer currentChildren;
    @Size(max = 500)
    @Column(name = "ImagePath", length = 500)
    private String imagePath;
    @OneToMany(mappedBy = "currentQR")
    private List<Account> accountList;
    @JoinColumn(name = "CurrentRoomNumber", referencedColumnName = "RoomID")
    @ManyToOne
    private Room currentRoomNumber;
    @JoinColumn(name = "CurrentRoomTypeID", referencedColumnName = "RoomTypeID")
    @ManyToOne
    private RoomType currentRoomTypeID;
    @OneToMany(mappedBy = "qRCode")
    private List<Receipt> receiptList;

    public QRCode() {
    }

    public QRCode(String qRCodeID) {
        this.qRCodeID = qRCodeID;
    }

    public String getQRCodeID() {
        return qRCodeID;
    }

    public void setQRCodeID(String qRCodeID) {
        this.qRCodeID = qRCodeID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
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

    public Date getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(Date checkinDate) {
        this.checkinDate = checkinDate;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getCurrentAdult() {
        return currentAdult;
    }

    public void setCurrentAdult(Integer currentAdult) {
        this.currentAdult = currentAdult;
    }

    public Integer getCurrentChildren() {
        return currentChildren;
    }

    public void setCurrentChildren(Integer currentChildren) {
        this.currentChildren = currentChildren;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @XmlTransient
    public List<Account> getAccountList() {
        return accountList;
    }

    public void setAccountList(List<Account> accountList) {
        this.accountList = accountList;
    }

    public Room getCurrentRoomNumber() {
        return currentRoomNumber;
    }

    public void setCurrentRoomNumber(Room currentRoomNumber) {
        this.currentRoomNumber = currentRoomNumber;
    }

    public RoomType getCurrentRoomTypeID() {
        return currentRoomTypeID;
    }

    public void setCurrentRoomTypeID(RoomType currentRoomTypeID) {
        this.currentRoomTypeID = currentRoomTypeID;
    }

    @XmlTransient
    public List<Receipt> getReceiptList() {
        return receiptList;
    }

    public void setReceiptList(List<Receipt> receiptList) {
        this.receiptList = receiptList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (qRCodeID != null ? qRCodeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof QRCode)) {
            return false;
        }
        QRCode other = (QRCode) object;
        if ((this.qRCodeID == null && other.qRCodeID != null) || (this.qRCodeID != null && !this.qRCodeID.equals(other.qRCodeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.QRCode[ qRCodeID=" + qRCodeID + " ]";
    }
    
}
