package com.game.login.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.join.service.JoinService;
import com.game.join.vo.JoinVo;
import com.game.login.service.LoginService;
import com.game.login.vo.LoginVo;
import com.game.utill.aes.AES256;
import com.game.utill.json.JsonUtill;
import com.game.utill.kakaoAuth.KakaoLoginApi;


import net.sf.json.JSONObject;

@Controller
public class LoginController extends JsonUtill{

	@Inject
	private LoginService loginService;
	
	@Inject
	private JoinService joinService;
	
	private AES256 aes256 = new AES256();
	
	private KakaoLoginApi kakaoLoginApi = new KakaoLoginApi();
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "info/login";
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject loginCheck(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,LoginVo loginVo) throws Exception {

		loginVo.setPassword(aes256.encrypt(loginVo.getPassword()));
		
		loginVo.setKakaoCheck("N");
		
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
	
	

    @RequestMapping(value = "/kakaoLoginCallback",method = RequestMethod.GET)
    public String kakaoCallback(HttpServletRequest request, Model model, Locale locale, @RequestParam(value = "code", required = false) String code, HttpSession session)
            throws Exception {


		System.out.println("####code###" + code);
		
		String access_Token = kakaoLoginApi.kakaoGetAccessToken(code);
		System.out.println("###access_Token### : " + access_Token);
        HashMap<String, Object> userInfo =kakaoLoginApi.kakaoGetUserInfo(access_Token);
        System.out.println("###userInfo### : " + userInfo.get("email"));
        System.out.println("###nickname### : " + userInfo.get("nickname"));
        System.out.println("###profile_image### : " + userInfo.get("profile_image"));
        
        String [] uid = userInfo.get("email").toString().split("@");
        
        String kakaoUid = uid[0]+"(Kakao)";
        
        LoginVo loginVo = new LoginVo();
        
        JoinVo joinVo = new JoinVo();
        
        loginVo.setUid(kakaoUid);
        
        loginVo.setKakaoCheck("Y");
        
        LoginVo loginCheck = loginService.loginCheck(loginVo);
        
		if(ObjectUtils.isEmpty(loginCheck)) {			

			joinVo.setUid(kakaoUid);
			
			joinVo.setPw(aes256.encrypt("kakaoInsert"));
			
			joinVo.setEmail(userInfo.get("email").toString());
			
			joinVo.setFile(userInfo.get("profile_image").toString());
			
			joinVo.setTel("1577-3754");
			
			joinVo.setKakaoCheck("Y");

			joinService.joinInsert(joinVo);
		}
		
		session = request.getSession();
		session.removeAttribute("session"); // 기본 세션 삭제
		session.setAttribute("session", loginVo);
		session.setMaxInactiveInterval(60 * 180); //세션시간 3시간

		
		return  "redirect:/main";
    }
	
	@RequestMapping(value = "/loginOut", method = RequestMethod.GET)
	public String loginOut(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
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
