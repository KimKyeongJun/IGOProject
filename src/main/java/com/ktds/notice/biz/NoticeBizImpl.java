package com.ktds.notice.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ktds.notice.dao.NoticeDao;
import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;

import io.github.seccoding.web.pager.Pager;
import io.github.seccoding.web.pager.PagerFactory;
import io.github.seccoding.web.pager.explorer.ListPageExplorer;
import io.github.seccoding.web.pager.explorer.PageExplorer;

@Component
public class NoticeBizImpl implements NoticeBiz{

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public boolean createNotice(NoticeVO noticeVO) {
		return noticeDao.insertNotice(noticeVO) > 0;
	}

	@Override
	public NoticeVO readOneNotice(String noticeId) {
		return noticeDao.selectOneNotice(noticeId);
	}
	
	@Override
	public boolean deleteOneNotice(String noticeId) {
		return noticeDao.deleteOneNotice(noticeId)>0;
	}

	@Override
	public PageExplorer readAllNotices(NoticeSearchVO noticeSearchVO) {
		int totalCount = this.noticeDao.selectAllNoticesCount(noticeSearchVO); // 게시물의 개수를 count해서 페이지의 수 계산
		Pager pager = PagerFactory.getPager(Pager.ORACLE, noticeSearchVO.getPageNo() + "", 10, 3); // Oracle페이지, 현재 볼 페이지 선택 (몇번부터
																							// 몇번까지의 정보 나옴)
		pager.setTotalArticleCount(totalCount);

		PageExplorer pageExplorer = pager.makePageExplorer(ListPageExplorer.class, noticeSearchVO); // 시작번호와 끝번호가 나옴
		pageExplorer.setList(this.noticeDao.selectAllNotices(noticeSearchVO));
		return pageExplorer;

	}
	/*
	@Override
	public boolean updateNotice(NoticeVO noticeVO) {
		return noticeDao.updateNotice(noticeVO)>0;
		
	}
	*/
	@Override
	public boolean modifyOneNotice(NoticeVO noticeVO) {
		return noticeDao.modifyOneNotice(noticeVO)>0;
	}

}
