package com.ktds.approval.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.approval.vo.ApprovalVO;

@Repository
public class ApprovalDaoImpl extends SqlSessionDaoSupport implements ApprovalDao {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public int insertApprovalKey(ApprovalVO approvalVO) {
		return this.getSqlSession().insert("ApprovalDao.insertApprovalKey", approvalVO);
	}

	@Override
	public String selectApprovalKeyByEmail(String email) {
		return this.getSqlSession().selectOne("ApprovalDao.selectApprovalKeyByEmail",  email);
	}

	@Override
	public int deleteApprovalKey(ApprovalVO approvalVO) {
		return this.getSqlSession().delete("ApprovalDao.deleteApprovalKey", approvalVO);
	}
}
