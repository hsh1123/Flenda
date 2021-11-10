package com.flenda.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flenda.www.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login(Model mdeol) {
		
		
		return "login.tiles";
	}
}
