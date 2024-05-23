package com.game.join.daoimpl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.game.join.dao.JoinDao;
import com.game.join.vo.JoinVo;

@Repository
public class JoinDaoImpl implements JoinDao{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public Integer joinIdCheck(JoinVo joinVo) {
		return sqlSession.selectOne("join.joinIdCheck", joinVo);
	}

	@Override
	public void joinInsert(JoinVo joinVo) {
		sqlSession.insert("join.joinInsert", joinVo);		
	}

}
