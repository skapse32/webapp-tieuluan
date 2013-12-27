package com.nvh.daugia.service;

import java.util.List;

import com.nvh.daugia.model.jpa.BangDanhGiaKq;
import com.nvh.daugia.model.jpa.CauHoi;
import com.nvh.daugia.model.jpa.CauHoiKq;


public interface CauHoiKqService {

	public List<CauHoiKq> findAll();

	public List<CauHoiKq> findByKetqua(char kq);
	
	public List<CauHoiKq> findByCauhoi(CauHoi ch);
	
	public List<CauHoiKq> findByCauHoiBangDanhGiakq(CauHoi ch , BangDanhGiaKq dgkq);
	
	public CauHoiKq findById(int id);

	public CauHoiKq save(CauHoiKq ch);

	public void delete(CauHoiKq ch);
	
}
