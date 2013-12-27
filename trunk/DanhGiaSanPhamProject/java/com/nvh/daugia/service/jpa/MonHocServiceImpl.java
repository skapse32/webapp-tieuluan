package com.nvh.daugia.service.jpa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.nvh.daugia.model.jpa.SanPham;
import com.nvh.daugia.repository.MonHocRepository;
import com.nvh.daugia.service.MonHocService;

@Service("JpaMonHocService")
public class MonHocServiceImpl implements MonHocService {

	@Autowired
	private MonHocRepository mhRepository;
	
	@Override
	public List<SanPham> findAll() {
		// TODO Auto-generated method stub
		return Lists.newArrayList(mhRepository.findAll());
	}

	@Override
	public SanPham findById(String id) {
		// TODO Auto-generated method stub
		return mhRepository.findOne(id);
	}

	@Override
	public SanPham save(SanPham tkb) {
		// TODO Auto-generated method stub
		return mhRepository.save(tkb);
	}

	@Override
	public void delete(SanPham tkb) {
		// TODO Auto-generated method stub
		mhRepository.delete(tkb);
	}

}
