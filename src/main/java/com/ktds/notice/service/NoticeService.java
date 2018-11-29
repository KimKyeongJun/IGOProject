package com.ktds.notice.service;

import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;
import com.ktds.qna.vo.QnaSearchVO;
import com.ktds.qna.vo.QnaVO;
import com.ktds.reply.vo.ReplyVO;

import java.util.List;

import com.ktds.member.vo.MemberVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

public interface NoticeService {
	
public boolean registOneNotice(NoticeVO noticeVO);
	
	public NoticeVO readOneNotice(String noticeId);
	
	public PageExplorer readAllNotice(NoticeSearchVO noticeSearchVO);
	
	public boolean modifyOneNotice(NoticeVO noticeVO);

	public List<ReplyVO> readRepliesByNotice(String noticeId);
	
}

/*
package com.ktds.notice.service;

import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;
import com.ktds.member.vo.MemberVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

public interface NoticeService {
	
	public boolean createNotice( NoticeVO noticeVO, MemberVO memberVO );
	public boolean updateNotice( NoticeVO noticeVO );
	public NoticeVO readOneNotice( int id, MemberVO memberVO );
	public NoticeVO readOneNotice( int id );
	public boolean deleteOneNotice( int id );
	public PageExplorer readAllNotices( NoticeSearchVO noticeSearchVO );
	
}
*/