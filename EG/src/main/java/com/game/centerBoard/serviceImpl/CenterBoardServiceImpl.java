package com.game.centerBoard.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.game.centerBoard.dao.CenterBoardDao;
import com.game.centerBoard.service.CenterBoardService;
import com.game.centerBoard.vo.CenterBoardVo;
import com.game.userBoard.vo.UserBoardVo;

@Service
public class CenterBoardServiceImpl implements CenterBoardService{

	
	@Inject
	private CenterBoardDao centerBoardDao;
	
	@Override
	public List<Map<String, Object>> centerBoardList(CenterBoardVo vo) {

		return centerBoardDao.centerBoardList(vo);
	}

	@Override
	public void centerBoardInsert(CenterBoardVo vo) {

		centerBoardDao.centerBoardInsert(vo);
	}

	@Override
	public UserBoardVo centerBoardRead(Integer bno) {

		return centerBoardDao.centerBoardRead(bno);
	}

	@Override
	public void centerBoardUpdate(CenterBoardVo vo) {

		centerBoardDao.centerBoardUpdate(vo);
	}

	@Override
	public void centerBoardDelete(Integer bno) {
		
		centerBoardDao.centerBoardDelete(bno);
	}

	@Override
	public Integer centerBoardListCnt(CenterBoardVo vo) {

		return centerBoardDao.centerBoardListCnt(vo);
	}

	@Override
	public void centerBoardReadCnt(Integer bno) {
		
		centerBoardDao.centerBoardReadCnt(bno);
	}

}
