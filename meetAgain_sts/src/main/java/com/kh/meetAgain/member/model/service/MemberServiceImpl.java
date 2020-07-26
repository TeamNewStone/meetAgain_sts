package com.kh.meetAgain.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.member.model.dao.MemberDAO;
import com.kh.meetAgain.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int checkNnDuplicate(String nickName) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("nickName", nickName);
		
		return memberDAO.checkNnDuplicate(hmap);
	}

	@Override
	public int mUpdate(Member member) {
		return memberDAO.mUpdate(member);
	}
	
	

}
