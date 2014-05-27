package domain;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * Lichsudaugia entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="lichsudaugia")

public class Lichsudaugia  implements java.io.Serializable {


    // Fields    

     private Long id;
     private Sanpham sanpham;
     private String nguoidat;
     private Timestamp thoigian;
     private Double giadat;


    // Constructors

    /** default constructor */
    public Lichsudaugia() {
    }

    
    /** full constructor */
    public Lichsudaugia(Sanpham sanpham, String nguoidat, Timestamp thoigian, Double giadat) {
        this.sanpham = sanpham;
        this.nguoidat = nguoidat;
        this.thoigian = thoigian;
        this.giadat = giadat;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id", unique=true, nullable=false)

    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="masp", nullable=false)

    public Sanpham getSanpham() {
        return this.sanpham;
    }
    
    public void setSanpham(Sanpham sanpham) {
        this.sanpham = sanpham;
    }
    
    @Column(name="nguoidat", nullable=false, length=20)

    public String getNguoidat() {
        return this.nguoidat;
    }
    
    public void setNguoidat(String nguoidat) {
        this.nguoidat = nguoidat;
    }
    
    @Column(name="thoigian", nullable=false, length=19)

    public Timestamp getThoigian() {
        return this.thoigian;
    }
    
    public void setThoigian(Timestamp thoigian) {
        this.thoigian = thoigian;
    }
    
    @Column(name="giadat", nullable=false, precision=22, scale=0)

    public Double getGiadat() {
        return this.giadat;
    }
    
    public void setGiadat(Double giadat) {
        this.giadat = giadat;
    }


	@Override
	public String toString() {
		return "Lichsudaugia [id=" + id + ", sanpham=" + sanpham
				+ ", nguoidat=" + nguoidat + ", thoigian=" + thoigian
				+ ", giadat=" + giadat + "]";
	}
   








}