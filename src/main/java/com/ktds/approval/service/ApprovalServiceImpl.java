package com.ktds.approval.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.approval.biz.ApprovalBiz;
import com.ktds.approval.vo.ApprovalVO;
import com.ktds.member.biz.MemberBiz;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private ApprovalBiz ApprovalBiz;
	
	@Autowired
	private MemberBiz memberBiz;

	@Override
	public String findApprovalKeyByEmail(String email) {
		return this.ApprovalBiz.selectApprovalKeyByEmail(email);
	}

	@Override
	public boolean changeApprovalStatus(String email) {
		return this.memberBiz.changeApprovalStatus(email);
	}

	@Override
	public boolean deleteApprovalKey(ApprovalVO approvalVO) {
		return this.ApprovalBiz.deleteApprovalKey(approvalVO) > 0;
	}

}
