package com.ktds.approval.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ktds.approval.dao.ApprovalDao;
import com.ktds.approval.vo.ApprovalVO;

@Component
public class ApprovalBizImpl implements ApprovalBiz {

	@Autowired
	private ApprovalDao approvalDao;

	@Override
	public int insertApprovalKey(ApprovalVO approvalVO) {
		return this.approvalDao.insertApprovalKey(approvalVO);
	}

	@Override
	public String selectApprovalKeyByEmail(String email) {
		return this.approvalDao.selectApprovalKeyByEmail(email);
	}

	@Override
	public int deleteApprovalKey(ApprovalVO approvalVO) {
		return this.approvalDao.deleteApprovalKey(approvalVO);
	}
}
