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
 * @author ADMIN
 */
@Entity
@Table(name = "accountemployee", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Accountemployee.findAll", query = "SELECT a FROM Accountemployee a"),
    @NamedQuery(name = "Accountemployee.findByAccountId", query = "SELECT a FROM Accountemployee a WHERE a.accountId = :accountId"),
    @NamedQuery(name = "Accountemployee.findByEmail", query = "SELECT a FROM Accountemployee a WHERE a.email = :email"),
    @NamedQuery(name = "Accountemployee.findByPassword", query = "SELECT a FROM Accountemployee a WHERE a.password = :password"),
    @NamedQuery(name = "Accountemployee.findByFullName", query = "SELECT a FROM Accountemployee a WHERE a.fullName = :fullName"),
    @NamedQuery(name = "Accountemployee.findByPhone", query = "SELECT a FROM Accountemployee a WHERE a.phone = :phone"),
    @NamedQuery(name = "Accountemployee.findByDateOfBirth", query = "SELECT a FROM Accountemployee a WHERE a.dateOfBirth = :dateOfBirth")})
public class Accountemployee implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "accountId", nullable = false)
    private Integer accountId;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 50)
    @Column(name = "Email", length = 50)
    private String email;
    @Size(max = 100)
    @Column(name = "Password", length = 100)
    private String password;
    @Size(max = 100)
    @Column(name = "FullName", length = 100)
    private String fullName;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 20)
    @Column(name = "Phone", length = 20)
    private String phone;
    @Column(name = "DateOfBirth")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOfBirth;
    @JoinColumn(name = "RoleId", referencedColumnName = "RoleId")
    @ManyToOne
    private Role roleId;

    public Accountemployee() {
    }

    public Accountemployee(Integer accountId) {
        this.accountId = accountId;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
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

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Role getRoleId() {
        return roleId;
    }

    public void setRoleId(Role roleId) {
        this.roleId = roleId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (accountId != null ? accountId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Accountemployee)) {
            return false;
        }
        Accountemployee other = (Accountemployee) object;
        if ((this.accountId == null && other.accountId != null) || (this.accountId != null && !this.accountId.equals(other.accountId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Accountemployee[ accountId=" + accountId + " ]";
    }
    
}
