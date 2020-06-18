package com.jl3b.touche_nubes.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jl3b.touche_nubes.member.service.MemberService;
import com.jl3b.touche_nubes.membervo.ResiVo;
import com.jl3b.touche_nubes.membervo.CenterVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("join_member_choice.jan")
	public String joinMemberChoicePage() {
		return "member/join_member_choice";
	}
	
	@RequestMapping("join_resi.jan")
	public String joinResiPage() {
		
		return "member/join_resi";
	}
	
	@RequestMapping("/join_resi_process.jan")
	public String joinMemberProcess(ResiVo resiVo) { 
		

		if (memberService.checkNpki(resiVo.getNpki_key()) == null) { //인증키값이 null로 들어오면 Fail 
			return"/member/join_fail";
		}else if(memberService.checkNpkiDupl(resiVo.getNpki_key()) != null) {
			return"/member/join_fail";
		}else {
			memberService.joinResi(resiVo);
			return "redirect:./login.jan";
		}
	}
	
	
	@RequestMapping("join_teacher.jan")
	public String joinTeacherPage() {
		return "member/join_teacher";
	}
	
	@RequestMapping("join_teacher_process.jan")
	public String joinTeacherProcess(CenterVo teacherVo) {
		
		memberService.joinCenter(teacherVo);
		
		return "redirect:./login.jan";
	}
	
	@RequestMapping("/login.jan")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/login_process.jan")
	public String loginProcess(ResiVo resiVo, HttpSession session) {
		ResiVo residata = memberService.loginResi(resiVo);
		if (residata == null) {
			return "member/login_fail";
		} else {
			session.setAttribute("sessionUser", residata);
			System.out.println("로그인성공 ");
			return "redirect:/board/main.jan";
		}
	}
	
	@RequestMapping("/logout_process.jan")
    public String logOutProcess(HttpSession session) {
		 session.invalidate();
		 return "redirect:/";
	}
	
	
	//센터 로그인
	@RequestMapping("/login_center.jan")
	public String loginCenter() {
		return "member/login_center";
	}
	@RequestMapping("/login_center_process.jan")
	public String loginCenterProcess(CenterVo centerVo, HttpSession session) {
		CenterVo centerData = memberService.loginCenter(centerVo);
		if(centerData == null) {
			return "member/login_fail";
		}else {
			session.setAttribute("sessionCenter", centerData);
			System.out.println("센터 로그인");
			return "redirect:/board/main.jan";
		}
	}
	
}
