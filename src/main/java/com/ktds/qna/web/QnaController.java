package com.ktds.qna.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.common.Session;
import com.ktds.member.vo.MemberVO;
import com.ktds.qna.service.QnaService;
import com.ktds.qna.vo.QnaSearchVO;
import com.ktds.qna.vo.QnaVO;
import com.ktds.reply.vo.ReplyVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/index")
	public String viewMainPage() {
		return "common/index";
	}
	
	@GetMapping("/qna/regist")
	public String viewRegistPage() {
		return "qna/regist";
	}
	
	@PostMapping("/qna/regist")
	@ResponseBody
	public boolean doOneQnaRegistAction(@ModelAttribute QnaVO qnaVO, HttpSession session) {
		
		String sessionToken = (String) session.getAttribute(Session.TOKEN);
		if(!qnaVO.getToken().equalsIgnoreCase(sessionToken)) {
			throw new RuntimeException("");
		}
		
		MemberVO memberVO = (MemberVO) session.getAttribute(Session.USER);
		qnaVO.setEmail(memberVO.getEmail());
		boolean isRegist = this.qnaService.registOneQna(qnaVO);
		System.out.println("QnaController" + qnaVO.getContent());
		return isRegist;
	}
	
	@RequestMapping("/qna")
	public ModelAndView viewQnaListPage(@ModelAttribute QnaSearchVO qnaSearchVO, HttpServletRequest request
			, HttpSession session) {
				if ( qnaSearchVO.getSearchKeyword() == null ) {
					qnaSearchVO = (QnaSearchVO) session.getAttribute(Session.QNASEARCH);
					if ( qnaSearchVO == null ) {
						qnaSearchVO = new QnaSearchVO();
						qnaSearchVO.setPageNo(0);
					}
				}
				
				PageExplorer pageExplorer = this.qnaService.readAllQna(qnaSearchVO);
				
				session.setAttribute(Session.QNASEARCH, qnaSearchVO);
				
				ModelAndView view = new ModelAndView("qna/list");
				view.addObject("qnaList", pageExplorer.getList());
				view.addObject("pagenation", pageExplorer.make());
				view.addObject("qnaSearchVO", qnaSearchVO);
				return view;
	}
	
	@RequestMapping("/qna/init")
	public String viewBoardListPageForInitiate(HttpSession session) {
		session.removeAttribute(Session.QNASEARCH);
		return "redirect:/qna";
	}
	
	@GetMapping("/qna/detail/{qnaId}")
	public ModelAndView viewQnaDetailPage(@PathVariable String qnaId) {
		ModelAndView view = new ModelAndView("qna/detail");
		QnaVO qnaVO = this.qnaService.readOneQna(qnaId);
		
		List<ReplyVO> replyList = this.qnaService.readRepliesByQna(qnaId);
		
		view.addObject("qnaVO", qnaVO);
		view.addObject("replyList", replyList);
		return view;
	}
	
	@GetMapping("/qna/modify/{qnaId}")
	public ModelAndView viewOneQnaModifyPage(@PathVariable String qnaId) {
		ModelAndView view = new ModelAndView("qna/modify");
		QnaVO qnaVO = qnaService.readOneQna(qnaId);
		view.addObject("qnaVO", qnaVO);
		return view;
	}
	
	@PostMapping("/qna/modify")
	@ResponseBody
	public boolean doOneQnaModifyAction(QnaVO qnaVO) {
		boolean isModify = this.qnaService.modifyOneQna(qnaVO);
		return isModify;
	}
	
}
