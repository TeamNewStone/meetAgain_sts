package com.kh.meetAgain.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	static int BOARD_SERVICE_ERROR = 0;
	   static int BOARD_SERVICE_COMPLETE = 1;
	   
	   List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	   int selectBoardTotalContents();
}
