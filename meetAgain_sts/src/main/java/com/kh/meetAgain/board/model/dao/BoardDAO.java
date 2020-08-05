package com.kh.meetAgain.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.myPage.model.vo.Review;

public interface BoardDAO {
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	   int selectBoardTotalContents();

	Board selectOneBoard(int bId);

	int insertBoard(Board board);

	int updateBoard(Board board);

	int updateReadCount(int bId);

	List<Review> selectReviewList();

	int selectRvHelpList(Map<String, Object> map);

	int plusRvHelp(Map<String, Object> map);

	int minusRvHelp(Map<String, Object> map);

	int updateRvLike(int rvid);

	Review selectOneReview(int rvid);

	List<Review> selectTop3rv();
}
