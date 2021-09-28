package com.game.adminBoard.controller;

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

import com.game.adminBoard.service.AdminBoardService;
import com.game.adminBoard.vo.AdminBoardVo;

import com.game.utill.file.FileUtill;
import com.game.utill.json.JsonUtill;

import net.sf.json.JSONObject;


@Controller
public class AdminBoardController extends JsonUtill{

	
	@Inject
	private AdminBoardService adminBoardService;
	
	
	private FileUtill fileUtill =new FileUtill();
	
	@RequestMapping(value = "/adminBoardList", method = RequestMethod.GET)
	public String userBoardList(Locale locale, Model model,@ModelAttribute AdminBoardVo vo) {
		
		List<Map<String,Object>> list =adminBoardService.adminBoardList(vo);
		Integer list_cnt = adminBoardService.adminBoardListCnt(vo);
		
			
		vo.setTotalCount(list_cnt);
		
		model.addAttribute("list", list);
		model.addAttribute("vo",vo);
		
		return "sub/free_board";
	}
	
	@RequestMapping(value = "/adminBoardInsertPro", method = RequestMethod.GET)
	public String userBoardInsertPro(Locale locale, Model model) {
		
		return "sub/write";
	}
	
	@RequestMapping(value = "/adminBoardInsert", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject userBoardInsert(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,AdminBoardVo vo) throws IOException {
		
		String realFileName = fileUtill.fileUploadMethod(request);

		vo.setFile(realFileName);
		
		adminBoardService.adminBoardInsert(vo);
	
		return super.jsonView("Success");
	}
	

	
	@RequestMapping(value = "/adminBoardRead", method = RequestMethod.GET)
	public String userBoardRead(Locale locale, Model model,@ModelAttribute AdminBoardVo vo) {
		
		AdminBoardVo userBoard=adminBoardService.adminBoardRead(vo.getBoard_num());
		adminBoardService.adminBoardReadCnt(vo.getBoard_num());
		model.addAttribute("userBoard",userBoard);
		model.addAttribute("vo",vo);
		return "sub/update";
	}
	
	@RequestMapping(value = "/adminBoardUpdate", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject userBoardUpdate(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,AdminBoardVo adminBoard) throws IOException {
		
		

		
		String realFileName = fileUtill.fileUpdateMethod(request,adminBoard.getFile());

		adminBoard.setFile(realFileName);

		adminBoardService.adminBoardUpdate(adminBoard);
		
		return super.jsonView("Success");
	}
	
	@RequestMapping(value = "/adminBoardDelete", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject userBoardDelete(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,AdminBoardVo adminBoard) throws IOException {
		
		
		adminBoardService.adminBoardDelete(adminBoard.getBoard_num());
		
		fileUtill.fileDeleteMethod(request,adminBoard.getFile());
		
		return super.jsonView("Success");
	}
}
