package com.kh.meetAgain.member.model.service;
import java.util.Map;

import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.UserTMI;

public interface MemberService {
	
	int checkNnDuplicate(String nickName);

	int mUpdate(Member member);


	Member selectOne(String userId);

	
	Map<String, Object> selectOneTMI(String userId);

	int mTMIUpdate(UserTMI userTMI, CateInfo cateInfo);
	
	int insertMember(Member m);

	int memberOut(Member m); 

	int checkNnDuplicate2(Map<String, String> map);

	int mTMIUpdate2(UserTMI userTMI);

	int mCateDelete(String userId);

	int imgUpdate(Map<String, String> map);

	Member selectOneMember(String userId);

}
