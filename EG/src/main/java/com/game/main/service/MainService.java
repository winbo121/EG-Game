package com.game.main.service;

import java.util.List;
import java.util.Map;

public interface MainService {

	public List<Map<String,Object>> mainAdminBoardList();
	public List<Map<String,Object>> mainCenterBoardList();
	public List<Map<String,Object>> mainUserBoardList();
	public List<Map<String,Object>> mainCodeList(String code_cd_id);
}
