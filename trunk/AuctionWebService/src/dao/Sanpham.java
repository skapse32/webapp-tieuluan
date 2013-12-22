package dao;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.eclipse.persistence.annotations.Cache;
import org.eclipse.persistence.annotations.CacheType;


/**
 * Sanpham entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="sanpham"
)
@Cache(expiry = 0, alwaysRefresh = true, type=CacheType.NONE)
public class Sanpham  implements java.io.Serializable {


    // Fields    

     private Long masp;
     private Loaisp loaisp;
     private Tinhtrangsp tinhtrangsp;
     private Hinhthucthanhtoan hinhthucthanhtoan;
     private String tensp;
     private Integer soluong;
     private String xuatxu;
     private String thuonghieu;
     private String nguoidang;
     private Double giakhoidiem;
     private Double giahientai;
     private Double giamuangay;
     private String nguoidat;
     private Double buocgia;
     private Timestamp thoigianbatdau;
     private Timestamp thoigianketthuc;
     private String thongtinlienhe;
     private String hinhanh;
     private String mota;
     private Integer tinhtrangdaugia;
     private String ghichu;
     private Set<Hoadon> hoadons = new HashSet<Hoadon>(0);
     private Set<Lichsudaugia> lichsudaugias = new HashSet<Lichsudaugia>(0);


    // Constructors

    @Override
	public String toString() {
		return "Sanpham [masp=" + masp + ", loaisp=" + loaisp
				+ ", tinhtrangsp=" + tinhtrangsp + ", hinhthucthanhtoan="
				+ hinhthucthanhtoan + ", tensp=" + tensp + ", soluong="
				+ soluong + ", xuatxu=" + xuatxu + ", thuonghieu=" + thuonghieu
				+ ", nguoidang=" + nguoidang + ", giakhoidiem=" + giakhoidiem
				+ ", giahientai=" + giahientai + ", nguoidat=" + nguoidat
				+ ", buocgia=" + buocgia + ", thoigianbatdau=" + thoigianbatdau
				+ ", thoigianketthuc=" + thoigianketthuc + ", thongtinlienhe="
				+ thongtinlienhe + ", hinhanh=" + hinhanh + ", mota=" + mota
				+ ", tinhtrangdaugia=" + tinhtrangdaugia + ", ghichu=" + ghichu
				+ ", hoadons=" + hoadons + ", lichsudaugias=" + lichsudaugias
				+ "]";
	}

	/** default constructor */
    public Sanpham() {
    }

	/** minimal constructor */
    public Sanpham(Loaisp loaisp, Tinhtrangsp tinhtrangsp, Hinhthucthanhtoan hinhthucthanhtoan, String tensp, Integer soluong, String xuatxu, String thuonghieu, String nguoidang, Double giakhoidiem, Double giahientai, String nguoidat, Double buocgia, Double giamuangay ,Timestamp thoigianbatdau, Timestamp thoigianketthuc, String thongtinlienhe, String hinhanh, String mota, Integer tinhtrangdaugia, String ghichu) {
        this.loaisp = loaisp;
        this.tinhtrangsp = tinhtrangsp;
        this.hinhthucthanhtoan = hinhthucthanhtoan;
        this.tensp = tensp;
        this.soluong = soluong;
        this.xuatxu = xuatxu;
        this.thuonghieu = thuonghieu;
        this.nguoidang = nguoidang;
        this.giakhoidiem = giakhoidiem;
        this.giahientai = giahientai;
        this.nguoidat = nguoidat;
        this.buocgia = buocgia;
        this.thoigianbatdau = thoigianbatdau;
        this.thoigianketthuc = thoigianketthuc;
        this.thongtinlienhe = thongtinlienhe;
        this.hinhanh = hinhanh;
        this.mota = mota;
        this.tinhtrangdaugia = tinhtrangdaugia;
        this.ghichu = ghichu;
        this.giamuangay = giamuangay;
    }
    
    /** full constructor */
    public Sanpham(Loaisp loaisp, Tinhtrangsp tinhtrangsp, Hinhthucthanhtoan hinhthucthanhtoan, String tensp, Integer soluong, String xuatxu, String thuonghieu, String nguoidang, Double giakhoidiem, Double giahientai, String nguoidat,Double giamuangay ,Double buocgia, Timestamp thoigianbatdau, Timestamp thoigianketthuc, String thongtinlienhe, String hinhanh, String mota, Integer tinhtrangdaugia, String ghichu, Set<Hoadon> hoadons, Set<Lichsudaugia> lichsudaugias) {
        this.loaisp = loaisp;
        this.tinhtrangsp = tinhtrangsp;
        this.hinhthucthanhtoan = hinhthucthanhtoan;
        this.tensp = tensp;
        this.soluong = soluong;
        this.xuatxu = xuatxu;
        this.thuonghieu = thuonghieu;
        this.nguoidang = nguoidang;
        this.giakhoidiem = giakhoidiem;
        this.giahientai = giahientai;
        this.nguoidat = nguoidat;
        this.buocgia = buocgia;
        this.thoigianbatdau = thoigianbatdau;
        this.thoigianketthuc = thoigianketthuc;
        this.thongtinlienhe = thongtinlienhe;
        this.hinhanh = hinhanh;
        this.mota = mota;
        this.tinhtrangdaugia = tinhtrangdaugia;
        this.ghichu = ghichu;
        this.hoadons = hoadons;
        this.lichsudaugias = lichsudaugias;
        this.giamuangay = giamuangay;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="masp", unique=true, nullable=false)

    public Long getMasp() {
        return this.masp;
    }
    
    public void setMasp(Long masp) {
        this.masp = masp;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="maloaisp", nullable=false)

    public Loaisp getLoaisp() {
        return this.loaisp;
    }
    
    public void setLoaisp(Loaisp loaisp) {
        this.loaisp = loaisp;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="matinhtrangsp", nullable=false)

    public Tinhtrangsp getTinhtrangsp() {
        return this.tinhtrangsp;
    }
    
    public void setTinhtrangsp(Tinhtrangsp tinhtrangsp) {
        this.tinhtrangsp = tinhtrangsp;
    }
	@ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="mahttt", nullable=false)

    public Hinhthucthanhtoan getHinhthucthanhtoan() {
        return this.hinhthucthanhtoan;
    }
    
    public void setHinhthucthanhtoan(Hinhthucthanhtoan hinhthucthanhtoan) {
        this.hinhthucthanhtoan = hinhthucthanhtoan;
    }
    
    @Column(name="tensp", nullable=false, length=256)

    public String getTensp() {
        return this.tensp;
    }
    
    public void setTensp(String tensp) {
        this.tensp = tensp;
    }
    
    @Column(name="soluong", nullable=false)

    public Integer getSoluong() {
        return this.soluong;
    }
    
    public void setSoluong(Integer soluong) {
        this.soluong = soluong;
    }
    
    @Column(name="xuatxu", nullable=false, length=256)

    public String getXuatxu() {
        return this.xuatxu;
    }
    
    public void setXuatxu(String xuatxu) {
        this.xuatxu = xuatxu;
    }
    
    @Column(name="thuonghieu", nullable=false, length=256)

    public String getThuonghieu() {
        return this.thuonghieu;
    }
    
    public void setThuonghieu(String thuonghieu) {
        this.thuonghieu = thuonghieu;
    }
    
    @Column(name="nguoidang", nullable=false, length=20)

    public String getNguoidang() {
        return this.nguoidang;
    }
    
    public void setNguoidang(String nguoidang) {
        this.nguoidang = nguoidang;
    }
    
    @Column(name="giakhoidiem", nullable=false, precision=22, scale=0)

    public Double getGiakhoidiem() {
        return this.giakhoidiem;
    }
    
    public void setGiakhoidiem(Double giakhoidiem) {
        this.giakhoidiem = giakhoidiem;
    }
    
    @Column(name="giahientai", nullable=false, precision=22, scale=0)

    public Double getGiahientai() {
        return this.giahientai;
    }
    
    public void setGiahientai(Double giahientai) {
        this.giahientai = giahientai;
    }
    
    @Column(name="nguoidat", nullable=false, length=20)

    public String getNguoidat() {
        return this.nguoidat;
    }
    
    public void setNguoidat(String nguoidat) {
        this.nguoidat = nguoidat;
    }
    
    @Column(name="buocgia", nullable=false, precision=22, scale=0)

    public Double getBuocgia() {
        return this.buocgia;
    }
    
    public void setBuocgia(Double buocgia) {
        this.buocgia = buocgia;
    }
    
    @Column(name="thoigianbatdau", nullable=false, length=19)

    public Timestamp getThoigianbatdau() {
        return this.thoigianbatdau;
    }
    
    public void setThoigianbatdau(Timestamp thoigianbatdau) {
        this.thoigianbatdau = thoigianbatdau;
    }
    
    @Column(name="thoigianketthuc", nullable=false, length=19)

    public Timestamp getThoigianketthuc() {
        return this.thoigianketthuc;
    }
    
    public void setThoigianketthuc(Timestamp thoigianketthuc) {
        this.thoigianketthuc = thoigianketthuc;
    }
    
    @Column(name="giamuangay", nullable=true, precision=22, scale=0)
    public Double getGiamuangay() {
		return giamuangay;
	}

	public void setGiamuangay(Double giamuangay) {
		this.giamuangay = giamuangay;
	}

	@Column(name="thongtinlienhe", nullable=false, length=500)

    public String getThongtinlienhe() {
        return this.thongtinlienhe;
    }
    
    public void setThongtinlienhe(String thongtinlienhe) {
        this.thongtinlienhe = thongtinlienhe;
    }
    
    @Column(name="hinhanh", nullable=false, length=500)

    public String getHinhanh() {
        return this.hinhanh;
    }
    
    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }
    
    @Column(name="mota", nullable=false, length=65535)

    public String getMota() {
        return this.mota;
    }
    
    public void setMota(String mota) {
        this.mota = mota;
    }
    
    @Column(name="tinhtrangdaugia", nullable=false)

    public Integer getTinhtrangdaugia() {
        return this.tinhtrangdaugia;
    }
    
    public void setTinhtrangdaugia(Integer tinhtrangdaugia) {
        this.tinhtrangdaugia = tinhtrangdaugia;
    }
    
    @Column(name="ghichu", nullable=false, length=65535)

    public String getGhichu() {
        return this.ghichu;
    }
    
    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="sanpham")

    public Set<Hoadon> getHoadons() {
        return this.hoadons;
    }
    
    public void setHoadons(Set<Hoadon> hoadons) {
        this.hoadons = hoadons;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="sanpham")

    public Set<Lichsudaugia> getLichsudaugias() {
        return this.lichsudaugias;
    }
    
    public void setLichsudaugias(Set<Lichsudaugia> lichsudaugias) {
        this.lichsudaugias = lichsudaugias;
    }
   








}