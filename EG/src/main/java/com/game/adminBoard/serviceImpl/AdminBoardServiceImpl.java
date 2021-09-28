package com.game.adminBoard.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.game.adminBoard.dao.AdminBoardDao;
import com.game.adminBoard.service.AdminBoardService;
import com.game.adminBoard.vo.AdminBoardVo;


@Service
public class AdminBoardServiceImpl implements AdminBoardService{

	
	@Inject
	private AdminBoardDao adminBoardDao;
	
	@Override
	public List<Map<String, Object>> adminBoardList(AdminBoardVo vo) {

		return adminBoardDao.adminBoardList(vo);
	}

	@Override
	public void adminBoardInsert(AdminBoardVo vo) {

		adminBoardDao.adminBoardInsert(vo);
	}

	@Override
	public AdminBoardVo adminBoardRead(Integer bno) {

		return adminBoardDao.adminBoardRead(bno);
	}

	@Override
	public void adminBoardUpdate(AdminBoardVo vo) {

		adminBoardDao.adminBoardUpdate(vo);
	}

	@Override
	public void adminBoardDelete(Integer bno) {

		adminBoardDao.adminBoardDelete(bno);
	}

	@Override
	public Integer adminBoardListCnt(AdminBoardVo vo) {

		return adminBoardDao.adminBoardListCnt(vo);
	}

	@Override
	public void adminBoardReadCnt(Integer bno) {

		adminBoardDao.adminBoardReadCnt(bno);
	}

}
