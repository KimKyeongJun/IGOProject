package com.ktds.member.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ktds.common.util.SHA256Util;
import com.ktds.member.dao.MemberDao;
import com.ktds.member.vo.MemberVO;

@Component
public class MemberBizImpl implements MemberBiz{

	@Autowired
	private MemberDao memberDao;
	
	private String getHashedPassword(String salt, String password){
		return SHA256Util.getEncrypt(password, salt);
	}
	
	@Override
	public boolean registOneMember(MemberVO memberVO) {
		String salt = SHA256Util.generateSalt();
		String password = this.getHashedPassword(salt, memberVO.getPassword());
		memberVO.setPassword(password);
		memberVO.setSalt(salt);
		return memberDao.insertOneMember(memberVO) > 0;
	}

	@Override
	public MemberVO readOneMember(MemberVO memberVO) {
		String salt = this.memberDao.selectSaltById(memberVO.getEmail());
		if ( salt != null ) {
			String password = this.getHashedPassword(salt, memberVO.getPassword());
			memberVO.setPassword(password);
		}
		MemberVO readMemberVO = new MemberVO();
		readMemberVO.setEmail(memberVO.getEmail());
		readMemberVO.setPassword(memberVO.getPassword());
		MemberVO member = memberDao.selectOneMember(readMemberVO);
		return member;
	}

	@Override
	public boolean readOneEmail(String email) {
		return memberDao.selectOneEmail(email) > 0;
	}

	@Override
	public boolean isBlockUser(String email) {
		Integer blockUserAccount = memberDao.isBlockUser(email);
		if (blockUserAccount == null) {
			blockUserAccount = 0;
		}
		return blockUserAccount >= 3;
	}

	@Override
	public boolean increaseLoginFailCount(String email) {
		return memberDao.increaseLoginFailCount(email) > 0;
	}

	@Override
	public boolean unblockUser(String email) {
		return memberDao.unblockUser(email) > 0;
	}

	@Override
	public boolean changeApprovalStatus(String email) {
		return this.memberDao.updateApprovalStatus(email) > 0;
	}
	
	@Override
	public boolean modifyMemberUpdate(MemberVO memberVO) {
		if ( memberVO.getPassword() != null && memberVO.getPassword() != "" ) {
			String salt = SHA256Util.generateSalt();
			String password = this.getHashedPassword(salt, memberVO.getPassword());
			memberVO.setPassword(password);
			memberVO.setSalt(salt);
		}
		else {
			memberVO.setPassword(null);
			memberVO.setSalt(null);
		}
		return this.memberDao.updateMemberUpdate(memberVO) > 0;
	}

	@Override
	public MemberVO findMemberEmail(MemberVO memberVO) {
		return null;
	}

}
