package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberServiceImpl service;
	
	@GetMapping("/login")
	public String loginForm() {
		
		return "login/login";
	}
	
	@PostMapping("/login")
	public String login(MemberVO member, Model model, HttpSession session) {
		
		MemberVO userVO =service.login(member);
		
		if(userVO == null) {
			String msg="아이디 또는 패스워드가 잘못되었습니다";
			model.addAttribute("msg", msg);
			return "login/login";
		}
		session.setAttribute("userVO", userVO); //세션 등록
		
		String dest = (String)session.getAttribute("dest");
		if(dest !=null) { //인터셉터걸려서 로그인으로 들어옴
		
			session.removeAttribute(dest); //intercept 에 dest가 있으면,(걸렸으면)
			return "redirect:" +dest;
		} //인터셉터를 거쳤는지 알고, 그 인터셉터 페이지로 이동
		return "redirect:/"; //로그인성공시 홈화면으로 이동
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
