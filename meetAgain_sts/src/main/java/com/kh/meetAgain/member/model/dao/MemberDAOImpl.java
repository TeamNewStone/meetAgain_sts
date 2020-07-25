package com.kh.meetAgain.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.member.model.dao.MemberDAO;
import com.kh.meetAgain.member.model.vo.Member;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectOne(String email) {
		return sqlSession.selectOne("memberMapper.selectOne", email);
	}

}
