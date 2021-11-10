package com.flenda.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flenda.www.dto.WebSocketDto;

@Controller
public class WebSocketController {
	
	@RequestMapping(value = "chating.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String chating(Model model) {
		model.addAttribute("doc_title", "채팅");

		return "chating.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "chatingAf.do", method = {RequestMethod.POST, RequestMethod.GET})
	public WebSocketDto chatingAf(Model model, WebSocketDto dto) {
		System.out.println(dto);
		model.addAttribute("doc_title", "채팅");
	
		return dto;
	}

	
}
