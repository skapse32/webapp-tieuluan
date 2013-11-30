package model;

@SuppressWarnings("serial")
public class Tinhtrangsp implements java.io.Serializable {

	// Fields

	private Long matinhtrangsp;
	private String tentinhtrangsp;
	private String mota;

	// Constructors

	/** default constructor */
	public Tinhtrangsp() {
	}

	/** full constructor */
	public Tinhtrangsp(Long matinhtrangsp, String tentinhtrangsp, String mota) {
		super();
		this.matinhtrangsp = matinhtrangsp;
		this.tentinhtrangsp = tentinhtrangsp;
		this.mota = mota;
	}

	// Property accessors

	public Long getMatinhtrangsp() {
		return this.matinhtrangsp;
	}

	

	public void setMatinhtrangsp(Long matinhtrangsp) {
		this.matinhtrangsp = matinhtrangsp;
	}

	public String getTentinhtrangsp() {
		return this.tentinhtrangsp;
	}

	public void setTentinhtrangsp(String tentinhtrangsp) {
		this.tentinhtrangsp = tentinhtrangsp;
	}

	public String getMota() {
		return this.mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

}