package com.nvh.daugia.service;

import java.util.List;

import com.nvh.daugia.model.jpa.SanPham;

public interface MonHocService {

	public List<SanPham> findAll();

	public SanPham findById(String id);

	public SanPham save(SanPham tkb);

	public void delete(SanPham tkb);
	
}
