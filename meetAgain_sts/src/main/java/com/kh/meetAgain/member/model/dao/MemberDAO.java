package com.kh.meetAgain.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.MemberShip;
import com.kh.meetAgain.member.model.vo.UserTMI;

public interface MemberDAO {

	int checkNnDuplicate(HashMap<String, Object> hmap);
	
	Member selectOne(String userId);

	int mUpdate(Member member);

	int mTMIUpdate(UserTMI userTMI);

	int insertMember(Member m);
	
	int mCateUpdate(String userId, String cateId);

	UserTMI selectOneTMI(String userId);
	
	CateInfo selectCateInfo(String userId);

	 int memberOut(Member m); 

	int checkNnDuplicate2(Map<String, String> map);

	int mCateDelete(String userId);

	int imgUpdate(Map<String, String> map);

	Member selectOneMember(String userId);

	MemberShip selectOneMember2(String userId);

	List<Map<String, String>> selectMHList(int cPage, int numPerPage, String userId);

	int selectMHTotalContents(String userId);

	int updatePremiumMem(String userId);

}
