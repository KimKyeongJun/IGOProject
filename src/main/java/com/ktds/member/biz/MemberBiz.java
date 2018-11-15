package com.ktds.member.biz;

import com.ktds.member.vo.MemberVO;

public interface MemberBiz {

	public boolean registOneMember(MemberVO memberVO);
	
	public MemberVO readOneMember(MemberVO memberVO);
	
	public boolean readOneEmail(String email);
	
	public boolean isBlockUser(String email);
	
	public boolean increaseLoginFailCount(String email);
	
	public boolean unblockUser(String email);
	
	public boolean changeApprovalStatus (String email);
	
	public boolean modifyMemberUpdate(MemberVO memberVO);
	
	public MemberVO findMemberEmail(MemberVO memberVO);
	
	public boolean findMember(MemberVO memberVO);
	
	public boolean changeMemberPw(MemberVO memberVO);
}
