package com.nvh.daugia.model.jpa;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="monhoc")
public class SanPham implements Serializable {

	private String ID;
	private	String tenMH;
	private Set<LichSuDauGia> thoikhoabieu = new HashSet<LichSuDauGia>();
	private Set<User> gvs = new HashSet<User>();
	
	@Id
	@Column(name="ID")
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	
	@Column(name="TENMH")
	public String getTenMH() {
		return tenMH;
	}
	public void setTenMH(String tenMH) {
		this.tenMH = tenMH;
	}
	
	@OneToMany(mappedBy="monhoc", cascade = CascadeType.ALL, orphanRemoval = true)
	public Set<LichSuDauGia> getThoikhoabieu() {
		return thoikhoabieu;
	}
	public void setThoikhoabieu(Set<LichSuDauGia> thoikhoabieu) {
		this.thoikhoabieu = thoikhoabieu;
	}
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "giangvien_monhoc" , 
		joinColumns = @JoinColumn(name="IDMH") , 
		inverseJoinColumns = @JoinColumn(name = "IDGV"))
	public Set<User> getGvs() {
		return gvs;
	}
	public void setGvs(Set<User> gvs) {
		this.gvs = gvs;
	}
	
	
}
