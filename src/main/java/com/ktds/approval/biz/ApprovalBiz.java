package com.ktds.approval.biz;

import com.ktds.approval.vo.ApprovalVO;

public interface ApprovalBiz {
	
	public int insertApprovalKey(ApprovalVO approvalVO);
	
	public String selectApprovalKeyByEmail(String email);
	
	public int deleteApprovalKey(ApprovalVO approvalVO);

}
