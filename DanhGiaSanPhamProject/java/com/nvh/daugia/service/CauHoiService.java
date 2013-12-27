package com.nvh.daugia.service;

import java.util.List;

import com.nvh.daugia.model.jpa.BangDanhGia;
import com.nvh.daugia.model.jpa.CauHoi;
import com.nvh.daugia.model.jpa.LoaiCauHoi;

public interface CauHoiService {

	public List<CauHoi> findAll();

	public List<CauHoi> findByloaicau(LoaiCauHoi lch);
	
	public List<CauHoi> findByBangDanhGia(BangDanhGia lch);
	
	public CauHoi findById(String id);

	public CauHoi save(CauHoi ch);

	public void delete(CauHoi ch);
	
}
