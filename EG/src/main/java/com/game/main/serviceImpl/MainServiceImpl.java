package com.game.main.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.game.main.dao.MainDao;
import com.game.main.service.MainService;
import com.game.main.vo.MainVo;


@Service
public class MainServiceImpl implements MainService{

	
	@Inject
	private MainDao mainDao;
	

	private MainVo vo =new MainVo();
	
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

	@Override
	public List<Map<String, Object>> mainCodeList(String code_cd_id) {
		vo.setCode_cd_id(code_cd_id);
		return mainDao.mainCodeList(vo.getCode_cd_id());
	}


}
