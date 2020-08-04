package com.kh.meetAgain.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.board.model.dao.BoardDAO;
import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.myPage.model.vo.Review;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		return boardDAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		return boardDAO.selectBoardTotalContents();
	}

	@Override
	public Board SelectOneBoard(int bId) {
		return boardDAO.selectOneBoard(bId);
	}

	@Override
	public int insertBoard(Board board) {
		return boardDAO.insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return boardDAO.updateBoard(board);
	}

	@Override
	public int updateReadCount(int bId) {
		return boardDAO.updateReadCount(bId);
	}

	@Override
	public List<Review> selectReviewList() {
		return boardDAO.selectReviewList();
	}

}
