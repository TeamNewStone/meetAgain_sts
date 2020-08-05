package com.kh.meetAgain.sgroup.model.dao;
import java.util.List;
import java.util.Map;

import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.member.model.vo.UserTMI;
import com.kh.meetAgain.sgroup.model.vo.Calendar;
import com.kh.meetAgain.sgroup.model.vo.GB_comment;
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
	
	int selectGroupCount(String userId);
	
	int groupLeave(Map<String, String> map);
 
	List<Map<String, String>> selectgBoardList(String gId, int cPage, int numPerPage);

	 int selectgBoardTotalContents();

	Gboard selectOnegBoard(int bId);

	int insertgBoard(Gboard Gboard);

	int updategBoard(Gboard Gboard);

	int updateReadCount(int bId);

	int deletegBoard(int gbId);

	int addCalendar(Calendar calendar);

	List<GB_comment> selectCommentList(int gbId);

	int insertComment(GB_comment gB_comment);
	
	int commentUpdate(int cId);

	List<Calendar> loadList();

	int commentUpdate(GB_comment gB_comment);

	int commentDelete(int cId);

	int deleteCalendar(String cdId);

	Sgroup createMapList(String gid);

}
