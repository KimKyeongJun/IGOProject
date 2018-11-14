package com.ktds.approval.dao;

import com.ktds.approval.vo.ApprovalVO;

public interface ApprovalDao {

	public int insertApprovalKey(ApprovalVO approvalVO);
	
	public String selectApprovalKeyByEmail(String email);
	
	public int deleteApprovalKey(ApprovalVO approvalVO);
}
