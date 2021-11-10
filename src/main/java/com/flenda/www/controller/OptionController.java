package com.flenda.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flenda.www.dto.OptionDto;
import com.flenda.www.service.OptionService;

@Controller
public class OptionController {

	@Autowired
	OptionService service;
	
	@ResponseBody
	@RequestMapping(value = "addOption.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String addOption(OptionDto option) {
		System.out.println("OptionController addOption");
		option.setStartDate(option.getStartDate().replace("-", ""));
		option.setEndDate(option.getEndDate().replace("-", ""));
		System.out.println(option.toString());
		String msg = "";
		msg = service.addOption(option);
		return msg;
	}

	@ResponseBody
	@RequestMapping(value = "getOptionList.do", method = {RequestMethod.GET,RequestMethod.POST})
	public List<OptionDto> getOptionList(int seq) {
		System.out.println("OptionController getOptionList");
		return service.getOptionList(seq);
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteOption.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteOption(int seq) {
		System.out.println("OptionController deleteOption");
		return service.deleteOption(seq);
	}
}
