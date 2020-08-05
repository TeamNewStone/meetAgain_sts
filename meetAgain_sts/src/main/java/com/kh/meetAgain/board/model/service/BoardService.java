package com.kh.meetAgain.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.myPage.model.vo.Review;

public interface BoardService {

	static int BOARD_SERVICE_ERROR = 0;
	   static int BOARD_SERVICE_COMPLETE = 1;
	   
	   List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	   int selectBoardTotalContents();

	Board SelectOneBoard(int bId);

	int insertBoard(Board board);

	int updateBoard(Board board);

	int updateReadCount(int bId);

	List<Review> selectReviewList();

	int selectRvHelpList(Map<String, Object> map);

	int plusRvHelp(Map<String, Object> map);

	int minusRvHelp(Map<String, Object> map);

	int udpateRvLike(int rvid);

	Review selectOneReview(int rvid);

	List<Review> selectTop3rv();
}
