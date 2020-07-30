package com.kh.meetAgain.sgroup.model.dao;
import java.util.List;
import java.util.Map;

import com.kh.meetAgain.sgroup.model.vo.Sgroup;
import com.kh.meetAgain.sgroup.model.vo.Calendar;
import com.kh.meetAgain.sgroup.model.vo.Gboard;

public interface SgroupDAO {

	int insertSgroup(Sgroup sgroup);
	
	List<Sgroup> selectSgroupList();
	
	Sgroup selectOneSgroup(String gId);

// -------------------------------------------------
	
	List<Map<String, String>> selectgBoardList(int cPage, int numPerPage);

	   int selectgBoardTotalContents();

	Gboard selectOnegBoard(int bId);

	int insertgBoard(Gboard Gboard);

	int updategBoard(Gboard Gboard);

	int updateReadCount(int bId);

	int deletegBoard(int gbId);

	int addCalendar(Calendar calendar);


}
