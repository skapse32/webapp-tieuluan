package com.tieuluan.daugia.controller;


import java.net.UnknownHostException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tieuluan.daugia.function.Server;

@Controller
public class ExampleController {
	@RequestMapping(value = "/example", method = RequestMethod.GET)
	public String example(HttpSession session,Model model) throws UnknownHostException {
		
		
		//String username="QuyAnh";
		//session.setAttribute("username",username);
		String result="";
		if (session.getAttribute("sessionid") != null) {
			result+=session.getAttribute("sessionid").toString();
		}

		model.addAttribute("noidung", result);	
		model.addAttribute("tieude", "Test");
		String web=Server.web;
		model.addAttribute("web", web);
		return "example";
	}
	@RequestMapping(value = "/example1", method = RequestMethod.GET)
	public String example1(HttpSession session,Model model) throws UnknownHostException {
		
		
		//String username="QuyAnh";
		//session.setAttribute("username",username);
		String result="";
		if (session.getAttribute("sessionid") != null) {
			result+=session.getAttribute("sessionid").toString();
		}

		model.addAttribute("noidung", result+"example1");	
		model.addAttribute("tieude", "Test");
		String web=Server.web;
		model.addAttribute("web", web);
		return "example";
	}
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(HttpSession session,Model model) throws UnknownHostException {
		String username=(String) session.getAttribute("username");
		model.addAttribute("tieude", username);
		String web=Server.web;
		model.addAttribute("web", web);
		return "notice";
	}
}
