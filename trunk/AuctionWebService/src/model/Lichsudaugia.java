package model;


@SuppressWarnings("serial")
public class Lichsudaugia implements java.io.Serializable {

	// Fields

	private Long id;
	private Long masp;
	private String tensp;
	private String nguoidat;
	private Long thoigian;
	private Double giadat;

	// Constructors

	/** default constructor */
	public Lichsudaugia() {
	}

	/** full constructor */
	public Lichsudaugia(Long id, Long masp, String tensp, String nguoidat,
			Long thoigian, Double giadat) {
		super();
		this.id = id;
		this.masp = masp;
		this.tensp = tensp;
		this.nguoidat = nguoidat;
		this.thoigian = thoigian;
		this.giadat = giadat;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public String getTensp() {
		return tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getMasp() {
		return this.masp;
	}

	public void setMasp(Long masp) {
		this.masp = masp;
	}

	public String getNguoidat() {
		return this.nguoidat;
	}

	public void setNguoidat(String nguoidat) {
		this.nguoidat = nguoidat;
	}

	public Long getThoigian() {
		return this.thoigian;
	}

	public void setThoigian(Long thoigian) {
		this.thoigian = thoigian;
	}

	public Double getGiadat() {
		return this.giadat;
	}

	public void setGiadat(Double giadat) {
		this.giadat = giadat;
	}

}