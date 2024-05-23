package com.game.join.serviceimpl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.game.join.dao.JoinDao;
import com.game.join.service.JoinService;
import com.game.join.vo.JoinVo;

@Service
public class JoinServiceImpl implements JoinService{
	
	@Inject
	private JoinDao joinDao;

	@Override
	public Integer joinIdCheck(JoinVo joinVo) {
		
		return joinDao.joinIdCheck(joinVo);
	}

	@Override
	public void joinInsert(JoinVo joinVo) {
		
		joinDao.joinInsert(joinVo);
	}

}
