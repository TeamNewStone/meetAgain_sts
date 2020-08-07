package com.kh.meetAgain.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.member.model.vo.MemberShip;
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
		HashMap<String,Object> hmap = new HashMap<String, Object>();
		String uid = m.getUserId();
		
		hmap.put("userId", uid);
		sqlSession.update("memberMapper.memberOut",hmap);
		int i = (Integer)hmap.get("result");
		
	//	System.out.println("memberOut 결과 : "+i);
		
		sqlSession.delete("memberMapper.delUserInfo",hmap);
		int j = (Integer)hmap.get("result");
		
	//	System.out.println("delinfo 결과 : "+j);
		
		 return  i+j;
		}

	@Override
	public int mCateDelete(String userId) {
		return sqlSession.delete("memberMapper.mCateDelete", userId);
	}

	@Override
	public int imgUpdate(Map<String, String> map) {
		return sqlSession.update("memberMapper.imgUpdate", map);
	}

	@Override
	public Member selectOneMember(String userId) {
		return sqlSession.selectOne("memberMapper.selectOneMember", userId);
	}

	@Override
	public MemberShip selectOneMember2(String userId) {
		return sqlSession.selectOne("memberMapper.selectOneMember2", userId);
	}

	@Override
	public List<Map<String, String>> selectMHList(int cPage, int numPerPage, String userId) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("memberMapper.selectMHList", userId, rows);
	}

	@Override
	public int selectMHTotalContents(String userId) {
		return sqlSession.selectOne("memberMapper.selectMHTotalContents", userId);
	}

}
