package com.game.main.contoller;


import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.game.main.service.MainService;
import com.game.utill.kakaoAuth.KakaoLoginApi;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	@Inject
	private MainService mainService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	private KakaoLoginApi kakaoLoginApi = new KakaoLoginApi();
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loading(Locale locale, Model model) {	
		logger.debug("!!!!!!!!!!!FirstStart WebSite!!!!!!!!!!!");
		return "index";
	}
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model , HttpSession session) {
		
		
		String kakaoLoginUrl = kakaoLoginApi.kakaoGetAuthorizationUrl(session);
		
		List<Map<String,Object>> mainAdminBoardList = mainService.mainAdminBoardList();
		List<Map<String,Object>> mainCenterBoardList = mainService.mainCenterBoardList();
		List<Map<String,Object>> mainUserBoardList = mainService.mainUserBoardList();
		
		model.addAttribute("mainAdminBoardList", mainAdminBoardList);
		model.addAttribute("mainCenterBoardList", mainCenterBoardList);
		model.addAttribute("mainUserBoardList", mainUserBoardList);
		model.addAttribute("kakaoLoginUrl", kakaoLoginUrl);
		
		return "main/home";
	}
	
	@RequestMapping(value = "/company", method = RequestMethod.GET)
	public String company(Locale locale, Model model) {
	
		
		return "sub/company";
	}
	
	
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public String header(Locale locale, Model model) {
	
		
		return "layout/header";
	}
	
	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public String footer(Locale locale, Model model) {
	
		
		return "layout/footer";
	}
	
	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public String chatting(Locale locale, Model model) {
	
		
		return "main/chatting";
	}
	
	@RequestMapping(value = "/footer_btn", method = RequestMethod.GET)
	public String footer_btn(Locale locale, Model model) {
	
		
		return "main/footer_btn";
	}
	
}
