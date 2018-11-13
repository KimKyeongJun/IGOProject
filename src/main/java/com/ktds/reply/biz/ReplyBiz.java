package com.ktds.reply.biz;

import java.util.List;

import com.ktds.reply.vo.ReplyVO;

public interface ReplyBiz {
	
	public int insertReply(ReplyVO replyVO);

	public List<ReplyVO> selectReplyList(String qnaId);
	
	public int updateReply(ReplyVO replyVO);
}
