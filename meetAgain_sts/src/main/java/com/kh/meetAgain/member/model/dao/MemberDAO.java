package com.kh.meetAgain.member.model.dao;

import java.util.HashMap;

import com.kh.meetAgain.member.model.vo.Member;

public interface MemberDAO {

	int checkNnDuplicate(HashMap<String, Object> hmap);
	
	Member selectOne(String email);

	int mUpdate(Member member);
	

}
