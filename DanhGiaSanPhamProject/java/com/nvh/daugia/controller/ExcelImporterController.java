package com.nvh.daugia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nvh.daugia.model.jpa.FileBean;

@Controller
@RequestMapping("/upload")
public class ExcelImporterController {

	
    @RequestMapping(method = RequestMethod.POST)
    public String upload(FileBean uploadItem, BindingResult result) {
        //importService.importFile(uploadItem);
        return "import/importDone";
    }

}