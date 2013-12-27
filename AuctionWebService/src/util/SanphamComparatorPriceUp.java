package util;

import java.util.Comparator;

import dao.Sanpham;

public class SanphamComparatorPriceUp implements Comparator<Sanpham>{

	@Override
	public int compare(Sanpham o1, Sanpham o2) {
		return (int) (o1.getGiahientai()-o2.getGiahientai());
	}

}
