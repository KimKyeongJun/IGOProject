package com.ktds.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;

@Repository
public class NoticeDaoImpl extends SqlSessionDaoSupport implements NoticeDao {

	@Autowired	
	@Override
	public void setSqlSessionTemplate( SqlSessionTemplate sqlSessionTemplate ) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int insertOneNotice(NoticeVO noticeVO) {
		return this.getSqlSession().insert("NoticeDao.insertOneNotice", noticeVO);
	}
	

	@Override
	public NoticeVO selectOneNotice(String noticeId) {
		return this.getSqlSession().selectOne("NoticeDao.selectOneNotice", noticeId);
	}

	@Override
	public List<NoticeVO> selectAllNotice( NoticeSearchVO noticeSearchVO ) {
		return this.getSqlSession().selectList("NoticeDao.selectAllNotice", noticeSearchVO);
	}

	@Override
	public int selectAllNoticeCount(NoticeSearchVO noticeSearchVO) {
		return this.getSqlSession().selectOne("NoticeDao.selectAllNoticeCount", noticeSearchVO);
	}

	@Override
	public int updateOneNotice(NoticeVO noticeVO) {
		return getSqlSession().update("NoticeDao.updateOneNotice", noticeVO);
	}
	
	@Override
	public int updateOneNoticeViewCount(String noticeId) {
		return getSqlSession().update("NoticeDao.updateOneNoticeViewCount", noticeId);
	}

}
