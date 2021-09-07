package com.game.userBoard.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.userBoard.service.UserBoardService;
import com.game.userBoard.vo.UserBoardVo;
import com.game.utill.json.JsonUtill;

import net.sf.json.JSONObject;

@Controller
public class UserBoardController extends JsonUtill{
	
	@Inject
	private UserBoardService userBoardService;
	
	
	@RequestMapping(value = "/userBoardList", method = RequestMethod.GET)
	public String userBoardList(Locale locale, Model model,@ModelAttribute UserBoardVo vo) {
		
		List<Map<String,Object>> list =userBoardService.userBoardList(vo);
		Integer list_cnt = userBoardService.userBoardListCnt(vo);
		
			
		vo.setTotalCount(list_cnt);
		
		model.addAttribute("list", list);
		model.addAttribute("vo",vo);
		
		return "sub/free_board";
	}
	
	@RequestMapping(value = "/userBoardInserPro", method = RequestMethod.GET)
	public String userBoardInsertPro(Locale locale, Model model,@ModelAttribute UserBoardVo vo) {
		
		return "sub/write";
	}
	
	@RequestMapping(value = "/userBoardInsert", method = RequestMethod.POST)
	public JSONObject userBoardInsert(Locale locale, Model model,@ModelAttribute UserBoardVo vo) {
		
		
		
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
