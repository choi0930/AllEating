package com.spring.alleating.admin.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alleating.admin.community.dao.AdminCommunityDAO;

@Service("adminCommunityService")
public class AdminCommunityServiceImpl {
	@Autowired
	AdminCommunityDAO adminCommunityDAO;
	
}
