package com.game.centerBoard.dao;

import java.util.List;
import java.util.Map;

import com.game.centerBoard.vo.CenterBoardVo;


public interface CenterBoardDao {

	public List<Map<String,Object>> centerBoardList(CenterBoardVo vo);
	public void centerBoardInsert(CenterBoardVo vo);
	public CenterBoardVo centerBoardRead (Integer bno);
	public void centerBoardUpdate(CenterBoardVo vo);
	public void centerBoardDelete(Integer bno);
	public Integer centerBoardListCnt(CenterBoardVo vo);
	public void centerBoardReadCnt(Integer bno);
	public List<Map<String,Object>> centerBoardAnsweringList(CenterBoardVo vo);
	public List<Map<String,Object>> centerBoardAnswerList(CenterBoardVo vo);
	public Integer centerBoardAnsweringListCnt(CenterBoardVo vo);
	public Integer centerBoardAnswerListCnt(CenterBoardVo vo);
	
}
