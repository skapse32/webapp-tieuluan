package util;

import java.util.Comparator;

import dao.Sanpham;

public class SanphamComparatorPriceDown implements Comparator<Sanpham>{

	@Override
	public int compare(Sanpham o1, Sanpham o2) {
		return (int) (o2.getGiahientai()-o1.getGiahientai());
	}

}
