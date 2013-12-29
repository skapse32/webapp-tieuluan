package com.nvh.daugia.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nvh.daugia.model.jpa.BangDanhGiaKq;

public interface BangDanhGiaKqRepository extends CrudRepository<BangDanhGiaKq, Integer> {

	public BangDanhGiaKq findByUserbAndUserd(String userb, String userd);

	public List<BangDanhGiaKq> findByUserb(String userb);
}
