package com.kh.meetAgain.sgroup.model.service;

import java.util.List;
import java.util.Map;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;
import com.kh.meetAgain.sgroup.model.vo.Gboard;

public interface SgroupService {

	int insertSgroup(Sgroup sgroup);
	
// -----------------------------------------------------------
	static int BOARD_SERVICE_ERROR = 0;
	static int BOARD_SERVICE_COMPLETE = 1;
	
	List<Map<String, String>> selectgBoardList(int cPage, int numPerPage);

	   int selectgBoardTotalContents();

	   Gboard SelectOnegBoard(int bId);

	int insertgBoard(Gboard Gboard);

	int updategBoard(Gboard Gboard);

	int updateReadCount(int bId);
}