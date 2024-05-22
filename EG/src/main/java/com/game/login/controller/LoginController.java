package com.game.login.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String ranking(Locale locale, Model model) {
		return "info/login";
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
