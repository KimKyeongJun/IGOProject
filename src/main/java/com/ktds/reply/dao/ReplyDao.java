package com.ktds.reply.dao;

import java.util.List;

import com.ktds.reply.vo.ReplyVO;

public interface ReplyDao {
	
	public int insertReply(ReplyVO replyVO);
	
	public List<ReplyVO> selectReplyList(String qnaId);
	
	public int updateReply(ReplyVO replyVO);
	
	public int deleteReply(String replyId);

}
