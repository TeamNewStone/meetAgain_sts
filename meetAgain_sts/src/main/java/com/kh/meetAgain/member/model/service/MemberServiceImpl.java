package com.kh.meetAgain.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.member.model.dao.MemberDAO;
import com.kh.meetAgain.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public Member selectOne(String email) {
		return memberDAO.selectOne(email); 
	}

}
