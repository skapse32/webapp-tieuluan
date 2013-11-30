package com.tieuluan.daugia.function;


public class Function {
	public static int tinhSoTrangSanPham(int soLuongSanPhamTrenTrang, int size) {

		int n = size;
		int s;
		if (soLuongSanPhamTrenTrang != -1) {
			s = n / soLuongSanPhamTrenTrang;
			if (n % soLuongSanPhamTrenTrang != 0) {
				s++;
			}
		} else {
			s = 1;
		}
		return s;
	}

	

}
