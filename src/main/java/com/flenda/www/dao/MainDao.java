package com.flenda.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.flenda.www.dto.PicturesDto;

@Repository
public class MainDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Main.";
	
	public int addPictures(PicturesDto pic) {
		return session.insert(ns + "addPictures", pic);
	}
	
	public int updatePictures(PicturesDto pic) {
		return session.insert(ns + "updatePictures", pic);
	}
	
	public int deletePic(int seq) {
		return session.delete(ns + "deletePic", seq);
	}
	
	public int countPics(int seq) {
		return session.selectOne(ns + "countPics", seq);
	}
	
	public List<PicturesDto> getPictures(){
		return session.selectList(ns + "getPictures");
	}
	
	public List<PicturesDto> getPic(int seq){
		return session.selectList(ns + "getPic", seq);
	}
}
