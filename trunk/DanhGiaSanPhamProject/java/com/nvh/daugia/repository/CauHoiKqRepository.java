package com.nvh.daugia.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nvh.daugia.model.jpa.BangDanhGiaKq;
import com.nvh.daugia.model.jpa.CauHoi;
import com.nvh.daugia.model.jpa.CauHoiKq;

public interface CauHoiKqRepository extends CrudRepository<CauHoiKq, Integer> {
	
	public List<CauHoiKq> findByKetqua(char kq);
	public List<CauHoiKq> findByCauhoi(CauHoi ch);
	public List<CauHoiKq> findByCauhoiAndBangkq(CauHoi ch, BangDanhGiaKq bangkq);
}
