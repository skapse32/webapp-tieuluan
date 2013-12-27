package com.nvh.util;

import java.util.Comparator;

import com.nvh.daugia.model.jpa.CauHoi;
import com.nvh.daugia.model.jpa.LoaiCauHoi;

public class LoaiCauHoiComparator implements Comparator<LoaiCauHoi> {

	@Override
	public int compare(LoaiCauHoi arg0, LoaiCauHoi arg1) {
		// TODO Auto-generated method stub
		return arg0.getId() - arg1.getId();
	}

}
