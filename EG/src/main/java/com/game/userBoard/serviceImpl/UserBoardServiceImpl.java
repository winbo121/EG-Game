package com.game.userBoard.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.game.userBoard.dao.UserBoardDao;
import com.game.userBoard.service.UserBoardService;
import com.game.userBoard.vo.UserBoardVo;

@Service
public class UserBoardServiceImpl implements UserBoardService{
	
	@Inject
	private UserBoardDao userBoardDao;

	@Override
	public List<Map<String, Object>> userBoardList(UserBoardVo vo) {
		
		return userBoardDao.userBoardList(vo);
	}

	@Override
	public void userBoardInsert(UserBoardVo vo) {

		userBoardDao.userBoardInsert(vo);
	}

	@Override
	public UserBoardVo UserBoardRead(Integer bno) {

		return userBoardDao.UserBoardRead(bno);
	}

	@Override
	public void userBoardUpdate(UserBoardVo vo) {

		userBoardDao.userBoardUpdate(vo);
	}

	@Override
	public void userBoardDelete(Integer bno) {
		
		userBoardDao.userBoardDelete(bno);
	}

	@Override
	public Integer userBoardListCnt(UserBoardVo vo) {
		
		return userBoardDao.userBoardListCnt(vo);
	}

}
