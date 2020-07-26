package com.kh.meetAgain.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.member.model.vo.Member;

@Repository("memberDAO")
public class MemberDAOIml implements MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int checkNnDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("memberMapper.checkNnDuplicate", hmap);
		
		return (Integer)hmap.get("result");
	}

	@Override
	public int mUpdate(Member member) {
		return sqlSession.update("memberMapper.mUpdate", member);
	}

}
