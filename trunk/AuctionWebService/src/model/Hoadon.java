package model;


@SuppressWarnings("serial")
public class Hoadon implements java.io.Serializable {

	// Fields

	private Long mahoadon;
	private Long masp;
	private String tensp;
	private Double dongia;
	private String nguoidang;
	private String nguoimua;
	private Long ngaylap;

	// Constructors

	/** default constructor */
	public Hoadon() {
	}

	/** full constructor */


	public Long getMahoadon() {
		return this.mahoadon;
	}

	public Hoadon(Long mahoadon, Long masp, String tensp, Double dongia,
			String nguoidang, String nguoimua, Long ngaylap) {
		super();
		this.mahoadon = mahoadon;
		this.masp = masp;
		this.tensp = tensp;
		this.dongia = dongia;
		this.nguoidang = nguoidang;
		this.nguoimua = nguoimua;
		this.ngaylap = ngaylap;
	}

	public void setMahoadon(Long mahoadon) {
		this.mahoadon = mahoadon;
	}

	public Long getMasp() {
		return this.masp;
	}

	public void setMasp(Long masp) {
		this.masp = masp;
	}

	public Double getDongia() {
		return this.dongia;
	}

	public void setDongia(Double dongia) {
		this.dongia = dongia;
	}

	public String getNguoidang() {
		return this.nguoidang;
	}

	public void setNguoidang(String nguoidang) {
		this.nguoidang = nguoidang;
	}

	public String getNguoimua() {
		return this.nguoimua;
	}

	public void setNguoimua(String nguoimua) {
		this.nguoimua = nguoimua;
	}

	public Long getNgaylap() {
		return this.ngaylap;
	}

	public void setNgaylap(Long ngaylap) {
		this.ngaylap = ngaylap;
	}

	public String getTensp() {
		return tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	



}