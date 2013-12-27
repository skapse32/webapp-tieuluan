package com.nvh.daugia.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.nvh.daugia.model.jpa.BangDanhGiaKq;
import com.nvh.daugia.model.jpa.LichSuDauGia;

public interface BangDanhGiaKqRepository extends CrudRepository<BangDanhGiaKq, Integer> {

	public BangDanhGiaKq findByMonhocdg(LichSuDauGia tkb);

}
