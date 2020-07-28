package com.kh.meetAgain.member.model.service;
import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.UserTMI;

public interface MemberService {
	
	int checkNnDuplicate(String nickName);

	int mUpdate(Member member);

	Member selectOne(String email);

	int mTMIUpdate(UserTMI userTMI);

	int mCateUpdate(CateInfo cateInfo, String[] cateId);

	UserTMI selectOneTMI(String email);
	
	int insertMember(Member m);
}
