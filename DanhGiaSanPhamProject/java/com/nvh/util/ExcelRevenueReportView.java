package com.nvh.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.nvh.daugia.model.jpa.BangDanhGia;
import com.nvh.daugia.model.jpa.BangDanhGiaKq;
import com.nvh.daugia.model.jpa.CauHoi;
import com.nvh.daugia.model.jpa.CauHoiKq;
import com.nvh.daugia.model.jpa.LichSuDauGia;
import com.nvh.daugia.model.jpa.LoaiCauHoi;
import com.nvh.daugia.model.jpa.SanPham;
import com.nvh.daugia.service.BangDanhGiaKqService;
import com.nvh.daugia.service.BangDanhGiaService;
import com.nvh.daugia.service.MonHocService;
import com.nvh.daugia.service.ThoiKhoaBieuService;

public class ExcelRevenueReportView extends AbstractExcelView {

	@Autowired
	private MonHocService mhService;
	@Autowired
	private ThoiKhoaBieuService tkbService;
	@Autowired
	private BangDanhGiaKqService dgkqService;
	@Autowired
	private BangDanhGiaService bdgService;

	@Override
	protected void buildExcelDocument(Map<String, Object> arg0,
			HSSFWorkbook arg1, HttpServletRequest arg2, HttpServletResponse arg3)
			throws Exception {
		// TODO Auto-generated method stub
		Map<String,String> revenueData = (Map<String,String>) arg0.get("revenueData");
		HSSFWorkbook wb = new HSSFWorkbook();

		HSSFFont font = wb.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

		HSSFSheet worksheet = wb.createSheet("DanhGia");
		worksheet.setColumnWidth(0, (20 * 256));
		worksheet.setColumnWidth(1, (30 * 1024));
		worksheet.setColumnWidth(4, (20 * 256));

		HSSFRow row = worksheet.createRow(0);

		HSSFRichTextString value = new HSSFRichTextString("Đánh giá giảng viên");
		value.applyFont(font);
		row.createCell(0).setCellValue(value);

		row = worksheet.createRow(1);
		row.createCell(0).setCellValue(
				new HSSFRichTextString("Khoa đào tạo chất lượng cao"));

		worksheet.createRow(2);

		row = worksheet.createRow(3);

		HSSFCellStyle style = wb.createCellStyle();
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		font = wb.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

		value = new HSSFRichTextString("Mã Câu");
		value.applyFont(font);
		HSSFCell cell = row.createCell(0);
		cell.setCellValue(value);
		cell.setCellStyle(style);

		value = new HSSFRichTextString("Nội Dung");
		value.applyFont(font);
		cell = row.createCell(1);
		cell.setCellValue(value);
		cell.setCellStyle(style);

		value = new HSSFRichTextString("Kết Quả A");
		value.applyFont(font);
		cell = row.createCell(2);
		cell.setCellValue(value);
		cell.setCellStyle(style);

		value = new HSSFRichTextString("Kết Quả B");
		value.applyFont(font);
		cell = row.createCell(3);
		cell.setCellValue(value);
		cell.setCellStyle(style);

		value = new HSSFRichTextString("Kết Quả C");
		value.applyFont(font);
		cell = row.createCell(4);
		cell.setCellValue(value);
		cell.setCellStyle(style);

		value = new HSSFRichTextString("Kết quả D");
		value.applyFont(font);
		cell = row.createCell(5);
		cell.setCellValue(value);
		cell.setCellStyle(style);

		int rowIndex = 4;
		
		BangDanhGia bdg = bdgService.findById(Integer.parseInt(revenueData.get("iddg")));
		List<LoaiCauHoi> lchs = new ArrayList<LoaiCauHoi>(bdg.getLchs());
		Collections.sort(lchs);

		SanPham mh = mhService.findById(revenueData.get("mh"));
		List<LichSuDauGia> tkbs = tkbService.findByMonhoc(mh);
		List<BangDanhGiaKq> dgkqs = new ArrayList<BangDanhGiaKq>();
		for (LichSuDauGia thoiKhoaBieu : tkbs) {
			BangDanhGiaKq dgkq = null;
			if ((dgkq = dgkqService.findByMonhocdg(thoiKhoaBieu)) != null) {
				dgkqs.add(dgkq);
			}
		}

		for (CauHoi cauHoi : bdg.getCauhois()) {
			row = worksheet.createRow(rowIndex++);
			DisplayResult kq = new DisplayResult();
			row.createCell(0).setCellValue(
					new HSSFRichTextString(cauHoi.getId()));
			row.createCell(1).setCellValue(
					new HSSFRichTextString(cauHoi.getNoidung()));
			int a = 0, b = 0, c = 0, d = 0;
			for (BangDanhGiaKq bangDanhGiaKq : dgkqs) {
				if (bangDanhGiaKq.getLoaiBang().getId() == bdg.getId()) {
					for (CauHoiKq chkq : bangDanhGiaKq.getCauhoikqs()) {
						if (chkq.getCauhoi().getId().equals(cauHoi.getId())) {
							switch (chkq.getKetqua()) {
							case 'A':
								a++;
								break;
							case 'B':
								b++;
								break;
							case 'C':
								c++;
								break;
							case 'D':
								d++;
								break;
							}
						}
					}
				}
			}
			row.createCell(2).setCellValue(((double) a / dgkqs.size()) * 100);
			row.createCell(3).setCellValue(((double) b / dgkqs.size()) * 100);
			row.createCell(4).setCellValue(((double) c / dgkqs.size()) * 100);
			row.createCell(5).setCellValue(((double) d / dgkqs.size()) * 100);
		}
	}

}
