package com.nvh.daugia.service.jpa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.nvh.daugia.model.jpa.BangDanhGiaKq;
import com.nvh.daugia.model.jpa.CauHoi;
import com.nvh.daugia.model.jpa.CauHoiKq;
import com.nvh.daugia.repository.CauHoiKqRepository;
import com.nvh.daugia.service.CauHoiKqService;

@Service("JpaCauHoiKqService")
public class CauHoiKqServiceImpl implements CauHoiKqService {

	@Autowired
	private CauHoiKqRepository kqRepository;
	
	@Override
	public List<CauHoiKq> findAll() {
		// TODO Auto-generated method stub
		return Lists.newArrayList(kqRepository.findAll());
	}

	@Override
	public CauHoiKq findById(int id) {
		// TODO Auto-generated method stub
		return kqRepository.findOne(id);
	}

	@Override
	public CauHoiKq save(CauHoiKq ch) {
		// TODO Auto-generated method stub
		return kqRepository.save(ch);
	}

	@Override
	public void delete(CauHoiKq ch) {
		// TODO Auto-generated method stub
		kqRepository.delete(ch);
	}

	@Override
	public List<CauHoiKq> findByKetqua(char kq) {
		// TODO Auto-generated method stub
		return kqRepository.findByKetqua(kq);
	}

	@Override
	public List<CauHoiKq> findByCauhoi(CauHoi ch) {
		// TODO Auto-generated method stub
		return kqRepository.findByCauhoi(ch);
	}

	@Override
	public List<CauHoiKq> findByCauHoiBangDanhGiakq(CauHoi ch,
			BangDanhGiaKq dgkq) {
		// TODO Auto-generated method stub
		return kqRepository.findByCauhoiAndBangkq(ch, dgkq);
	}

}
