package model;

@SuppressWarnings("serial")
public class Loaisp implements java.io.Serializable {

	// Fields

	private Long maloaisp;
	private String tenloaisp;
	private String mota;

	// Constructors

	/** default constructor */
	public Loaisp() {
	}

	/** full constructor */
	public Loaisp(Long maloaisp, String tenloaisp, String mota) {
		super();
		this.maloaisp = maloaisp;
		this.tenloaisp = tenloaisp;
		this.mota = mota;
	}


	// Property accessors

	public Long getMaloaisp() {
		return this.maloaisp;
	}

	
	public void setMaloaisp(Long maloaisp) {
		this.maloaisp = maloaisp;
	}

	public String getTenloaisp() {
		return this.tenloaisp;
	}

	public void setTenloaisp(String tenloaisp) {
		this.tenloaisp = tenloaisp;
	}

	public String getMota() {
		return this.mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

}