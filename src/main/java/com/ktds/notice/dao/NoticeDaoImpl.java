package com.ktds.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;
import com.ktds.qna.dao.QnaDao;

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

	/*
	@Override
	public int updateNotice(NoticeVO noticeVO) {
		return this.getSqlSession().update("NoticeDao.updateNotice", noticeVO);
	}
	*/

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

}

/*
package com.ktds.notice.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ktds.notice.vo.NoticeSearchVO;
import com.ktds.notice.vo.NoticeVO;
import com.ktds.common.dao.support.BindData;
import com.ktds.member.vo.MemberVO;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	// Inner Class (Interface)
	private interface Query {
		int INSERT = 0;
		int SELECT_ONE = 1;
		int DELETE_ONE = 2;
		int SELECT_ALL = 3;
	}
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Resource(name="noticeQueries")
	private List<String> noticeQueries;
	
	@Override
	public int insertNotice( NoticeVO noticeVO ) {
		return this.jdbcTemplate.update(
				this.noticeQueries.get(Query.INSERT)
				, noticeVO.getTitle()
				, noticeVO.getContent()
				, noticeVO.getRegDate()
				, noticeVO.getViewCount()
				, noticeVO.getEmail());
	}

	@Override
	public int updateNotice( NoticeVO noticeVO ) {
		System.out.println("Call updateNotice();");
		return 0;
	}

	@Override
	public NoticeVO selectOneNotice(String noticeId) {
		return this.jdbcTemplate.queryForObject(this.noticeQueries.get(Query.SELECT_ONE)
						, new Object[] {noticeId}
						, new RowMapper<NoticeVO>() {

							@Override
							public NoticeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
								MemberVO memberVO = BindData.bindData(rs, new MemberVO());
								NoticeVO noticeVO = BindData.bindData(rs, new NoticeVO());
								noticeVO.setMemberVO(memberVO);
								return noticeVO;
							}
							
						});
	}

	@Override
	public int deleteOneNotice(String noticeId) {
		return this.jdbcTemplate.update(this.noticeQueries.get(Query.DELETE_ONE), noticeId);
	}

	@Override
	public List<NoticeVO> selectAllNotices( NoticeSearchVO noticeSearchVO ) {
		return this.jdbcTemplate.query(this.noticeQueries.get(Query.SELECT_ALL), new RowMapper<NoticeVO>() {
			@Override
			public NoticeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				MemberVO memberVO = BindData.bindData(rs, new MemberVO());
				NoticeVO noticeVO = BindData.bindData(rs, new NoticeVO());
				noticeVO.setMemberVO(memberVO);
				return noticeVO;
			}
		});
	}

	@Override
	public int selectAllNoticesCount(NoticeSearchVO noticeSearchVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
*/