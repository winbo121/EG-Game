package com.game.login.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.game.login.service.LoginService;
import com.game.login.vo.LoginVo;
import com.game.utill.aes.AES256;
import com.game.utill.json.JsonUtill;

import net.sf.json.JSONObject;

@Controller
public class LoginController extends JsonUtill{

	@Inject
	private LoginService loginService;
	
	private AES256 aes256 = new AES256();
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "info/login";
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject loginCheck(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,LoginVo loginVo) throws Exception {

		loginVo.setPassword(aes256.encrypt(loginVo.getPassword()));
		
		LoginVo loginCheck = loginService.loginCheck(loginVo);
		
		String returnData;
		
		HttpSession session = null;
		
		if(ObjectUtils.isEmpty(loginCheck)) {
			returnData = "noUid";
		}else if(loginCheck.getPwCheck().equals("NO")) {
			returnData = "noPwd";
		}else {
			session = request.getSession();
			session.removeAttribute("session"); // 기본 세션 삭제
			session.setAttribute("session", loginCheck);
			session.setMaxInactiveInterval(60 * 180); //세션시간 3시간
			returnData = "successLogin";
		}
		
		return super.jsonView(returnData);
	}
	
	@RequestMapping(value = "/loginOut", method = RequestMethod.GET)
	public String loginOut(HttpSession session) {
		session.invalidate();
		return "main/home";
	}
	
	
	@RequestMapping(value = "/idFind", method = RequestMethod.GET)
	public String idFind(Locale locale, Model model) {
		return "info/id_find";
	}
	@RequestMapping(value = "/pwFind", method = RequestMethod.GET)
	public String pwFind(Locale locale, Model model) {
		return "info/pw_find";
	}
	@RequestMapping(value = "/resetPw", method = RequestMethod.GET)
	public String resetPw(Locale locale, Model model) {
		return "info/reset_pw";
	}
}
