package com.ktds.member.dao;

import com.ktds.member.vo.MemberVO;

public interface MemberDao {

	public int insertOneMember(MemberVO memberVO);
	
	public MemberVO selectOneMember(MemberVO memberVO);
	
	public String selectSaltById(String email);
	
	public int selectOneEmail(String email);
	
	public Integer isBlockUser(String email);
	
	public int unblockUser(String email);
		
	public int increaseLoginFailCount(String email);
	
	public int updateApprovalStatus(String email);
	
	public MemberVO findMemberEmail(MemberVO memberVO);
	
}
