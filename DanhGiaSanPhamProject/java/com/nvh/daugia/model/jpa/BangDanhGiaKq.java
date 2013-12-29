package com.nvh.daugia.model.jpa;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="bangdanhgia_kq")
public class BangDanhGiaKq implements Serializable{

	private int id;
	
	private BangDanhGia loaiBang;
	private Date ngaytao;
	private String userd;
	private String userb;
	private Set<CauHoiKq> cauhoikqs = new HashSet<CauHoiKq>();
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="ID")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	@ManyToOne
	@JoinColumn(name ="IDBDG")
	public BangDanhGia getLoaiBang() {
		return loaiBang;
	}

	public void setLoaiBang(BangDanhGia loaiBang) {
		this.loaiBang = loaiBang;
	}

	@OneToMany(mappedBy="bangkq" ,cascade = CascadeType.ALL , orphanRemoval = true , fetch = FetchType.EAGER)
	public Set<CauHoiKq> getCauhoikqs() {
		return cauhoikqs;
	}

	public void setCauhoikqs(Set<CauHoiKq> cauhoikqs) {
		this.cauhoikqs = cauhoikqs;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "NGAYTAO")
	public Date getNgaytao() {
		return ngaytao;
	}

	public void setNgaytao(Date ngaytao) {
		this.ngaytao = ngaytao;
	}

	@Override
	public String toString() {
		return "BangDanhGiaKq [id=" + id + ", ngaytao=" + ngaytao + "]";
	}

	@Column(name = "USERD_ID")
	public String getUserd() {
		return userd;
	}

	public void setUserd(String userd) {
		this.userd = userd;
	}
	

	@Column(name = "USERB_ID")
	public String getUserb() {
		return userb;
	}

	public void setUserb(String userb) {
		this.userb = userb;
	}

	
}
