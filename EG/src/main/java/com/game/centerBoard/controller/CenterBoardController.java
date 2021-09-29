package com.game.centerBoard.controller;

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

import com.game.centerBoard.service.CenterBoardService;
import com.game.centerBoard.vo.CenterBoardVo;

import com.game.utill.file.FileUtill;
import com.game.utill.json.JsonUtill;

import net.sf.json.JSONObject;


@Controller
public class CenterBoardController extends JsonUtill{

	@Inject
	private CenterBoardService centerBoardService;
	
	private FileUtill fileUtill =new FileUtill();
	
	@RequestMapping(value = "/centerBoardList", method = RequestMethod.GET)
	public String centerBoardList(Locale locale, Model model,@ModelAttribute CenterBoardVo vo) {
		
		List<Map<String,Object>> list =centerBoardService.centerBoardList(vo);
		Integer list_cnt = centerBoardService.centerBoardListCnt(vo);
		
		
		//세션으로 아이디 가져오기
		vo.setUser_id("winbo121");
		Integer answering_cnt = centerBoardService.centerBoardAnsweringListCnt(vo);
		Integer answer_cnt = centerBoardService.centerBoardAnswerListCnt(vo);
			
		vo.setTotalCount(list_cnt);
		
		model.addAttribute("answering_cnt", answering_cnt);
		model.addAttribute("answer_cnt", answer_cnt);
		model.addAttribute("list", list);
		model.addAttribute("vo",vo);
		
		return "sub/help";
	}
	
	@RequestMapping(value = "/centerBoardInsertPro", method = RequestMethod.GET)
	public String centerBoardInsertPro(Locale locale, Model model) {
		return "sub/question/question";
	}
	
	
	@RequestMapping(value = "/centerBoardAnsweringList", method = RequestMethod.GET)
	public String centerBoardAnsweringList(Locale locale, Model model, CenterBoardVo vo) {
		
		
		//세션으로 아이디 가져오기
		vo.setUser_id("winbo121");
		
		List<Map<String,Object>> list =centerBoardService.centerBoardAnsweringList(vo);
		
		model.addAttribute("answeringList", list);
		
		return "sub/question/help_answering";
	}
	
	@RequestMapping(value = "/centerBoardAnswerList", method = RequestMethod.GET)
	public String centerBoardAnswerList(Locale locale, Model model, CenterBoardVo vo) {
		
		
		//세션으로 아이디 가져오기
		vo.setUser_id("winbo121");
		
		List<Map<String,Object>> list =centerBoardService.centerBoardAnswerList(vo);
		
		model.addAttribute("answerList", list);
		
		return "sub/question/help_answer";
	}
		
	@RequestMapping(value = "/centerBoardInsert", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject centerBoardInsert(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,CenterBoardVo vo) throws IOException {
		
		String realFileName = fileUtill.fileUploadMethod(request);

		vo.setFile(realFileName);
		
		centerBoardService.centerBoardInsert(vo);
	
		return super.jsonView("Success");
	}
	

	
	@RequestMapping(value = "/centerBoardRead", method = RequestMethod.GET)
	public String centerBoardRead(Locale locale, Model model,@ModelAttribute CenterBoardVo vo) {

		CenterBoardVo centerBoard=centerBoardService.centerBoardRead(vo.getBoard_num());
		centerBoardService.centerBoardReadCnt(vo.getBoard_num());
		model.addAttribute("centerBoard",centerBoard);
		
		return "sub/question/question_content";
	}
	
	@RequestMapping(value = "/centerBoardUpdate", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject centerBoardUpdate(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,CenterBoardVo centerBoard) throws IOException {
		
		String realFileName = fileUtill.fileUpdateMethod(request,centerBoard.getFile());

		centerBoard.setFile(realFileName);

		centerBoardService.centerBoardUpdate(centerBoard);
		
		return super.jsonView("Success");
	}
	
	@RequestMapping(value = "/centerBoardDelete", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject centerBoardDelete(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model,CenterBoardVo centerBoard) throws IOException {
		
		
		centerBoardService.centerBoardDelete(centerBoard.getBoard_num());
		
		fileUtill.fileDeleteMethod(request,centerBoard.getFile());
		
		return super.jsonView("Success");
	}
}
