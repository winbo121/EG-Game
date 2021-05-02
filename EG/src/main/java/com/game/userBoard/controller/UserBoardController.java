package com.game.userBoard.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserBoardController {
	
	
	
	@RequestMapping(value = "/userBoardList", method = RequestMethod.GET)
	public String userBoardList(Locale locale, Model model) {
	
		System.out.println("@@@@@@@@@@@@@@@@@@");
		return "sub/free_board";
	}

}
