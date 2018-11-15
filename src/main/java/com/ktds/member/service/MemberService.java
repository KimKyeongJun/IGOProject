package com.ktds.member.service;

import com.ktds.approval.vo.ApprovalVO;
import com.ktds.member.vo.MemberVO;

public interface MemberService {

	public boolean registOneMember(MemberVO memberVO);
	
	public MemberVO readOneMember(MemberVO memberVO);

	public boolean readOneEmail(String email);
	
	public boolean isBlockUser(String email);
	
	public boolean setApprovalKey(ApprovalVO approvalVO);
	
	public boolean modifyMemberUpdate(MemberVO memberVO);
	
	public MemberVO findMemberEmail(MemberVO memberVO);
}
