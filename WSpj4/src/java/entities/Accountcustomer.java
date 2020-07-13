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
 * @author longly
 */
@Entity
@Table(name = "accountcustomer")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Accountcustomer.findAll", query = "SELECT a FROM Accountcustomer a")
    , @NamedQuery(name = "Accountcustomer.findByAccountCustomerId", query = "SELECT a FROM Accountcustomer a WHERE a.accountCustomerId = :accountCustomerId")
    , @NamedQuery(name = "Accountcustomer.findByEmail", query = "SELECT a FROM Accountcustomer a WHERE a.email = :email")
    , @NamedQuery(name = "Accountcustomer.findByPassword", query = "SELECT a FROM Accountcustomer a WHERE a.password = :password")
    , @NamedQuery(name = "Accountcustomer.findByFullName", query = "SELECT a FROM Accountcustomer a WHERE a.fullName = :fullName")
    , @NamedQuery(name = "Accountcustomer.findByPhone", query = "SELECT a FROM Accountcustomer a WHERE a.phone = :phone")
    , @NamedQuery(name = "Accountcustomer.findByToken", query = "SELECT a FROM Accountcustomer a WHERE a.token = :token")})
public class Accountcustomer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "AccountCustomerId")
    private Integer accountCustomerId;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 100)
    @Column(name = "Email")
    private String email;
    @Size(max = 255)
    @Column(name = "Password")
    private String password;
    @Size(max = 255)
    @Column(name = "FullName")
    private String fullName;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 20)
    @Column(name = "Phone")
    private String phone;
    @Size(max = 255)
    @Column(name = "token")
    private String token;

    public Accountcustomer() {
    }

    public Accountcustomer(Integer accountCustomerId) {
        this.accountCustomerId = accountCustomerId;
    }

    public Integer getAccountCustomerId() {
        return accountCustomerId;
    }

    public void setAccountCustomerId(Integer accountCustomerId) {
        this.accountCustomerId = accountCustomerId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (accountCustomerId != null ? accountCustomerId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Accountcustomer)) {
            return false;
        }
        Accountcustomer other = (Accountcustomer) object;
        if ((this.accountCustomerId == null && other.accountCustomerId != null) || (this.accountCustomerId != null && !this.accountCustomerId.equals(other.accountCustomerId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Accountcustomer[ accountCustomerId=" + accountCustomerId + " ]";
    }
    
}
