package kr.ac.kopo.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberServicce {
	
	@Autowired
	private MemberDAO memberDAO; //의존성 자동주입
	
	public MemberVO login(MemberVO member) {
		
		MemberVO userVO = memberDAO.login(member);
		return userVO;
	}

}
