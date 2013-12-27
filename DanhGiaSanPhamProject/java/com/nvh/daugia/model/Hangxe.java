package com.nvh.daugia.model;

import java.io.Serializable;



/**
 * The persistent class for the hangxe database table.
 * 
 */
public class Hangxe implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;

	private String tenhang;
	
	public Hangxe(int id, String tenhang) {
		super();
		this.id = id;
		this.tenhang = tenhang;
	}

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