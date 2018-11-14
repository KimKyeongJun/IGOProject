package com.ktds.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.member.biz.MemberBiz;
import com.ktds.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberBiz memberBiz;
	
	@Override
	public boolean registOneMember(MemberVO memberVO) {
		return memberBiz.registOneMember(memberVO);
	}
	
	@Override
	public MemberVO readOneMember(MemberVO memberVO) {
		return memberBiz.readOneMember(memberVO);
	}

	@Override
	public boolean readOneEmail(String email) {
		return memberBiz.readOneEmail(email);
	}

	@Override
	public boolean isBlockUser(String email) {
		return memberBiz.isBlockUser(email);
	}
	
	@Override
	public boolean modifyMemberUpdate(MemberVO memberVO) {
		return this.memberBiz.modifyMemberUpdate(memberVO);
	}

}
