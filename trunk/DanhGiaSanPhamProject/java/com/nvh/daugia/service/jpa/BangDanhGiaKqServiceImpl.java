package com.nvh.daugia.service.jpa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.nvh.daugia.model.jpa.BangDanhGiaKq;
import com.nvh.daugia.repository.BangDanhGiaKqRepository;
import com.nvh.daugia.service.BangDanhGiaKqService;

@Service("JpaBangDanhGiaKqService")
public class BangDanhGiaKqServiceImpl implements BangDanhGiaKqService {

	@Autowired
	private BangDanhGiaKqRepository bdgkqRepository;
	
	@Override
	public List<BangDanhGiaKq> findAll() {
		// TODO Auto-generated method stub
		return Lists.newArrayList(bdgkqRepository.findAll());
	}

	@Override
	public BangDanhGiaKq findById(int id) {
		// TODO Auto-generated method stub
		return bdgkqRepository.findOne(id);
	}

	@Override
	public BangDanhGiaKq save(BangDanhGiaKq ch) {
		// TODO Auto-generated method stub
		return bdgkqRepository.save(ch);
	}

	@Override
	public void delete(BangDanhGiaKq ch) {
		// TODO Auto-generated method stub
		bdgkqRepository.delete(ch);
	}

	@Override
	public BangDanhGiaKq findByUserbAndUserd(String userb, String userd) {
		// TODO Auto-generated method stub
		return bdgkqRepository.findByUserbAndUserd(userb, userd);
	}

	@Override
	public List<BangDanhGiaKq> findByUserb(String userb) {
		// TODO Auto-generated method stub
		return bdgkqRepository.findByUserb(userb);
	}

}
