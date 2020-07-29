package com.kh.meetAgain.member.model.service;
import java.util.Map;

import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.UserTMI;

public interface MemberService {
	
	int checkNnDuplicate(String nickName);

	int mUpdate(Member member);

	Member selectOne(String email);
	
	Map<String, Object> selectOneTMI(String email);

	int mTMIUpdate(UserTMI userTMI, CateInfo cateInfo);
	
	int insertMember(Member m);

	int checkNnDuplicate2(String nickName);
}
