package com.nvh.daugia.model.jpa;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "thoikhoabieu")
public class LichSuDauGia implements Serializable {
	
	private int id;
	private User sv;
	private User gv;
	private SanPham monhoc;
	
	
	private BangDanhGiaKq dgkq;
	
	@OneToOne(mappedBy = "monhocdg")
	public BangDanhGiaKq getDgkq() {
		return dgkq;
	}

	public void setDgkq(BangDanhGiaKq dgkq) {
		this.dgkq = dgkq;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne
	@JoinColumn(name="IDSV")
	public User getSv() {
		return sv;
	}

	public void setSv(User sv) {
		this.sv = sv;
	}

	@ManyToOne
	@JoinColumn(name="IDGV")
	public User getGv() {
		return gv;
	}

	public void setGv(User gv) {
		this.gv = gv;
	}

	@ManyToOne
	@JoinColumn(name="MONHOC_ID")
	public SanPham getMonhoc() {
		return monhoc;
	}

	public void setMonhoc(SanPham monhoc) {
		this.monhoc = monhoc;
	}

	@Override
	public String toString() {
		return "ThoiKhoaBieu [id=" + id + ", sv=" + sv + ", gv=" + gv
				+ ", monhoc=" + monhoc + "]";
	}


	
}
