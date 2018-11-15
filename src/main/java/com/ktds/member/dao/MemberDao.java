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
	
<<<<<<< HEAD
	public MemberVO findMemberEmail(MemberVO memberVO);
=======
	public int updateMemberUpdate(MemberVO memberVO);
>>>>>>> 5d779e9e41220af20749af8923fc20aff0ceb1af
	
}
