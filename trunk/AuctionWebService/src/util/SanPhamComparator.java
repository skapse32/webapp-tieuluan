package util;

import java.util.Comparator;

import domain.Sanpham;

public class SanPhamComparator implements Comparator<Sanpham>{

	@Override
	public int compare(Sanpham o1, Sanpham o2) {	
		return o2.getLichsudaugias().size()-o1.getLichsudaugias().size();
	}

}
