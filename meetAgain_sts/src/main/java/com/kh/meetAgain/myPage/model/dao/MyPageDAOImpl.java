package com.kh.meetAgain.myPage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mpDAO")
public class MyPageDAOImpl implements MyPageDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("myPageMapper.selectMyBoardList", null, rows);
	}

	@Override
	public int selectMyBoardTotalContents() {
		return sqlSession.selectOne("myPageMapper.selectMyBoardTotalContent");
	}

	@Override
	public int totalFollwing(String userId) {
		return sqlSession.selectOne("myPageMapper.totalFollowing");
	}

	@Override
	public int totalFollwer(String userId) {
		return sqlSession.selectOne("myPageMapper.totalFollower");
	}

	@Override
	public int totalGroup(String userId) {
		return sqlSession.selectOne("myPageMapper.totalGroup");
	}

}
