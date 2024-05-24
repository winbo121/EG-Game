package com.game.login.daoImpl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.game.login.dao.LoginDao;
import com.game.login.vo.LoginVo;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Inject
	private SqlSession sqlSession;

	@Override
	public LoginVo loginCheck(LoginVo loginVo) {

		return sqlSession.selectOne("login.loginCheck", loginVo);
	}
	
}
