package com.game.main.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.game.main.dao.MainDao;
import com.game.main.service.MainService;

@Service
public class MainServiceImpl implements MainService{

	
	@Inject
	private MainDao mainDao;
	
	@Override
	public List<Map<String, Object>> mainAdminBoardList() {
		
		return mainDao.mainAdminBoardList();
	}

	@Override
	public List<Map<String, Object>> mainCenterBoardList() {
	
		return mainDao.mainCenterBoardList();
	}

	@Override
	public List<Map<String, Object>> mainUserBoardList() {
		
		return mainDao.mainUserBoardList();
	}

}
