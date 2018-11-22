package com.ktds.notice.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.common.Session;
import com.ktds.common.web.DownloadUtil;
import com.ktds.member.service.MemberService;
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
	private String uploadPath;
	
	@RequestMapping("/board/notice")
	public ModelAndView viewNoticeListPage( 
			@ModelAttribute NoticeSearchVO noticeSearchVO 
			, HttpServletRequest request ) {
		PageExplorer pageExplorer = this.noticeService.readAllNotices(noticeSearchVO);
		
		
		ModelAndView view = new ModelAndView("board/notice");
		view.addObject("noticeList", pageExplorer.getList());
		view.addObject("pagenation", pageExplorer.make());
		return view;
	}
	
	// Spring 4.2 이하에서 사용
	// @RequestMapping(value="/write", method=RequestMethod.GET)
	// Spring 4.3 이상에서 사용
	
/*	@GetMapping("/board/notice")
	public String viewNoticePage() {
		return "board/notice";
	}*/
	
	@GetMapping("/board/write")
	public String viewNoticeWritePage() {
		return "board/write";
	}
	
	@GetMapping("/board/modify")
	public String viewNoticemodifyPage() {
		return "board/modify";
	}
	
	@GetMapping("/board/detail")
	public String viewNoticedetailPage() {
		return "board/detail";
	}
	
	@PostMapping("/board/write")
	public ModelAndView doNoticeWriteAction( 
			 @ModelAttribute NoticeVO noticeVO
			, @SessionAttribute(name="_USER_") MemberVO memberVO
			, HttpServletRequest request) {

		ModelAndView view = new ModelAndView("redirect:/board/notice");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@::" + noticeVO.getTitle() );
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!::" + noticeVO.getContent());
		
		noticeVO.setEmail(memberVO.getEmail());
		/*if ( errors.hasErrors() ) {			
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!aaaaa");
			view.setViewName("board/write");
			view.addObject("noticeVO", noticeVO);
			return view;
		}*/
		
		/*MultipartFile uploadFile = noticeVO.getFile();
		
		if ( !uploadFile.isEmpty() ) {

			
			File uploadDir = new File(this.uploadPath);
			if ( !uploadDir.exists() ) {
				uploadDir.mkdirs();
			}
			
			File destFile = new File(this.uploadPath);
			
			try {
				uploadFile.transferTo(destFile);

			} catch (IllegalStateException | IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}

		}
		*/
		
		/*noticeVO.setMemberVO(memberVO);
		noticeVO.setEmail(memberVO.getEmail());*/
		
//		(condition) ? true : false; <- 삼항연산자(Elvis Operator), 변환 과정이 있어서 if-else에 비해 느림
//		String view = this.boardService.createBoard(boardVO, memberVO) ? "redirect:/board/list" : "redirect:/board/write";
		
		boolean isSuccess = noticeService.createNotice(noticeVO);
		
		
		return view;
	}
	/*
	@RequestMapping("/board/detail/{noticeid}")
	public ModelAndView viewNoticedetailPage( 
			@PathVariable String noticeid 
			, @SessionAttribute(name="_USER_") MemberVO memberVO 
			, HttpServletRequest request
			) {
		
		ModelAndView view = new ModelAndView("redirect:/board/notice");
		NoticeVO noticeVO = null;
		
		noticeVO = this.noticeService.readOneNotice(noticeid);
       if ( noticeVO == null ) {
			return new ModelAndView("redirect:/board/notice");
		}
	    return view;
	*/
	
	@GetMapping("/notice/detail/{qnaId}")
	public ModelAndView viewNoticeDetailPage(@PathVariable String noticeId) {
		ModelAndView view = new ModelAndView("board/detail");
		NoticeVO noticeVO = this.noticeService.readOneNotice(noticeId);
		
		view.addObject("noticeVO", noticeVO);
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
	   

        
		/*ModelAndView view = new ModelAndView("board/detail");
		view.addObject("noticeVO", noticeVO);
		
		String paramFormat = "IP:%s, Param:%s, Result:%s";
		paramLogger.debug( String.format(paramFormat
				, request.getRemoteAddr()
				, id
				, noticeVO.getNoticeId() + " , "
				+ noticeVO.getTitle() + " , "
				+ noticeVO.getContent() + " , "
				+ noticeVO.getEmail() + " , " 
				+ noticeVO.getRegDate() + " , " 
				+ noticeVO.getViewCount() + " , " 
				));
		
		return view;
		*/
	
	
	/*@RequestMapping("/board/download/{id}")
	public void fileDownload(
			@PathVariable String id
			, HttpServletRequest request
			, HttpServletResponse response
			, @SessionAttribute("_USER_") MemberVO memberVO
			) {
		
		NoticeVO noticeVO = this.noticeService.readOneNotice(id);
		
		
		// File.separator : windows - '\' , Unix/Linux/macos - '/'
		try {
			new DownloadUtil(this.uploadPath + File.separator + fileName).download(request, response, originFileName);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		
	}
	*/

