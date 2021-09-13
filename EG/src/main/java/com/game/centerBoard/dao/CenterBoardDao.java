package com.game.centerBoard.dao;

import java.util.List;
import java.util.Map;

import com.game.centerBoard.vo.CenterBoardVo;
import com.game.userBoard.vo.UserBoardVo;

public interface CenterBoardDao {

	public List<Map<String,Object>> centerBoardList(CenterBoardVo vo);
	public void centerBoardInsert(CenterBoardVo vo);
	public UserBoardVo centerBoardRead (Integer bno);
	public void centerBoardUpdate(CenterBoardVo vo);
	public void centerBoardDelete(Integer bno);
	public Integer centerBoardListCnt(CenterBoardVo vo);
	public void centerBoardReadCnt(Integer bno);
}
