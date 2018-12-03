package com.ktds.notice.web;

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

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	@GetMapping("/notice/write")
	public String viewWritePage() {
		return "notice/write";
	}
	
	@PostMapping("/notice/write")
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

	@RequestMapping("/notice")
	public ModelAndView viewNoticeListPage(@ModelAttribute NoticeSearchVO noticeSearchVO, HttpServletRequest request
			, HttpSession session) {
				if ( noticeSearchVO.getSearchKeyword() == null ) {
					noticeSearchVO = (NoticeSearchVO) session.getAttribute(Session.NOTICESEARCH);
					if ( noticeSearchVO == null ) {
						noticeSearchVO = new NoticeSearchVO();
						noticeSearchVO.setPageNo(0);
					}
				}
				
				PageExplorer pageExplorer = this.noticeService.readAllNotice(noticeSearchVO);
				
				session.setAttribute(Session.NOTICESEARCH, noticeSearchVO);
				
				ModelAndView view = new ModelAndView("notice/notice");
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
	
	@GetMapping("/notice/updateviewcount/{noticeId}")
	public String doUpdateOneNoticeViewCountAction(@PathVariable String noticeId) {
		boolean isUpdate = this.noticeService.updateOneNoticeViewCount(noticeId);
		return "redirect:/notice/detail/"+noticeId;
	}
	
	@GetMapping("/notice/detail/{noticeId}")
	public ModelAndView viewNoticeDetailPage(@PathVariable String noticeId) {
		ModelAndView view = new ModelAndView("notice/detail");
		NoticeVO noticeVO = this.noticeService.readOneNotice(noticeId);
		
		view.addObject("noticeVO", noticeVO);
		return view;
	}
	
	@GetMapping("/notice/modify/{noticeId}")
	public ModelAndView viewOneNoticeModifyPage(@PathVariable String noticeId) {
		ModelAndView view = new ModelAndView("notice/modify");
		NoticeVO noticeVO = noticeService.readOneNotice(noticeId);
		view.addObject("noticeVO", noticeVO);
		return view;
	}
	
	@PostMapping("/notice/modify")
	@ResponseBody
	public boolean doOneNoticeModifyAction(NoticeVO noticeVO, @SessionAttribute(Session.TOKEN) String token) {
		boolean isModify = false;
		if ( token.equals(noticeVO.getToken()) ){
			isModify = this.noticeService.modifyOneNotice(noticeVO);	
		}
		System.out.println("!!!!!!!!!!!!!!!!!"+isModify);
		return isModify;
	}
	
}