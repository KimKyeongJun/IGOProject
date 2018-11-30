package com.ktds.notice.web;

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
import com.ktds.notice.service.NoticeService;
import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;
import com.ktds.qna.vo.QnaVO;
import com.ktds.reply.vo.ReplyVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	/*
	@GetMapping("/")
	public String viewMainPage() {
		return "common/index";
	}
	*/
	@GetMapping("/board/write")
	public String viewWritePage() {
		return "/board/write";
	}
	
	@PostMapping("/board/write")
	@ResponseBody
	public boolean doOneNoticeRegistAction(@ModelAttribute NoticeVO noticeVO, HttpSession session) {
		
		String sessionToken = (String) session.getAttribute(Session.TOKEN);
		if(!noticeVO.getToken().equalsIgnoreCase(sessionToken)) {
			throw new RuntimeException("");
		}
		
		MemberVO memberVO = (MemberVO) session.getAttribute(Session.USER);
		noticeVO.setEmail(memberVO.getEmail());
		boolean isRegist = this.noticeService.registOneNotice(noticeVO);
		return isRegist;
	}
	
	@RequestMapping("/board/notice")
	public ModelAndView viewNoticeListPage( 
			@ModelAttribute NoticeSearchVO noticeSearchVO 
			, HttpServletRequest request ) {
		PageExplorer pageExplorer = this.noticeService.readAllNotice(noticeSearchVO);
		
		
		ModelAndView view = new ModelAndView("board/notice");
		view.addObject("noticeList", pageExplorer.getList());
		view.addObject("pagenation", pageExplorer.make());
		return view;
	}
	
	/*
	boolean isSuccess = noticeService.registOneNotice(noticeVO);

	return isSuccess;
	
	*/
	
	

	@RequestMapping("/board")
	public ModelAndView viewNoticeListPage(@ModelAttribute NoticeSearchVO noticeSearchVO, HttpServletRequest request
			, HttpSession session) {
				if ( noticeSearchVO.getSearchKeyword() == null ) {
					noticeSearchVO = (NoticeSearchVO) session.getAttribute(Session.QNASEARCH);
					if ( noticeSearchVO == null ) {
						noticeSearchVO = new NoticeSearchVO();
						noticeSearchVO.setPageNo(0);
					}
				}
				
				PageExplorer pageExplorer = this.noticeService.readAllNotice(noticeSearchVO);
				
				session.setAttribute(Session.NOTICESEARCH, noticeSearchVO);
				
				ModelAndView view = new ModelAndView("board/notice");
				view.addObject("noticeList", pageExplorer.getList());
				view.addObject("pagenation", pageExplorer.make());
				view.addObject("noticeSearchVO", noticeSearchVO);
				return view;
	}
	/*
	@RequestMapping("/board/init")
	public String viewBoardListPageForInitiate(HttpSession session) {
		session.removeAttribute(Session.QNASEARCH);
		return "redirect:/board";
	}
	*/
	
	@GetMapping("/board/detail/{noticeId}")
	public ModelAndView viewNoticeDetailPage(@PathVariable String noticeId) {
		ModelAndView view = new ModelAndView("board/detail");
		NoticeVO noticeVO = this.noticeService.readOneNotice(noticeId);
		
		List<ReplyVO> replyList = this.noticeService.readRepliesByNotice(noticeId);
		
		view.addObject("noticeVO", noticeVO);
		view.addObject("replyList", replyList);
		return view;
	}
	
	@GetMapping("/board/modify/{noticeId}")
	public ModelAndView viewOneNoticeModifyPage(@PathVariable String noticeId) {
		ModelAndView view = new ModelAndView("board/modify");
		NoticeVO noticeVO = noticeService.readOneNotice(noticeId);
		view.addObject("noticeVO", noticeVO);
		return view;
	}
	
	@PostMapping("/board/modify")
	@ResponseBody
	public boolean doOneNoticeModifyAction(NoticeVO noticeVO, @SessionAttribute(Session.TOKEN) String token) {
		boolean isModify = false;
		if ( token.equals(noticeVO.getToken()) ){
			isModify = this.noticeService.modifyOneNotice(noticeVO);	
		}
		return isModify;
	}
	
}