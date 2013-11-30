package model;

@SuppressWarnings("serial")
public class Hinhthucthanhtoan implements java.io.Serializable {

	private Long mahttt;
	private String tenhttt;
	private String mota;

	// Constructors

	/** default constructor */
	public Hinhthucthanhtoan() {
	}

	/** full constructor */
	public Hinhthucthanhtoan(Long mahttt, String tenhttt, String mota) {
		super();
		this.mahttt = mahttt;
		this.tenhttt = tenhttt;
		this.mota = mota;
	}

	public Long getMahttt() {
		return this.mahttt;
	}



	public void setMahttt(Long mahttt) {
		this.mahttt = mahttt;
	}

	public String getTenhttt() {
		return this.tenhttt;
	}

	public void setTenhttt(String tenhttt) {
		this.tenhttt = tenhttt;
	}

	public String getMota() {
		return this.mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

}