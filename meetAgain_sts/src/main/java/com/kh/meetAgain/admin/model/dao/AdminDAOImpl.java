package com.kh.meetAgain.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.member.model.vo.Member;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Autowired SqlSessionTemplate sqlSession;
	
	@Override
	public int selectAdmin(Map<String, String> map) {
		return sqlSession.selectOne("memberMapper.selectAdmin", map);
	}

	@Override
	public Member selectOneAdmin(Map<String, String> map) {
		return sqlSession.selectOne("memberMapper.selectOneAdmin", map);
	}

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("boardMapper.selectBoardList", null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {
		return sqlSession.selectOne("boardMapper.selectBoardTotalContent");
	}

}
