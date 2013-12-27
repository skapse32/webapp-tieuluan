package com.nvh.daugia.service;

import java.util.ArrayList;

import com.nvh.daugia.model.jpa.FileBean;

public interface ImportService {
	public ArrayList<String> importFile(FileBean fileBean);
}
