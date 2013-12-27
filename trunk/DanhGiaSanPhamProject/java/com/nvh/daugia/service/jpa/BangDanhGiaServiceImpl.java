package com.nvh.daugia.service.jpa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.nvh.daugia.model.jpa.BangDanhGia;
import com.nvh.daugia.repository.BangDanhGiaRepository;
import com.nvh.daugia.service.BangDanhGiaService;

@Service("JpaBangDanhGiaService")
public class BangDanhGiaServiceImpl implements BangDanhGiaService {

	@Autowired
	private BangDanhGiaRepository bdgRepository;
	
	
	@Override
	public List<BangDanhGia> findAll() {
		// TODO Auto-generated method stub
		return Lists.newArrayList(bdgRepository.findAll());
	}

	@Override
	public BangDanhGia findById(int id) {
		// TODO Auto-generated method stub
		return bdgRepository.findById(id);
	}

	@Override
	public BangDanhGia save(BangDanhGia ch) {
		// TODO Auto-generated method stub
		return bdgRepository.save(ch);
	}

	@Override
	public void delete(BangDanhGia dg) {
		// TODO Auto-generated method stub
		//xoa het cau hoi truoc
		bdgRepository.delete(dg);
	}

}
