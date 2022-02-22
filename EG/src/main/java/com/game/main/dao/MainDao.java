package com.game.main.dao;

import java.util.List;
import java.util.Map;

import com.game.main.vo.MainVo;

public interface MainDao {
	
	public List<Map<String,Object>> mainAdminBoardList();
	public List<Map<String,Object>> mainCenterBoardList();
	public List<Map<String,Object>> mainUserBoardList();
	public List<Map<String,Object>> mainCodeList(String code_cd_id);

}
