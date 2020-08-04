package com.kh.meetAgain.sgroup.model.service;

import java.util.List;

import java.util.Map;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;
import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.sgroup.model.vo.Calendar;
import com.kh.meetAgain.sgroup.model.vo.GB_comment;
import com.kh.meetAgain.sgroup.model.vo.Gboard;
import com.kh.meetAgain.sgroup.model.vo.Joing;

public interface SgroupService {

	static int SGROUP_SERVICE_ERROR = 0;
	static int SGROUP_SERVICE_COMPLETE = 1;
  
	int insertSgroup(Sgroup sgroup);
	
	List<Sgroup> selectSgroupList();
	
	Sgroup selectOneSgroup(String gId);

	List<CateInfo> selectCateInfo(String userId);
	
	List<Joing> selectJoing(String gId);
	
	List<Joing> selectJoingUser(String userId);

	int insertGroupJoin(Joing joing);
	
	List<Map<String, String>> selectgBoardList(int cPage, int numPerPage);

 int selectgBoardTotalContents();

	 Gboard SelectOnegBoard(int bId);

	int insertgBoard(Gboard Gboard);

	int updategBoard(Gboard Gboard);
	
	int deletegBoard(int gbId);

	int updateReadCount(int bId);
	
	int addCalendar(Calendar calendar);

	List<GB_comment> selectCommentList(int gbId);

	int insertComment(GB_comment gB_comment);

	List<Calendar> loadList();

	
}
