package com.game.main.contoller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
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
