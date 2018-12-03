package com.ktds.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.notice.biz.NoticeBiz;
import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeBiz noticeBiz;
	
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
	public boolean updateOneNoticeViewCount(String noticeId) {
		return this.noticeBiz.updateOneNoticeViewCount(noticeId);
	}

}
	