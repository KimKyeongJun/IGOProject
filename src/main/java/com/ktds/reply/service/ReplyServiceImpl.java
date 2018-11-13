package com.ktds.reply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.reply.biz.ReplyBiz;
import com.ktds.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyBiz replyBiz;

	@Override
	public boolean writeReply(ReplyVO replyVO) {
		return this.replyBiz.insertReply(replyVO) > 0;
	}

	@Override
	public boolean modifyReply(ReplyVO replyVO) {
		return this.replyBiz.updateReply(replyVO) > 0;
	}

}
