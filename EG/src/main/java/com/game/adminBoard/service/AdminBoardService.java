package com.game.adminBoard.service;

import java.util.List;
import java.util.Map;

import com.game.adminBoard.vo.AdminBoardVo;

public interface AdminBoardService {
	
	
	public List<Map<String,Object>> adminBoardList(AdminBoardVo vo);
	public void adminBoardInsert(AdminBoardVo vo);
	public AdminBoardVo adminBoardRead (Integer bno);
	public void adminBoardUpdate(AdminBoardVo vo);
	public void adminBoardDelete(Integer bno);
	public Integer adminBoardListCnt(AdminBoardVo vo);
	public void adminBoardReadCnt(Integer bno);


}
