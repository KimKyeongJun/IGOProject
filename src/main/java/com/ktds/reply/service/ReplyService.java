package com.ktds.reply.service;

import com.ktds.reply.vo.ReplyVO;

public interface ReplyService {
	
	public boolean writeReply(ReplyVO replyVO);
	
	public boolean modifyReply(ReplyVO replyVO);

}
