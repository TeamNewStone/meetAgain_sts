package com.kh.meetAgain.sgroup.model.service;

import java.util.List;

import java.util.Map;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;
import com.kh.meetAgain.sgroup.model.vo.Calendar;
import com.kh.meetAgain.sgroup.model.vo.Gboard;

public interface SgroupService {

	int insertSgroup(Sgroup sgroup);
	
	List<Sgroup> selectSgroupList();
	
	Sgroup selectOneSgroup(String gId);

// -----------------------------------------------------------
	static int SGROUP_SERVICE_ERROR = 0;
	static int SGROUP_SERVICE_COMPLETE = 1;
	
	List<Map<String, String>> selectgBoardList(int cPage, int numPerPage);

	   int selectgBoardTotalContents();

	   Gboard SelectOnegBoard(int bId);

	int insertgBoard(Gboard Gboard);

	int updategBoard(Gboard Gboard);
	
	// int deletegBoard(int gbId);

	int updateReadCount(int bId);
	
	int addCalendar(Calendar calendar);
	
}

