package com.kh.meetAgain.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Member selectOne(String userId) {
		return sqlSession.selectOne("memberMapper.selectOne", userId);
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
	public int mCateUpdate(String userId, String cateId) {
		System.out.println("MemberDAOImpl test : ");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("cateId", cateId);
		
		return sqlSession.update("memberMapper.mCateUpdate", map);
	}
	
	@Override
	public CateInfo selectCateInfo(String userId) {
		
		List<CateInfo> ci = sqlSession.selectList("memberMapper.selectCateInfo", userId);
		
		CateInfo ci_All = new CateInfo();
		ci_All.setUserId(userId);
		String[] cate_id = new String[ci.size()];
		int i = 0;
		for(CateInfo c : ci) {
			cate_id[i] = c.getCate_id();
			i++;
		}
		ci_All.setCateId(cate_id);
		
		return ci_All;
	}

	@Override
	public UserTMI selectOneTMI(String userId) {
		return sqlSession.selectOne("memberMapper.selectOneTMI", userId);
	}

	@Override
	public int insertMember(Member m) {
		int result = sqlSession.insert("memberMapper.insertMember",m);
		sqlSession.insert("memberMapper.insertTmi",m);
		return result;
	}

	@Override
	public int checkNnDuplicate2(Map<String, String> map) {
		return sqlSession.selectOne("memberMapper.checkNnDuplicate2", map);
	}
	@Override public int memberOut(Member m) {
		 sqlSession.delete("memberMapper.delUserInfo",m); return
		  sqlSession.update("memberMapper.memberOut",m); }

}
