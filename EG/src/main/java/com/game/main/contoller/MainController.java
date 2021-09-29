package com.game.main.contoller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.game.adminBoard.service.AdminBoardService;
import com.game.main.service.MainService;

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
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<Map<String,Object>> mainAdminBoardList = mainService.mainAdminBoardList();
		List<Map<String,Object>> mainCenterBoardList = mainService.mainCenterBoardList();
		List<Map<String,Object>> mainUserBoardList = mainService.mainUserBoardList();
		
		model.addAttribute("mainAdminBoardList", mainAdminBoardList);
		model.addAttribute("mainCenterBoardList", mainCenterBoardList);
		model.addAttribute("mainUserBoardList", mainUserBoardList);
		
		
		return "main/home";
	}
	
	@RequestMapping(value = "/bricks", method = RequestMethod.GET)
	public String bricks(Locale locale, Model model) {
	
		
		return "game/bricks";
	}
	
	@RequestMapping(value = "/snake", method = RequestMethod.GET)
	public String snake(Locale locale, Model model) {
	
		
		return "game/snake";
	}
	
	@RequestMapping(value = "/flappyBird", method = RequestMethod.GET)
	public String flappyBird(Locale locale, Model model) {
	
		
		return "game/flappy_bird";
	}
	
	@RequestMapping(value = "/dodge", method = RequestMethod.GET)
	public String dodge(Locale locale, Model model) {
	
		
		return "game/dodge";
	}
	
	@RequestMapping(value = "/starEating", method = RequestMethod.GET)
	public String startEating(Locale locale, Model model) {
	
		
		return "game/star_eating";
	}
	
	@RequestMapping(value = "/invaders", method = RequestMethod.GET)
	public String invaders(Locale locale, Model model) {
	
		
		return "game/invaders";
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
