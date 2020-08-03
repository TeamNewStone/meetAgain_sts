package com.kh.meetAgain.sgroup.model.dao;
import java.util.List;
import java.util.Map;

import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.UserTMI;
import com.kh.meetAgain.sgroup.model.vo.Calendar;
import com.kh.meetAgain.sgroup.model.vo.Gboard;
import com.kh.meetAgain.sgroup.model.vo.Joing;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

public interface SgroupDAO {

	int insertSgroup(Sgroup sgroup);
	
	List<Sgroup> selectSgroupList();
	
	Sgroup selectOneSgroup(String gId);


	List<CateInfo> selectCateInfo(String userId);

	List<Joing> selectJoing(String gId);
	
	List<Joing> selectJoingUser(String userId);
	
	int insertGroupJoin(Joing joing);
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
