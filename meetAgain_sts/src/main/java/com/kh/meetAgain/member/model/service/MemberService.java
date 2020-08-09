package com.kh.meetAgain.member.model.service;
import java.util.List;
import java.util.Map;

import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.MemberShip;
import com.kh.meetAgain.member.model.vo.MsHistory;
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

	MemberShip selectOneMember2(String userId);

	List<Map<String, String>> selectMHList(int cPage, int numPerPage, String userId);

	int selectMHTotalContents(String userId);

	int updatePremiumMem(String userId);

	int insertMsHistory(String userId);

	int quitMembership(String userId);

	int quitMLevel(String userId);

}
