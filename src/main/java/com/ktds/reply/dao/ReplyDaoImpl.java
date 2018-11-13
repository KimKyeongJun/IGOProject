package com.ktds.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.reply.vo.ReplyVO;

@Repository
public class ReplyDaoImpl extends SqlSessionDaoSupport implements ReplyDao{

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public int insertReply(ReplyVO replyVO) {
		return this.getSqlSession().insert("ReplyDao.insertReply", replyVO);
	}

	@Override
	public List<ReplyVO> selectReplyList(String qnaId) {
		return this.getSqlSession().selectList("ReplyDao.selectReplyList", qnaId);
	}

	@Override
	public int updateReply(ReplyVO replyVO) {
		return this.getSqlSession().update("ReplyDao.updateReply", replyVO);
	}
}
