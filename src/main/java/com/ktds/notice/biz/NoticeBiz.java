package com.ktds.notice.biz;

import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;
import com.ktds.qna.vo.QnaSearchVO;
import com.ktds.qna.vo.QnaVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

public interface NoticeBiz {

	public boolean registOneNotice(NoticeVO noticeVO);
	
	public NoticeVO readOneNotice(String noticeId);
	
	public PageExplorer readAllNotice(NoticeSearchVO noticeSearchVO);
	
	
	public boolean modifyOneNotice(NoticeVO noticeVO);

}
