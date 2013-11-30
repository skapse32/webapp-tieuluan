package dao;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * Hoadon entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="hoadon"
)

public class Hoadon  implements java.io.Serializable {


    // Fields    

     private Long mahoadon;
     private Sanpham sanpham;
     private Double dongia;
     private String nguoidang;
     private String nguoimua;
     private Date ngaylap;


    // Constructors

    /** default constructor */
    public Hoadon() {
    }

    
    /** full constructor */
    public Hoadon(Sanpham sanpham, Double dongia, String nguoidang, String nguoimua, Date ngaylap) {
        this.sanpham = sanpham;
        this.dongia = dongia;
        this.nguoidang = nguoidang;
        this.nguoimua = nguoimua;
        this.ngaylap = ngaylap;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="mahoadon", unique=true, nullable=false)

    public Long getMahoadon() {
        return this.mahoadon;
    }
    
    public void setMahoadon(Long mahoadon) {
        this.mahoadon = mahoadon;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="masp", nullable=false)

    public Sanpham getSanpham() {
        return this.sanpham;
    }
    
    public void setSanpham(Sanpham sanpham) {
        this.sanpham = sanpham;
    }
    
    @Column(name="dongia", nullable=false, precision=22, scale=0)

    public Double getDongia() {
        return this.dongia;
    }
    
    public void setDongia(Double dongia) {
        this.dongia = dongia;
    }
    
    @Column(name="nguoidang", nullable=false, length=20)

    public String getNguoidang() {
        return this.nguoidang;
    }
    
    public void setNguoidang(String nguoidang) {
        this.nguoidang = nguoidang;
    }
    
    @Column(name="nguoimua", nullable=false, length=20)

    public String getNguoimua() {
        return this.nguoimua;
    }
    
    public void setNguoimua(String nguoimua) {
        this.nguoimua = nguoimua;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="ngaylap", nullable=false, length=10)

    public Date getNgaylap() {
        return this.ngaylap;
    }
    
    public void setNgaylap(Date ngaylap) {
        this.ngaylap = ngaylap;
    }
   








}