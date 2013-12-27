package com.nvh.daugia.service;

import java.util.List;

import com.nvh.daugia.model.jpa.ThongBao;

public interface ThongBaoService {

	public List<ThongBao> findAll();
	
	public ThongBao findById(int id);
	
	public ThongBao save(ThongBao tb);
	
	public void delete(ThongBao tb);
	
}
