package com.game.userBoard.controller;


import java.io.IOException;


import java.util.List;
import java.util.Locale;
import java.util.Map;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;


import com.game.userBoard.service.UserBoardService;
import com.game.userBoard.vo.UserBoardVo;
import com.game.utill.file.FileUtill;
import com.game.utill.json.JsonUtill;

import net.sf.json.JSONObject;

@Controller
public class UserBoardController extends JsonUtill{
	
	@Inject
	private UserBoardService userBoardService;
	
	private FileUtill fileUtill =new FileUtill();
	
	@RequestMapping(value = "/userBoardList", method = RequestMethod.GET)
	public String userBoardList(Locale locale, Model model,@ModelAttribute UserBoardVo vo) {
		
		List<Map<String,Object>> list =userBoardService.userBoardList(vo);
		Integer list_cnt = userBoardService.userBoardListCnt(vo);
		
			
		vo.setTotalCount(list_cnt);
		
		model.addAttribute("list", list);
		model.addAttribute("vo",vo);
		
		return "sub/free_board";
	}
	
	@RequestMapping(value = "/userBoardInsertPro", method = RequestMethod.GET)
	public String userBoardInsertPro(Locale locale, Model model) {
		
		return "sub/write";
	}
	
	@RequestMapping(value = "/userBoardInsert", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject userBoardInsert(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,UserBoardVo vo) throws IOException {
		
		String realFileName = fileUtill.fileUploadMethod(request);

		vo.setFile(realFileName);
		
		userBoardService.userBoardInsert(vo);
	
		return super.jsonView("Success");
	}
	

	
	@RequestMapping(value = "/userBoardRead", method = RequestMethod.GET)
	public String userBoardRead(Locale locale, Model model,@ModelAttribute UserBoardVo vo) {
		
		UserBoardVo userBoard=userBoardService.UserBoardRead(vo.getBoard_num());

		model.addAttribute("userBoard",userBoard);
		model.addAttribute("vo",vo);
		return "sub/update";
	}
	
	@RequestMapping(value = "/userBoardUpdate", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject userBoardUpdate(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,UserBoardVo userBoard) throws IOException {
		
		

		
		String realFileName = fileUtill.fileUpdateMethod(request,userBoard);

		userBoard.setFile(realFileName);

		userBoardService.userBoardUpdate(userBoard);
		
		return super.jsonView("Success");
	}
	
	@RequestMapping(value = "/userBoardDelete", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject userBoardDelete(Locale locale, Model model) {
		
		return super.jsonView("Success");
	}
	

}
