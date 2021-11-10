package com.flenda.www.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flenda.www.dao.ActivityDao;
import com.flenda.www.dto.Act_SearchDto;
import com.flenda.www.dto.ActivityDto;

@Service
public class ActivityService {
	
	@Autowired
	ActivityDao dao;
//	관리자페이지
	public String addActivity(ActivityDto act) {
		return dao.addActivity(act)>0?"success":"fail";
	}
	
	public List<ActivityDto> getActivityList(){
		return dao.getActivityList();
	}
	
	public ActivityDto getActivity(int seq) {
		return dao.getActivity(seq);
	}
	public String updateActivity(ActivityDto act) {
		return dao.updateActivity(act)>0?"success":"fail";
	}
	public String deleteAct(int seq) {
		return dao.deleteAct(seq)>0?"success":"fail";
	}
	
// 사용자페이지
	public List<ActivityDto> main_getActivityList(Act_SearchDto search){
			String[] dateranges = search.getDaterange().split("-");
			search.setSdate(dateranges[0].trim().replace("/", ""));
			search.setEdate(dateranges[1].trim().replace("/", ""));

			String[] prices = search.getPrice().split("~");
			search.setSprice(prices[0]);
			search.setEprice(prices[1]);

			String[] times = search.getTime().split("~");
			search.setStime(times[0]);
			search.setEtime(times[1]);

			System.out.println(search.toString());
		return	dao.main_getActivityList(search);
	}
	public int allcount(Act_SearchDto search) {
		return dao.allcount(search);
	}
	
}
