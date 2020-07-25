package com.kh.meetAgain.member.model.dao;

import com.kh.meetAgain.member.model.vo.Member;

public interface MemberDAO {
	
	Member selectOne(String email);
	
}
