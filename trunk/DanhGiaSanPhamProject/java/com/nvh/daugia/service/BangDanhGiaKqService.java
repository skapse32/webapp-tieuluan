package com.nvh.daugia.service;

import java.util.List;

import com.nvh.daugia.model.jpa.BangDanhGiaKq;
import com.nvh.daugia.model.jpa.LichSuDauGia;

public interface BangDanhGiaKqService {

	public List<BangDanhGiaKq> findAll();

	public BangDanhGiaKq findById(int id);
	
	public BangDanhGiaKq findByMonhocdg(LichSuDauGia tkb);

	public BangDanhGiaKq save(BangDanhGiaKq ch);

	public void delete(BangDanhGiaKq ch);
	
}
