package com.game.gamePlay.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GamePlayController {

	
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
}
