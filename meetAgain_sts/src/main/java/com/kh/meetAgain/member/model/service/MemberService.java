package com.kh.meetAgain.member.model.service;

import com.kh.meetAgain.member.model.vo.Member;

public interface MemberService {
	
	Member selectOne(String email);
}
