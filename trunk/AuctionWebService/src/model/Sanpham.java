package model;

@SuppressWarnings("serial")
public class Sanpham implements java.io.Serializable {

	// Fields
	private Long masp;
	private String tensp;
	private String tinhtrangsp;
	private Integer soluong;
	private String xuatxu;
	private String thuonghieu;
	private String loaisp;
	private String nguoidang;
	private Double giakhoidiem;
	private Double giahientai;
	private String nguoidat;
	private Double buocgia;
	private Long thoigianbatdau;
	private Long thoigianketthuc;
	private String thongtinlienhe;
	private String httt;
	private String hinhanh;
	private String mota;
	private int tinhtrangdaugia;
	private String ghichu;
	// Constructors

	/** default constructor */
	public Sanpham() {
	}

	/** full constructor */
	

	public String getTinhtrangsp() {
		return tinhtrangsp;
	}

	public Sanpham(Long masp, String tensp, String tinhtrangsp,
			Integer soluong, String xuatxu, String thuonghieu, String loaisp,
			String nguoidang, Double giakhoidiem,Double giahientai,String nguoidat,
			Double buocgia, Long thoigianbatdau,
			Long thoigianketthuc, String thongtinlienhe, String httt,
			String hinhanh, String mota,Integer tinhtrangdaugia,String ghichu) {
		super();
		this.masp = masp;
		this.tensp = tensp;
		this.tinhtrangsp = tinhtrangsp;
		this.soluong = soluong;
		this.xuatxu = xuatxu;
		this.thuonghieu = thuonghieu;
		this.loaisp = loaisp;
		this.nguoidang = nguoidang;
		this.giakhoidiem = giakhoidiem;
		this.giahientai = giahientai;
		this.buocgia = buocgia;
		this.thoigianbatdau = thoigianbatdau;
		this.thoigianketthuc = thoigianketthuc;
		this.thongtinlienhe = thongtinlienhe;
		this.httt = httt;
		this.hinhanh = hinhanh;
		this.mota = mota;
		this.tinhtrangdaugia=tinhtrangdaugia;
		this.nguoidat=nguoidat;
		this.setGhichu(ghichu);
	}

	public void setTinhtrangsp(String tinhtrangsp) {
		this.tinhtrangsp = tinhtrangsp;
	}

	public String getLoaisp() {
		return loaisp;
	}

	public void setLoaisp(String loaisp) {
		this.loaisp = loaisp;
	}

	public String getHttt() {
		return httt;
	}

	public void setHttt(String httt) {
		this.httt = httt;
	}

	public Long getMasp() {
		return this.masp;
	}

	public void setMasp(Long masp) {
		this.masp = masp;
	}

	public String getTensp() {
		return this.tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	public Integer getSoluong() {
		return this.soluong;
	}

	public void setSoluong(Integer soluong) {
		this.soluong = soluong;
	}

	public String getXuatxu() {
		return this.xuatxu;
	}

	public void setXuatxu(String xuatxu) {
		this.xuatxu = xuatxu;
	}

	public String getThuonghieu() {
		return this.thuonghieu;
	}

	public void setThuonghieu(String thuonghieu) {
		this.thuonghieu = thuonghieu;
	}

	public String getNguoidang() {
		return this.nguoidang;
	}

	public void setNguoidang(String nguoidang) {
		this.nguoidang = nguoidang;
	}

	public Double getGiakhoidiem() {
		return this.giakhoidiem;
	}

	public void setGiakhoidiem(Double giakhoidiem) {
		this.giakhoidiem = giakhoidiem;
	}

	public Integer getTinhtrangdaugia() {
		return this.tinhtrangdaugia;
	}

	public void setTinhtrangdaugia(Integer tinhtrangdaugia) {
		this.tinhtrangdaugia = tinhtrangdaugia;
	}
	public Double getGiahientai() {
		return this.giahientai;
	}

	public void setGiahientai(Double giahientai) {
		this.giahientai = giahientai;
	}

	public Double getBuocgia() {
		return this.buocgia;
	}

	public void setBuocgia(Double buocgia) {
		this.buocgia = buocgia;
	}

	public Long getThoigianbatdau() {
		return this.thoigianbatdau;
	}

	public void setThoigianbatdau(Long thoigianbatdau) {
		this.thoigianbatdau = thoigianbatdau;
	}

	public Long getThoigianketthuc() {
		return this.thoigianketthuc;
	}

	public void setThoigianketthuc(Long thoigianketthuc) {
		this.thoigianketthuc = thoigianketthuc;
	}

	public String getThongtinlienhe() {
		return this.thongtinlienhe;
	}

	public void setThongtinlienhe(String thongtinlienhe) {
		this.thongtinlienhe = thongtinlienhe;
	}

	public String getHinhanh() {
		return this.hinhanh;
	}

	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}

	public String getMota() {
		return this.mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public String getNguoidat() {
		return nguoidat;
	}

	public void setNguoidat(String nguoidat) {
		this.nguoidat = nguoidat;
	}

	public String getGhichu() {
		return ghichu;
	}

	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}

}