package com.game.login.serviceImpl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.game.login.dao.LoginDao;
import com.game.login.service.LoginService;
import com.game.login.vo.LoginVo;

@Service
public class LoginServiceImpl implements LoginService{

	@Inject
	private LoginDao loginDao;

	@Override
	public LoginVo loginCheck(LoginVo loginVo) {
		
		return loginDao.loginCheck(loginVo);
	}
	
}
