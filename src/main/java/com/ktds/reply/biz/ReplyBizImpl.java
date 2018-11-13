package com.ktds.reply.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ktds.reply.dao.ReplyDao;
import com.ktds.reply.vo.ReplyVO;

@Component
public class ReplyBizImpl implements ReplyBiz {

	@Autowired
	private ReplyDao replyDao;

	@Override
	public int insertReply(ReplyVO replyVO) {
		return this.replyDao.insertReply(replyVO);
	}

	@Override
	public List<ReplyVO> selectReplyList(String qnaId) {
		return this.replyDao.selectReplyList(qnaId);
	}

	@Override
	public int updateReply(ReplyVO replyVO) {
		return this.replyDao.updateReply(replyVO);
	}
	
	
}
