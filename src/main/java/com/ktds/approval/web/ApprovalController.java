package com.ktds.approval.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ktds.approval.service.ApprovalService;
import com.ktds.approval.vo.ApprovalVO;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;

	@PostMapping("/approval/send")
	public String doApprovalSendAction (@ModelAttribute ApprovalVO approvalVO) {
		System.out.println("Asdasdasd" + approvalVO.toString());
		
		String key = this.approvalService.findApprovalKeyByEmail(approvalVO.getEmail());
		
		if(key.equalsIgnoreCase(approvalVO.getKey())) {
			this.approvalService.changeApprovalStatus(approvalVO.getEmail());
			this.approvalService.deleteApprovalKey(approvalVO);
		}
		
		return "redirect:/index";
	}
}
