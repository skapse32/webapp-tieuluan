package domain;

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
 * Tinhtrangsp entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tinhtrangsp")

public class Tinhtrangsp  implements java.io.Serializable {
    // Fields    

     private Long matinhtrangsp;
     private String tentinhtrangsp;
     private String mota;
     private Set<Sanpham> sanphams = new HashSet<Sanpham>(0);


    // Constructors

    /** default constructor */
    public Tinhtrangsp() {
    }

	/** minimal constructor */
    public Tinhtrangsp(String tentinhtrangsp, String mota) {
        this.tentinhtrangsp = tentinhtrangsp;
        this.mota = mota;
    }
    
    /** full constructor */
    public Tinhtrangsp(String tentinhtrangsp, String mota, Set<Sanpham> sanphams) {
        this.tentinhtrangsp = tentinhtrangsp;
        this.mota = mota;
        this.sanphams = sanphams;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="matinhtrangsp", unique=true, nullable=false)

    public Long getMatinhtrangsp() {
        return this.matinhtrangsp;
    }
    
    public void setMatinhtrangsp(Long matinhtrangsp) {
        this.matinhtrangsp = matinhtrangsp;
    }
    
    @Column(name="tentinhtrangsp", nullable=false, length=256)

    public String getTentinhtrangsp() {
        return this.tentinhtrangsp;
    }
    
    public void setTentinhtrangsp(String tentinhtrangsp) {
        this.tentinhtrangsp = tentinhtrangsp;
    }
    
    @Column(name="mota", nullable=false, length=256)

    public String getMota() {
        return this.mota;
    }
    
    public void setMota(String mota) {
        this.mota = mota;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="tinhtrangsp")

    public Set<Sanpham> getSanphams() {
        return this.sanphams;
    }
    
    public void setSanphams(Set<Sanpham> sanphams) {
        this.sanphams = sanphams;
    }
   








}