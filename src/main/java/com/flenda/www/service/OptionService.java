package com.flenda.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flenda.www.dao.OptionDao;
import com.flenda.www.dto.OptionDto;

@Service
public class OptionService {
	
	@Autowired
	OptionDao dao;
	
	public String addOption(OptionDto option) {
		return dao.addOption(option)>0?"success":"fail";
	}
	
	public List<OptionDto> getOptionList(int seq){
		return dao.getOptionList(seq);
	}
	public String deleteOption(int seq) {
		return dao.deleteOption(seq)>0?"success":"fail";
	}
	public String deleteOps(int seq) {
		return dao.deleteOps(seq)>0?"success":"fail";
	}
	public List<OptionDto> detailOptions(String date, int seq){
		OptionDto option = new OptionDto();
		option.setSellSeq(seq);
		String year = date.substring(0, 4);	//2021
		String month = date.substring(6, 8);
		String day = date.substring(10, 12);
		String Dday = year + month + day;
		option.setStartDate(Dday);
		System.out.println(option.toString());
		return dao.detailOptions(option);
	}
}
