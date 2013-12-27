package com.nvh.daugia.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nvh.daugia.model.jpa.LichSuDauGia;
import com.nvh.daugia.model.jpa.SanPham;
import com.nvh.daugia.model.jpa.User;

public interface ThoiKhoaBieuRepository extends CrudRepository<LichSuDauGia, Integer> {
	
	public List<LichSuDauGia> findBySv(User user);
	
	public List<LichSuDauGia> findByGv(User user);
	
	public List<LichSuDauGia> findByMonhoc(SanPham mh);
}
