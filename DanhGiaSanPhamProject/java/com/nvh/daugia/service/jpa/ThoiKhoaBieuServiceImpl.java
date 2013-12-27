package com.nvh.daugia.service.jpa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.nvh.daugia.model.jpa.LichSuDauGia;
import com.nvh.daugia.model.jpa.SanPham;
import com.nvh.daugia.model.jpa.User;
import com.nvh.daugia.repository.ThoiKhoaBieuRepository;
import com.nvh.daugia.service.ThoiKhoaBieuService;

@Service("JpaThoikhoabieuService")
public class ThoiKhoaBieuServiceImpl implements ThoiKhoaBieuService {

	@Autowired
	private ThoiKhoaBieuRepository tkbRepository;
	
	@Override
	public List<LichSuDauGia> findAll() {
		// TODO Auto-generated method stub
		return Lists.newArrayList(tkbRepository.findAll());
	}

	@Override
	public LichSuDauGia findById(int id) {
		// TODO Auto-generated method stub
		return tkbRepository.findOne(id);
	}

	@Override
	public List<LichSuDauGia> findBySV(User user) {
		// TODO Auto-generated method stub
		return tkbRepository.findBySv(user);
	}

	@Override
	public LichSuDauGia save(LichSuDauGia tkb) {
		// TODO Auto-generated method stub
		return tkbRepository.save(tkb);
	}

	@Override
	public void delete(LichSuDauGia tkb) {
		// TODO Auto-generated method stub
		tkbRepository.delete(tkb);
	}

	@Override
	public List<LichSuDauGia> findByGv(User user) {
		// TODO Auto-generated method stub
		return tkbRepository.findByGv(user);
	}

	@Override
	public List<LichSuDauGia> findByMonhoc(SanPham mh) {
		// TODO Auto-generated method stub
		return tkbRepository.findByMonhoc(mh);
	}

}
