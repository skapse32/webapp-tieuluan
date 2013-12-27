package com.nvh.daugia.service;

import java.util.List;

import com.nvh.daugia.model.jpa.LichSuDauGia;
import com.nvh.daugia.model.jpa.SanPham;
import com.nvh.daugia.model.jpa.User;

public interface ThoiKhoaBieuService {

	public List<LichSuDauGia> findAll();

	public LichSuDauGia findById(int id);
	
	public List<LichSuDauGia> findBySV(User user);
	
	public List<LichSuDauGia> findByGv(User user);
	
	public List<LichSuDauGia> findByMonhoc(SanPham user);

	public LichSuDauGia save(LichSuDauGia tkb);

	public void delete(LichSuDauGia tkb);
	
}
