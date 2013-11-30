package dao;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the hangxe database table.
 * 
 */
@Entity
@NamedQuery(name="Hangxe.findAll", query="SELECT h FROM Hangxe h")
public class Hangxe implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String tenhang;

	public Hangxe() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenhang() {
		return this.tenhang;
	}

	public void setTenhang(String tenhang) {
		this.tenhang = tenhang;
	}

}