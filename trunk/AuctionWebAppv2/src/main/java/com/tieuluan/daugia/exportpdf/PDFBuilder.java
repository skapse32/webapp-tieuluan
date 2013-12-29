package com.tieuluan.daugia.exportpdf;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.tieuluan.daugia.model.Hoadon;

/**
 * This view class generates a PDF document 'on the fly' based on the data
 * contained in the model.
 * @author www.codejava.net
 *
 */
public class PDFBuilder extends AbstractITextPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// get data model which is passed by the Spring container
		List<Hoadon> listHds = (List<Hoadon>) model.get("dshd");
		
		doc.add(new Paragraph("HOA DON NGUOI DUNG"));
		
		PdfPTable table = new PdfPTable(6);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] {2.0f, 2.0f, 2.0f, 2.0f, 2.0f, 3.0f});
		table.setSpacingBefore(10);
		
		// define font for table header row
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(BaseColor.WHITE);
		
		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.GRAY);
		cell.setPadding(5);
		
		// write table header 
		cell.setPhrase(new Phrase("Ma Hoa Don", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Ma San Pham", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Don Gia", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Nguoi Dang", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Nguoi Mua", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Ngay Lap", font));
		table.addCell(cell);
		
		// write table row data
		for (Hoadon hd : listHds) {
			table.addCell(hd.getMahoadon().toString());
			table.addCell(hd.getMasp().toString());
			table.addCell((Integer.valueOf(hd.getDongia().intValue())).toString());
			table.addCell(hd.getNguoidang());
			table.addCell(hd.getNguoimua());
			 Date date=new Date(hd.getNgaylap());
		        SimpleDateFormat df2 = new SimpleDateFormat("dd/MM/yyyy");
		        String dateText = df2.format(date);
			table.addCell(dateText);
		}
		
		doc.add(table);
		
	}

}