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
@Table(name = "img_hero", catalog = "prj4db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ImgHero.findAll", query = "SELECT i FROM ImgHero i")
    , @NamedQuery(name = "ImgHero.findByIdHero", query = "SELECT i FROM ImgHero i WHERE i.idHero = :idHero")
    , @NamedQuery(name = "ImgHero.findByImg", query = "SELECT i FROM ImgHero i WHERE i.img = :img")
    , @NamedQuery(name = "ImgHero.findByTextTitle", query = "SELECT i FROM ImgHero i WHERE i.textTitle = :textTitle")
    , @NamedQuery(name = "ImgHero.findByTextShort", query = "SELECT i FROM ImgHero i WHERE i.textShort = :textShort")})
public class ImgHero implements Serializable {

    @Column(name = "choose")
    private Boolean choose;


    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_hero", nullable = false)
    private Integer idHero;
    @Size(max = 255)
    @Column(name = "img", length = 255)
    private String img;
    @Size(max = 255)
    @Column(name = "text_Title", length = 255)
    private String textTitle;
    @Size(max = 150)
    @Column(name = "text_short", length = 150)
    private String textShort;

    public ImgHero() {
    }

    public ImgHero(Integer idHero) {
        this.idHero = idHero;
    }

    public Integer getIdHero() {
        return idHero;
    }

    public void setIdHero(Integer idHero) {
        this.idHero = idHero;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTextTitle() {
        return textTitle;
    }

    public void setTextTitle(String textTitle) {
        this.textTitle = textTitle;
    }

    public String getTextShort() {
        return textShort;
    }

    public void setTextShort(String textShort) {
        this.textShort = textShort;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idHero != null ? idHero.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ImgHero)) {
            return false;
        }
        ImgHero other = (ImgHero) object;
        if ((this.idHero == null && other.idHero != null) || (this.idHero != null && !this.idHero.equals(other.idHero))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.ImgHero[ idHero=" + idHero + " ]";
    }


    public Boolean getChoose() {
        return choose;
    }

    public void setChoose(Boolean choose) {
        this.choose = choose;
    }

    
}
