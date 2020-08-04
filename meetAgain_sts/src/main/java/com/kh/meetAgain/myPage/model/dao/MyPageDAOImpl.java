package com.kh.meetAgain.myPage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.member.model.vo.UserTMI;
import com.kh.meetAgain.myPage.model.vo.Review;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

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
		return sqlSession.selectOne("myPageMapper.totalFollowing",userId);
	}

	@Override
	public int totalFollwer(String userId) {
		return sqlSession.selectOne("myPageMapper.totalFollower",userId);
	}

	@Override
	public int totalGroup(String userId) {
		return sqlSession.selectOne("myPageMapper.totalGroup",userId);
	}

	@Override
	public UserTMI selectUserTMI(String userId) {
		return sqlSession.selectOne("myPageMapper.selectUserTMI");
	}
	
	@Override
	public List<Map<String, String>> selectFollowerList(String userId) {
		return sqlSession.selectList("myPageMapper.selectFollowerList",userId);
	}
	
	@Override
	public List<Map<String, String>> selectFollowingList(String userId) {
		return sqlSession.selectList("myPageMapper.selectFollowingList",userId);
	}
	
	@Override
	public List<Sgroup> getMyGroup(String userId) {
		return sqlSession.selectList("myPageMapper.getMyGroup",userId);
	}

	@Override
	public List<Sgroup> getCreateGroup(String userId) {
		return sqlSession.selectList("myPageMapper.getCreateGroup",userId);
	}

	@Override
	public int selectFollowYN(Map<String, String> map) {
		return sqlSession.selectOne("myPageMapper.selectFollowYN",map);
	}

	@Override
	public int insertFollow(Map<String, String> map) {
		return sqlSession.insert("myPageMapper.insertFollow", map);
	}

	@Override
	public int deleteFollow(Map<String, String> map) {
		return sqlSession.delete("myPageMapper.deleteFollow", map);
	}

	@Override
	public int insertReview(Review review) {
		return sqlSession.insert("myPageMapper.insertReview", review);
	}
}
