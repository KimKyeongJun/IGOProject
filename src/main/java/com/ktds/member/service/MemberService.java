package com.ktds.member.service;

import com.ktds.member.vo.MemberVO;

public interface MemberService {

	public boolean registOneMember(MemberVO memberVO);
	
	public MemberVO readOneMember(MemberVO memberVO);

	public boolean readOneEmail(String email);
	
	public boolean isBlockUser(String email);
	
	public boolean modifyMemberUpdate(MemberVO memberVO);
}
