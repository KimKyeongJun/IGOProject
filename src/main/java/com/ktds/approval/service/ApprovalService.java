package com.ktds.approval.service;

import com.ktds.approval.vo.ApprovalVO;

public interface ApprovalService {
	
	public String findApprovalKeyByEmail (String email);
	
	public boolean changeApprovalStatus (String email);
	
	public boolean deleteApprovalKey (ApprovalVO approvalVO);
}
