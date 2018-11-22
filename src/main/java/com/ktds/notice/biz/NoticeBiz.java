package com.ktds.notice.biz;

import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

public interface NoticeBiz {

	public boolean createNotice( NoticeVO noticeVO);
	
	/*public boolean updateNotice( NoticeVO noticeVO);*/
	
	public boolean deleteOneNotice( String noticeId);
	
	public NoticeVO readOneNotice( String noticeId );
	
	public PageExplorer readAllNotices( NoticeSearchVO NoticeSearchVO );

	public boolean modifyOneNotice(NoticeVO noticeVO);

}
