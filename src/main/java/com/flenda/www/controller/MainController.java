package com.flenda.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flenda.www.service.MainService;

@Controller
public class MainController {

	@Autowired
	MainService service;
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(Model model) {
		System.out.println("MainController main");
		model.addAttribute("top_menu", "yes");
		return "main.tiles";
	}
	
	@RequestMapping(value = "bbslist.do", method = RequestMethod.GET)
	public String bbslist(Model model) {
		System.out.println("MemberController bbslist");
		model.addAttribute("side_menu", "menu");
		model.addAttribute("top_menu", "yes");
		return "bbs.tiles";
	}
	
	@RequestMapping(value = "management.do", method = RequestMethod.GET)
	public String management(Model model) {
		System.out.println("MainController management");
		model.addAttribute("top_menu", "no");
		return "management.tiles";
	}
}
