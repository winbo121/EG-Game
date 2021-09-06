package com.game.userBoard.service;

import java.util.List;
import java.util.Map;

import com.game.userBoard.vo.UserBoardVo;

public interface UserBoardService {
	public List<Map<String,Object>> userBoardList(UserBoardVo vo);
	public void userBoardInsert(UserBoardVo vo);
	public UserBoardVo UserBoardRead (Integer bno);
	public void userBoardUpdate(UserBoardVo vo);
	public void userBoardDelete(List<String> del_list);
	public Integer userBoardListCnt(UserBoardVo vo);
}
