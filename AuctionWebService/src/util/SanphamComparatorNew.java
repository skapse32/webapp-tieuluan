package util;

import java.sql.Timestamp;
import java.util.Comparator;

import domain.Sanpham;

public class SanphamComparatorNew implements Comparator<Sanpham>{

	@Override
	public int compare(Sanpham o1, Sanpham o2) {
		if(o1.getThoigianbatdau().after(o2.getThoigianbatdau())){
			return -1;
		}
		if(o2.getThoigianbatdau().after(o1.getThoigianbatdau())){
			return 1;
		}
		return 0;
	}

}
