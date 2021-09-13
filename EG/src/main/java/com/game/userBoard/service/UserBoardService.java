package com.game.userBoard.service;

import java.util.List;
import java.util.Map;

import com.game.userBoard.vo.UserBoardVo;

public interface UserBoardService {
	public List<Map<String,Object>> userBoardList(UserBoardVo vo);
	public void userBoardInsert(UserBoardVo vo);
	public UserBoardVo userBoardRead (Integer bno);
	public void userBoardUpdate(UserBoardVo vo);
	public void userBoardDelete(Integer bno);
	public Integer userBoardListCnt(UserBoardVo vo);
	public void userBoardReadCnt(Integer bno);
}
