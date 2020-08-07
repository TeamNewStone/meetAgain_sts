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
	
	Sgroup selectOneSgroup(String gid);

	List<CateInfo> selectCateInfo(String userId);
	
	List<Joing> selectJoing(String gid);

	List<Joing> selectJoingUser(String userId);
	
	int insertGroupJoin(Joing joing);

	int groupLeave(Map<String, String> map);

	List<Map<String, String>> selectgBoardList(String gId, int numPerPage, int cPage);

	int selectGroupCount(String userId);
	

 int selectgBoardTotalContents(String gId);

	 Gboard SelectOnegBoard(int gbId);

	int insertgBoard(Gboard Gboard);

	int updategBoard(Gboard Gboard);
	
	int deletegBoard(int gbId);

	int updateReadCount(int bId);
	
	int addCalendar(Calendar calendar);

	List<GB_comment> selectCommentList(int gbId);

	List<Calendar> loadList();

	int commentUpdate(GB_comment gB_comment);

	int commentDelete(int cId);

	int deleteCalendar(String cdId);

	int insertComment(GB_comment gB_comment);

	int countGroupMember(String gid);
	
	int joinSuccess(Map<String, String> map);

	Sgroup getMyPlace(String gId);

	int meetingPlaceMasterStatus(Map<String, Object> map);

}
