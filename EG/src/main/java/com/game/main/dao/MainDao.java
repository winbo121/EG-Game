package com.game.main.dao;

import java.util.List;
import java.util.Map;

public interface MainDao {
	
	public List<Map<String,Object>> mainAdminBoardList();
	public List<Map<String,Object>> mainCenterBoardList();
	public List<Map<String,Object>> mainUserBoardList();

}
