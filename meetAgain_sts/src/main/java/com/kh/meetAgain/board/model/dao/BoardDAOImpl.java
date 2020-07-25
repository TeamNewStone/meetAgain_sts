package com.kh.meetAgain.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.board.model.vo.Board;
@Repository
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

}
