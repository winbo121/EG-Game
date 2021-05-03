package com.game.userBoard.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.json.utill.JsonUtill;

import net.sf.json.JSONObject;

@Controller
public class UserBoardController extends JsonUtill{
	
	
	
	@RequestMapping(value = "/userBoardList", method = RequestMethod.GET)
	public String userBoardList(Locale locale, Model model) {
	
		return "sub/free_board";
	}
	
	@RequestMapping(value = "/userBoardInsert", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject userBoardInsert(Locale locale, Model model) {
	
		return super.jsonView("Success");
	}
	
	@RequestMapping(value = "/userBoardRead", method = RequestMethod.GET)
	public String userBoardRead(Locale locale, Model model) {
	
		return "sub/free_board";
	}
	@RequestMapping(value = "/userBoardUpdate", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject userBoardUpdate(Locale locale, Model model) {
	
		return super.jsonView("Success");
	}
	
	@RequestMapping(value = "/userBoardDelete", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject userBoardDelete(Locale locale, Model model) {
		
		return super.jsonView("Success");
	}
	
}
