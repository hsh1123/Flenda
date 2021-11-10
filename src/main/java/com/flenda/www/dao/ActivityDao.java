package com.flenda.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.flenda.www.dto.Act_SearchDto;
import com.flenda.www.dto.ActivityDto;

@Repository
public class ActivityDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Activity.";
//	관리자페이지
	public int addActivity(ActivityDto act) {
		return session.insert(ns + "addActivity", act);
	}
	public List<ActivityDto> getActivityList() {
		return session.selectList(ns + "getActivityList");
	}
	
	public ActivityDto getActivity(int seq) {
		return session.selectOne(ns + "getActivity", seq);
	}
	
	public int updateActivity(ActivityDto act) {
		return session.update(ns + "updateAct", act);
	}
	
	public int deleteAct(int seq) {
		return session.delete(ns + "deleteAct", seq);
	}

// 사용자페이지
	public List<ActivityDto> main_getActivityList(Act_SearchDto search){
		return session.selectList(ns + "main_getActivityList", search);
	}
	public int allcount(Act_SearchDto search) {
		return session.selectOne(ns + "allcount", search);
	}
}
