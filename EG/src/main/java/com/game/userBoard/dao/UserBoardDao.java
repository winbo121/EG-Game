package com.game.userBoard.dao;

import java.util.List;
import java.util.Map;

import com.game.userBoard.vo.UserBoardVo;

public interface UserBoardDao {
	public List<Map<String,Object>> userBoardList(UserBoardVo vo);
	public void userBoardInsert(UserBoardVo vo);
	public UserBoardVo UserBoardRead (Integer bno);
	public void userBoardUpdate(UserBoardVo vo);
	public void userBoardDelete(Integer bno);
	public Integer userBoardListCnt(UserBoardVo vo);
}
