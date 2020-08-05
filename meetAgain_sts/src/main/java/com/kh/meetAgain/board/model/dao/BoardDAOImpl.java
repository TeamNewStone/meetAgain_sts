package com.kh.meetAgain.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.myPage.model.vo.Review;
@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("boardMapper.selectBoardList", null, rows);
	}

	@Override
	public int selectBoardTotalContents() {
		return sqlSession.selectOne("boardMapper.selectBoardTotalContent");
	}

	@Override
	public Board selectOneBoard(int bId) {
		return sqlSession.selectOne("boardMapper.selectOneBoard", bId);
	}

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("boardMapper.insertBoard", board);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("boardMapper.updateBoard", board);
	}

	@Override
	public int updateReadCount(int bId) {
		return sqlSession.update("boardMapper.updateReadCount", bId);
	}

	@Override
	public List<Review> selectReviewList() {
		return sqlSession.selectList("boardMapper.selectReviewList");
	}

	@Override
	public int selectRvHelpList(Map<String, Object> map) {
		int result = sqlSession.selectOne("boardMapper.selectRvHelpList",map);

		return result;
	}

	@Override
	public int plusRvHelp(Map<String, Object> map) {
		return sqlSession.insert("boardMapper.plusRvHelp",map);
	}

	@Override
	public int minusRvHelp(Map<String, Object> map) {
		return sqlSession.delete("boardMapper.minusRvHelp",map);
	}

	@Override
	public int updateRvLike(int rvid) {
		return sqlSession.update("boardMapper.updateRvLike",rvid);
	}

	@Override
	public Review selectOneReview(int rvid) {
		return sqlSession.selectOne("boardMapper.selectOneReview",rvid);
	}	

}
