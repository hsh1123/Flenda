package com.flenda.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flenda.www.dao.MemberDao;

@Service
public class MemberService {
	
	@Autowired
	MemberDao dao;

}
