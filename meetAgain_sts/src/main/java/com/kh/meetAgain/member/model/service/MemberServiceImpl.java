package com.kh.meetAgain.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.member.model.dao.MemberDAO;
import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.MemberShip;
import com.kh.meetAgain.member.model.vo.MsHistory;
import com.kh.meetAgain.member.model.vo.UserTMI;

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
  
	@Override
	public Member selectOne(String userId) {
			return memberDAO.selectOne(userId);
	}

	@Override
	public int mTMIUpdate(UserTMI userTMI, CateInfo cateInfo) {
		System.out.println("ServiceImpl : " + userTMI + " / " + userTMI.getUserId());
		int result1 = memberDAO.mTMIUpdate(userTMI);
		int result2 = 0;
		result2 = memberDAO.mCateDelete(userTMI.getUserId());
		for(int i = 0; i < cateInfo.getCateId().length; i++) {
			result2 = memberDAO.mCateUpdate(userTMI.getUserId(), cateInfo.getCateId()[i]);
			if(result2 == 0) break;
		}
		
		if(result1 != 0 && result2 != 0) {
			return 1;
		} else {
			return 0;
		} 
	}

	@Override
	public Map<String, Object> selectOneTMI(String userId) {
		HashMap<String, Object> map = new HashMap();
		UserTMI ut = memberDAO.selectOneTMI(userId);
		map.put("ut", ut);
		map.put("cateInfo", memberDAO.selectCateInfo(userId));
		
		return map;
	}

	@Override
	public int insertMember(Member m) {
		return memberDAO.insertMember(m);
	}

	@Override
	public int checkNnDuplicate2(Map<String, String> map) {
		return memberDAO.checkNnDuplicate2(map);
	}
	 @Override public int memberOut(Member m) { return memberDAO.memberOut(m); }

	@Override
	public int mTMIUpdate2(UserTMI userTMI) {
		return memberDAO.mTMIUpdate(userTMI);
	}

	@Override
	public int mCateDelete(String userId) {
		return memberDAO.mCateDelete(userId);
	}

	@Override
	public int imgUpdate(Map<String, String> map) {
		return memberDAO.imgUpdate(map);
	}

	@Override
	public Member selectOneMember(String userId) {
		return memberDAO.selectOneMember(userId);
	}

	@Override
	public MemberShip selectOneMember2(String userId) {
		return memberDAO.selectOneMember2(userId);
	}

	@Override
	public List<Map<String, String>> selectMHList(int cPage, int numPerPage, String userId) {
		return memberDAO.selectMHList(cPage, numPerPage, userId);
	}

	@Override
	public int selectMHTotalContents(String userId) {
		return memberDAO.selectMHTotalContents(userId);
	}

	@Override
	public int updatePremiumMem(String userId) {
		return memberDAO.updatePremiumMem(userId);
	}

	@Override
	public int insertMsHistory(String userId) {
		return memberDAO.insertMsHistory(userId);
	}

	@Override
	public int quitMembership(String userId) {
		return memberDAO.quitMembership(userId);
	}

	@Override
	public int quitMLevel(String userId) {
		return memberDAO.quitMLevel(userId);
	}
}
