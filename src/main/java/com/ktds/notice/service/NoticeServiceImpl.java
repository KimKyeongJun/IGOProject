package com.ktds.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.member.biz.MemberBiz;
import com.ktds.member.vo.MemberVO;
import com.ktds.notice.biz.NoticeBiz;
import com.ktds.notice.dao.NoticeDao;
import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;
import com.ktds.qna.biz.QnaBiz;
import com.ktds.qna.vo.QnaSearchVO;
import com.ktds.qna.vo.QnaVO;
import com.ktds.reply.biz.ReplyBiz;
import com.ktds.reply.vo.ReplyVO;

import io.github.seccoding.web.pager.Pager;
import io.github.seccoding.web.pager.PagerFactory;
import io.github.seccoding.web.pager.explorer.ClassicPageExplorer;
import io.github.seccoding.web.pager.explorer.PageExplorer;

@Service
public class NoticeServiceImpl implements NoticeService {

/*	*/
	@Autowired
	private NoticeBiz noticeBiz;
	
	@Autowired
	private ReplyBiz replyBiz;
	
	@Override
	public boolean registOneNotice(NoticeVO noticeVO) {
		return this.noticeBiz.registOneNotice(noticeVO);
	}
	
	@Override
	public NoticeVO readOneNotice(String noticeId) {
		return this.noticeBiz.readOneNotice(noticeId);
	}
	
	@Override
	public PageExplorer readAllNotice(NoticeSearchVO noticeSearchVO) {
		return this.noticeBiz.readAllNotice(noticeSearchVO);
	}
	
	@Override
	public boolean modifyOneNotice(NoticeVO noticeVO) {
		return this.noticeBiz.modifyOneNotice(noticeVO);
	}

	@Override
	public List<ReplyVO> readRepliesByNotice(String noticeId) {
		return this.replyBiz.selectReplyList(noticeId);
	}
	

}
	