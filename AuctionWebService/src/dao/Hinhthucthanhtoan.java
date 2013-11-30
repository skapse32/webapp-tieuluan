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
 * Hinhthucthanhtoan entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="hinhthucthanhtoan"
)

public class Hinhthucthanhtoan  implements java.io.Serializable {


    // Fields    

     private Long mahttt;
     private String tenhttt;
     private String mota;
     private Set<Sanpham> sanphams = new HashSet<Sanpham>(0);


    // Constructors

    /** default constructor */
    public Hinhthucthanhtoan() {
    }

	/** minimal constructor */
    public Hinhthucthanhtoan(String tenhttt, String mota) {
        this.tenhttt = tenhttt;
        this.mota = mota;
    }
    
    /** full constructor */
    public Hinhthucthanhtoan(String tenhttt, String mota, Set<Sanpham> sanphams) {
        this.tenhttt = tenhttt;
        this.mota = mota;
        this.sanphams = sanphams;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="mahttt", unique=true, nullable=false)

    public Long getMahttt() {
        return this.mahttt;
    }
    
    public void setMahttt(Long mahttt) {
        this.mahttt = mahttt;
    }
    
    @Column(name="tenhttt", nullable=false, length=256)

    public String getTenhttt() {
        return this.tenhttt;
    }
    
    public void setTenhttt(String tenhttt) {
        this.tenhttt = tenhttt;
    }
    
    @Column(name="mota", nullable=false, length=500)

    public String getMota() {
        return this.mota;
    }
    
    public void setMota(String mota) {
        this.mota = mota;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="hinhthucthanhtoan")

    public Set<Sanpham> getSanphams() {
        return this.sanphams;
    }
    
    public void setSanphams(Set<Sanpham> sanphams) {
        this.sanphams = sanphams;
    }
   








}