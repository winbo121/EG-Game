package com.game.userBoard.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	@ResponseBody
	public JSONObject userBoardInsert(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,@ModelAttribute UserBoardVo vo) throws IOException {
		String realFileName="";

		MultipartHttpServletRequest M=(MultipartHttpServletRequest)request;
		Iterator<String> fileNames = M.getFileNames();
		File file=null;
		while(fileNames.hasNext()) {
			String fileName=fileNames.next();
			
			MultipartFile mFile =  M.getFile(fileName);
			
			
			realFileName=UUID.randomUUID().toString()+mFile.getOriginalFilename();
			
			file =new File(request.getRealPath("WEB-INF/upload/" +realFileName));
			
			if(mFile.getSize()!=0) {
				
				file.createNewFile();
				mFile.transferTo(file);
							
			}
			
		}
		vo.setFile(realFileName);
		
		userBoardService.userBoardInsert(vo);
		
		
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
