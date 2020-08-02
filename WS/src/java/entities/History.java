/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "history", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "History.findAll", query = "SELECT h FROM History h"),
    @NamedQuery(name = "History.findByUrl", query = "SELECT h FROM History h WHERE h.url = :url"),
    @NamedQuery(name = "History.findByRoomTypeName", query = "SELECT h FROM History h WHERE h.roomTypeName = :roomTypeName"),
    @NamedQuery(name = "History.findByLocationName", query = "SELECT h FROM History h WHERE h.locationName = :locationName"),
    @NamedQuery(name = "History.findByCheckInDate", query = "SELECT h FROM History h WHERE h.checkInDate = :checkInDate"),
    @NamedQuery(name = "History.findByCheckOutDate", query = "SELECT h FROM History h WHERE h.checkOutDate = :checkOutDate"),
    @NamedQuery(name = "History.findBySubtotal", query = "SELECT h FROM History h WHERE h.subtotal = :subtotal"),
    @NamedQuery(name = "History.findByTax", query = "SELECT h FROM History h WHERE h.tax = :tax"),
    @NamedQuery(name = "History.findByDeposits", query = "SELECT h FROM History h WHERE h.deposits = :deposits"),
    @NamedQuery(name = "History.findByTotal", query = "SELECT h FROM History h WHERE h.total = :total"),
    @NamedQuery(name = "History.findByReceiptId", query = "SELECT h FROM History h WHERE h.receiptId = :receiptId"),
    @NamedQuery(name = "History.findByAccountCustomerId", query = "SELECT h FROM History h WHERE h.accountCustomerId = :accountCustomerId")})
public class History implements Serializable {
    private static final long serialVersionUID = 1L;
    @Size(max = 500)
    @Column(name = "url", length = 500)
    private String url;
    @Size(max = 50)
    @Column(name = "RoomTypeName", length = 50)
    private String roomTypeName;
    @Size(max = 50)
    @Column(name = "LocationName", length = 50)
    private String locationName;
    @Column(name = "CheckInDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkInDate;
    @Column(name = "CheckOutDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkOutDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Subtotal", precision = 12)
    private Float subtotal;
    @Column(name = "Tax", precision = 12)
    private Float tax;
    @Column(name = "Deposits", precision = 12)
    private Float deposits;
    @Column(name = "Total", precision = 12)
    private Float total;
    
    @Column(name = "ReceiptId")
    @Id
    private Integer receiptId;
    @Column(name = "AccountCustomerId")
    
    private Integer accountCustomerId;
    
   

    public History() {
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
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

    public Float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Float subtotal) {
        this.subtotal = subtotal;
    }

    public Float getTax() {
        return tax;
    }

    public void setTax(Float tax) {
        this.tax = tax;
    }

    public Float getDeposits() {
        return deposits;
    }

    public void setDeposits(Float deposits) {
        this.deposits = deposits;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public Integer getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(Integer receiptId) {
        this.receiptId = receiptId;
    }

    public Integer getAccountCustomerId() {
        return accountCustomerId;
    }

    public void setAccountCustomerId(Integer accountCustomerId) {
        this.accountCustomerId = accountCustomerId;
    }

    
    
}
