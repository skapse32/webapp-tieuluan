package com.nvh.daugia.service;

import java.util.List;

import com.nvh.daugia.model.jpa.BangDanhGiaKq;

public interface BangDanhGiaKqService {

	public List<BangDanhGiaKq> findAll();

	public List<BangDanhGiaKq> findByUserb(String userb);
	
	public BangDanhGiaKq findById(int id);
	
	public BangDanhGiaKq findByUserbAndUserd(String userb, String userd);
	
	public BangDanhGiaKq save(BangDanhGiaKq ch);

	public void delete(BangDanhGiaKq ch);
	
}
