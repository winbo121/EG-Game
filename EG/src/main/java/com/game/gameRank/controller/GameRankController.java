package com.game.gameRank.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GameRankController {

	
	@RequestMapping(value = "/ranking", method = RequestMethod.GET)
	public String ranking(Locale locale, Model model) {
		return "game_ranking/ranking";
	}
	
}
