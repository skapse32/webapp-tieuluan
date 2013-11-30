package dao;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * Loaisp entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="loaisp"
)

public class Loaisp  implements java.io.Serializable {


    // Fields    

     private Long maloaisp;
     private String tenloaisp;
     private String mota;
     private Set<Sanpham> sanphams = new HashSet<Sanpham>(0);


    // Constructors

    /** default constructor */
    public Loaisp() {
    }

	/** minimal constructor */
    public Loaisp(String tenloaisp, String mota) {
        this.tenloaisp = tenloaisp;
        this.mota = mota;
    }
    
    /** full constructor */
    public Loaisp(String tenloaisp, String mota, Set<Sanpham> sanphams) {
        this.tenloaisp = tenloaisp;
        this.mota = mota;
        this.sanphams = sanphams;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="maloaisp", unique=true, nullable=false)

    public Long getMaloaisp() {
        return this.maloaisp;
    }
    
    public void setMaloaisp(Long maloaisp) {
        this.maloaisp = maloaisp;
    }
    
    @Column(name="tenloaisp", nullable=false, length=200)

    public String getTenloaisp() {
        return this.tenloaisp;
    }
    
    public void setTenloaisp(String tenloaisp) {
        this.tenloaisp = tenloaisp;
    }
    
    @Column(name="mota", nullable=false, length=65535)

    public String getMota() {
        return this.mota;
    }
    
    public void setMota(String mota) {
        this.mota = mota;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="loaisp")

    public Set<Sanpham> getSanphams() {
        return this.sanphams;
    }
    
    public void setSanphams(Set<Sanpham> sanphams) {
        this.sanphams = sanphams;
    }
   








}