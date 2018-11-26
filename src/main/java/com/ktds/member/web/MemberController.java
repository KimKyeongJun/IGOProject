package com.ktds.member.web;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.approval.vo.ApprovalVO;
import com.ktds.common.Session;
import com.ktds.member.service.MemberService;
import com.ktds.member.validator.MemberValidator;
import com.ktds.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/member/regist")
	public String viewRegistPage() {
		return "member/regist";
	}
	
	@GetMapping("/member/logout")
	public String doMemberLogoutAction(HttpSession session) {
		// Logout
		session.invalidate();	
		return "redirect:/index";
	}
	
	@PostMapping("/member/regist")
	public ModelAndView doRegistNewMemberAction(@Validated({MemberValidator.Regist.class}) @ModelAttribute MemberVO memberVO , Errors errors) {
		ModelAndView view = new ModelAndView("redirect:/");
		
		if ( errors.hasErrors() ) {
			view.setViewName("redirect:/member/regist?error=1");
			view.addObject(memberVO);
			return view;
		}
		
		boolean isSuccess = memberService.registOneMember(memberVO);
		if ( !isSuccess ) {
			view.setViewName("member/regist");
			return view;
		} else {
			ApprovalVO approvalVO = null;
			try {
				approvalVO = new ApprovalVO(memberVO.getEmail(), create_key());
				memberService.setApprovalKey(approvalVO);
			} catch (Exception e) {
			}
		}
		return view;
	}
	
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 10; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
	
	@PostMapping("/member/duplicate")
	@ResponseBody
	public Map<String, Object> doCheckDuplicateEmail(@RequestParam String email){
		boolean selectCheckEmail = memberService.readOneEmail(email);
		Map<String, Object> result = new HashMap<>();
		result.put("duplicated", selectCheckEmail);  
		/*if (selectCheckEmail) {
			result.put("status","이미 등록된 이메일입니다.");
			result.put("duplicated", selectCheckEmail);  
		}
		else {
			result.put("", value)
		}*/
		return result;
	}
	
	@PostMapping("/member/validate")
	@ResponseBody
	public Map<String, Object> doCheckRegist(@Validated({MemberValidator.Regist.class}) @ModelAttribute MemberVO memberVO, Errors errors, HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		if( errors.hasErrors() ) {
			StringBuilder errorMessage = new StringBuilder();
			for ( FieldError fieldError : errors.getFieldErrors() ) {
				errorMessage.append(fieldError.getDefaultMessage());
				errorMessage.append("\n");
				result.put("message", errorMessage);
			}
			result.put("status", false);
			session.setAttribute(Session.VALIDCHECK, memberVO);
			return result;
		}
		result.put("status", true);
		this.memberService.registOneMember(memberVO);
		return result;
	}
	
	@GetMapping("/member/login")
	public ModelAndView viewLoginPage(@RequestParam(required=false, defaultValue="") String error) {
		ModelAndView view = new ModelAndView("member/login");
		view.addObject("error", error);
		return view;
	}
	
	@GetMapping("/member/modify")
	public String viewMemberModifyPage(@SessionAttribute(Session.USER)MemberVO memberVO) {
		return "member/modify";
	}
	
	@PostMapping("/member/modify")
	@ResponseBody
	public boolean doMemberModifyAction(@ModelAttribute MemberVO memberVO, @SessionAttribute(Session.USER) MemberVO loginMemberVO) {
		memberVO.setEmail(loginMemberVO.getEmail());
		boolean isModify = this.memberService.modifyMemberUpdate(memberVO);
		return isModify;
	}
	
	@GetMapping("/member/passwordconfirm")
	public String viewPasswordConfirmPage() {
		return "member/passwordconfirm";
	}
	
	@PostMapping("/member/passwordconfirm")
	@ResponseBody
	public boolean doPasswordConfirmAction(@ModelAttribute MemberVO memberVO) {
		MemberVO passwordMemberVO = this.memberService.readOneMember(memberVO);
		if (passwordMemberVO != null) {
			return true;
		}
		return false;
	}
	
	@GetMapping("/member/find")
	public String viewFindPage() {
		return "member/find";
	}
	
	@PostMapping("/member/findEmail")
	@ResponseBody
	public Map<String, Object> doEmailFindAction (@ModelAttribute MemberVO memberVO) {
		
		Map<String, Object> result = new HashMap<>();
		
		MemberVO findMemberVO = this.memberService.findMemberEmail(memberVO);
		
		if(findMemberVO != null) {
			result.put("findEmail", findMemberVO.getEmail());
		} else {
			result.put("status", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/member/findMember")
	@ResponseBody
	public Map<String, Object> dofindMemberAction (@ModelAttribute MemberVO memberVO) {
		Map<String, Object> result = new HashMap<>();
		
		boolean isMember = this.memberService.findMember(memberVO);
		
		if(isMember) {
			result.put("memberEmail", memberVO.getEmail());
		} else {
			result.put("status", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/member/updatePw")
	@ResponseBody
	public boolean doUpdatePWAction (@ModelAttribute MemberVO memberVO) {
		return this.memberService.changeMemberPw(memberVO);
	}
}
