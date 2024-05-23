package com.game.join.controller;

import java.io.IOException;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.game.join.service.JoinService;
import com.game.join.vo.JoinVo;
import com.game.userBoard.vo.UserBoardVo;
import com.game.utill.file.FileUtill;
import com.game.utill.json.JsonUtill;

import net.sf.json.JSONObject;

@Controller
public class JoinController extends JsonUtill{
	
	@Inject
	private JoinService joinService;
	
	
	private FileUtill fileUtill =new FileUtill();
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		return "info/join";
	}
	
	
	@RequestMapping(value = "/joinIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject joinIdCheck(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,JoinVo joinVo) throws IOException {
		
		System.out.println("uid -> "+joinVo.getUid());
		
		Integer joinIdCheck = joinService.joinIdCheck(joinVo);
		
		System.out.println("joinIdCheck -> "+joinIdCheck);
		
		String SuccessOrNot;
		
		if(joinIdCheck > 0) {
			SuccessOrNot = "Fail";
		}else {
			SuccessOrNot = "Success";
		}
		
		return super.jsonView(SuccessOrNot);
	}
	
	
	@RequestMapping(value = "/joinInsert", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject joinInsert(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,JoinVo joinVo) throws IOException {
		
		
		String realFileName = fileUtill.fileUpdateMethod(request,joinVo.getFile());

		joinVo.setFile(realFileName);

		joinService.joinInsert(joinVo);
		
		return super.jsonView("Success");
	}
}
