package com.kh.meetAgain.member.model.service;
import com.kh.meetAgain.member.model.vo.Member;

public interface MemberService {
	
	int checkNnDuplicate(String nickName);

	int mUpdate(Member member);

	Member selectOne(String email);
}
