package com.kh.meetAgain.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.meetAgain.board.model.vo.Board;

public interface BoardDAO {
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	   int selectBoardTotalContents();

	Board selectOneBoard(int bId);
}
