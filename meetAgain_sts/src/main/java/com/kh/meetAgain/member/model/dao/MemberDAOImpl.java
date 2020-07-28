package com.kh.meetAgain.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.UserTMI;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectOne(String email) {
		return sqlSession.selectOne("memberMapper.selectOne", email);
	}
	
	@Override
	public int checkNnDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("memberMapper.checkNnDuplicate", hmap);
		
		return (Integer)hmap.get("result");
	}

	@Override
	public int mUpdate(Member member) {
		return sqlSession.update("memberMapper.mUpdate", member);
	}

	@Override
	public int mTMIUpdate(UserTMI userTMI) {
		return sqlSession.update("memberMapper.mTMIUpdate",userTMI);
	}

	@Override
	public int mCateUpdate(String c) {
		System.out.println("MemberDAOImpl test : ");
		return sqlSession.update("memberMapper.mCateUpdate", c);
	}

	@Override
	public UserTMI selectOneTMI(String email) {
		return sqlSession.selectOne("memberMapper.selectOneTMI", email);
	}

	

}
