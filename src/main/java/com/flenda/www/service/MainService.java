package com.flenda.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flenda.www.dao.MainDao;
import com.flenda.www.dto.PicturesDto;

@Service
public class MainService {

	@Autowired
	MainDao dao;
	
	public String addPictures(PicturesDto pic) {
		return dao.addPictures(pic)>0?"success":"fail";
	}
	
	public String updatePictures(PicturesDto pic) {
		return dao.updatePictures(pic)>0?"success":"fail";
	}
	
	public String deletePic(int seq) {
		return dao.deletePic(seq)>0?"success":"fail";
	}
	
	public int countPics(int seq) {
		return dao.countPics(seq);
	}
	public List<PicturesDto> getPictures(){
		return dao.getPictures();
	}
	
	public List<PicturesDto> getPic(int seq){
		return dao.getPic(seq);
	}
}
