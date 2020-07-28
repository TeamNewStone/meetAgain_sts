package com.kh.meetAgain.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.member.model.dao.MemberDAO;
import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
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
	public Member selectOne(String email) {
		return memberDAO.selectOne(email); 
	}

	@Override
	public int mTMIUpdate(UserTMI userTMI) {
		return memberDAO.mTMIUpdate(userTMI);
	}

	@Override
	public int mCateUpdate(CateInfo cateInfo, String[] cateId) {
		System.out.println("MemberServiceImpl test : "+cateInfo.getCateId());
		int result = 0;
		if(cateId.length > 0) {
			for(String c : cateId) {
				result = memberDAO.mCateUpdate(c);
			}
		}
		return result;
	}

	@Override
	public UserTMI selectOneTMI(String email) {
		return memberDAO.selectOneTMI(email);
	}

	@Override
	public int insertMember(Member m) {
		return memberDAO.insertMember(m);
	}

}
