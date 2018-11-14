package com.ktds.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.member.vo.MemberVO;

@Repository
public class MemberDaoImpl extends SqlSessionDaoSupport implements MemberDao {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public int insertOneMember(MemberVO memberVO) {
		return getSqlSession().insert("MemberDao.insertOneMember", memberVO);
	}

	@Override
	public MemberVO selectOneMember(MemberVO memberVO) {
		return getSqlSession().selectOne("MemberDao.selectOneMember", memberVO);
	}

	@Override
	public String selectSaltById(String email) {
		return getSqlSession().selectOne("MemberDao.selectSaltById", email);
	}

	@Override
	public int selectOneEmail(String email) {
		return getSqlSession().selectOne("MemberDao.selectOneEmail", email);
	}

	@Override
	public Integer isBlockUser(String email) {
		return getSqlSession().selectOne("MemberDao.isBlockUser", email);
	}

	@Override
	public int unblockUser(String email) {
		return getSqlSession().update("MemberDao.unblockUser", email);
	}

	@Override
	public int increaseLoginFailCount(String email) {
		return getSqlSession().update("MemberDao.increaseLoginFailCount", email);
	}

	@Override
	public int updateApprovalStatus(String email) {
		return this.getSqlSession().update("MemberDao.updateApprovalStatus", email);
	}

	@Override
	public MemberVO findMemberEmail(MemberVO memberVO) {
		return this.getSqlSession().selectOne("MemberDao.findMemberEmail", memberVO);
	}
	
}
