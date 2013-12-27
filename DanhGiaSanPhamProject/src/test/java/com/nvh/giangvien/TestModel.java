package com.nvh.giangvien;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.nvh.daugia.model.jpa.BangDanhGia;
import com.nvh.daugia.model.jpa.CauHoi;
import com.nvh.daugia.model.jpa.LoaiCauHoi;
import com.nvh.daugia.service.BangDanhGiaService;
import com.nvh.daugia.service.CauHoiService;
import com.nvh.daugia.service.LoaiCauHoiService;

public class TestModel {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext mContext = new ClassPathXmlApplicationContext("root-context.xml");
		LoaiCauHoiService lchService = (LoaiCauHoiService) mContext.getBean("JpaLoaiCauHoiService");
		CauHoiService chService = (CauHoiService) mContext.getBean("JpaCauHoiService");
		List<CauHoi> chs = chService.findByloaicau(lchService.findById(1));
		//chService.delete(ch);
		System.out.println(chs);
	}

}
