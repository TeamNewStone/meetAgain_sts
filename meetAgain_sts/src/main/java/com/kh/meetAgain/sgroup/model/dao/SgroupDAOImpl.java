package com.kh.meetAgain.sgroup.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.admin.model.vo.Report;
import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.sgroup.model.vo.Calendar;
import com.kh.meetAgain.sgroup.model.vo.GB_comment;
import com.kh.meetAgain.sgroup.model.vo.Gboard;
import com.kh.meetAgain.sgroup.model.vo.Joing;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

@Repository("sgroupDAO")
public class SgroupDAOImpl implements SgroupDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertSgroup(Sgroup sgroup) {

		return sqlSession.insert("sgroupMapper.insertSgroup", sgroup);
	}

	@Override
	public List<Sgroup> selectSgroupList() {
		return sqlSession.selectList("sgroupMapper.selectListSgroup");
	}
	
	@Override
	public Sgroup selectOneSgroup(String gid) {
		return sqlSession.selectOne("sgroupMapper.selectOneSgroup", gid);
	}
	
	@Override
	public List<CateInfo> selectCateInfo(String userId) {
		return sqlSession.selectList("sgroupMapper.selectCateInfo", userId);
	}
	
	
	@Override
	public List<Joing> selectJoing(String gid) {
		return sqlSession.selectList("sgroupMapper.selectJoing", gid);
	}
	
	@Override
	public List<Joing> selectJoingUser(String userId) {
		return sqlSession.selectList("sgroupMapper.selectJoingUser", userId);
	}
	
	@Override
	public int insertGroupJoin(Joing joing) {
		return sqlSession.insert("sgroupMapper.insertGroupJoin", joing);
	}
	
	@Override
	public int selectGroupCount(String userId) {
		System.out.println(userId);
		return sqlSession.selectOne("sgroupMapper.selectGroupCount", userId);
	}

	@Override
	public int groupLeave(Map<String, String> map) {
		return sqlSession.update("sgroupMapper.groupLeave", map);
	}
	
	@Override
	public List<Map<String, String>> selectgBoardList(String gId ,int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		List<Map<String, String>> list = sqlSession.selectList("sgroupMapper.selectgBoardList", gId, rows);

		System.out.println("cPage : " + cPage);
		System.out.println("numPerPage : " + numPerPage);
		System.out.println("DAO gId : " + gId);
		System.out.println("list 출력 : " + list);
		return list;
	}


	public int selectgBoardTotalContents(String gId) {
		return sqlSession.selectOne("sgroupMapper.selectgBoardTotalContent",gId);
	}

	@Override
	public Gboard selectOnegBoard(int gbId) {
		return sqlSession.selectOne("sgroupMapper.selectOnegBoard", gbId);
	}

	@Override
	public int insertgBoard(Gboard Gboard) {
		System.out.println("Gboard : " + Gboard);
		return sqlSession.insert("sgroupMapper.insertgBoard", Gboard);
	}

	@Override
	public int updategBoard(Gboard Gboard) {
		return sqlSession.update("sgroupMapper.updategBoard", Gboard);
	}

	@Override
	public int updateReadCount(int gbId) {
		return sqlSession.update("sgroupMapper.updateReadCount", gbId);
	}

	@Override
	public int addCalendar(Calendar calendar) {
		return sqlSession.insert("calendarMapper.insertSchedule", calendar);
	}
	
	@Override
	public List<Calendar> loadList(String gId) {		
		//System.out.println("DAO실행");
		// System.out.println(sqlSession.selectList("calendarMapper.loadList"));
		
		return sqlSession.selectList("calendarMapper.loadList", gId);
	}

	@Override
	public int deletegBoard(int gbId) {
		System.out.println("deleteDAO : " + gbId);
		return sqlSession.delete("sgroupMapper.deletegBoard", gbId);
	}
	@Override
	public List<GB_comment> selectCommentList(int gbId) {
		System.out.println("selectCommentList : "+gbId);
		return sqlSession.selectList("sgroupMapper.selectCommentList", gbId);
	}

	@Override
	public int insertComment(GB_comment gB_comment) {
		System.out.println("DAO insertGB : "+ gB_comment);
		return sqlSession.insert("sgroupMapper.insertComment", gB_comment);
	}

	@Override
	public int commentDelete(int cId) {
		return sqlSession.delete("sgroupMapper.deleteComment", cId);
	}

	@Override
	public int deleteCalendar(String cdId) {
		return sqlSession.delete("calendarMapper.deleteCalendar", cdId);
	}


	@Override
	public int commentUpdate(GB_comment gB_comment) {
		return sqlSession.insert("sgroupMapper.updateComment", gB_comment);
	}

	@Override
	public int countGroupMember(String gid) {
		return sqlSession.selectOne("sgroupMapper.countGroupMember", gid);
	}

	@Override
	public int joinSuccess(Map<String, String> map) {
		return sqlSession.update("sgroupMapper.joinSuccess", map);
	}	

	@Override
	public int checkCtn(String gId, String userId) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("gId", gId);
		map.put("userId", userId);
		
		return sqlSession.selectOne("calendarMapper.checkCtn",map);
	}

	@Override
	public Sgroup getMyPlace(String gId) {
		return sqlSession.selectOne("mapMapper.getMyPlace", gId);
	}

	@Override
	public int getMasterStatus(Map<String, Object> map) {

			int result = 0;		
		
			if(sqlSession.selectOne("mapMapper.getMasterStatus", map)==null) {
				result = 0;
			} else	result = 1;
		
		System.out.println("DAO ㅅlfgod " + map);
		
		return result;
	}

	@Override
	public int groupMapUpdate(Map<String, String> map) {
		return sqlSession.update("mapMapper.groupMapUpdate", map);
	}
	
	@Override
	public List<Sgroup> searchGroup(Map<String, Object> map) {
		return sqlSession.selectList("sgroupMapper.searchGroup", map);
	}
	

	@Override
	public int bReportInsert(Report r) {
		return sqlSession.insert("sgroupMapper.bReportInsert", r);
	}

	@Override
	public int cReportInsert(Report r) {
		return sqlSession.insert("sgroupMapper.cReportInsert", r);
	}
	
	@Override
	public int modifyCalendar(Map<String, Object> map) {
		return sqlSession.update("calendarMapper.modify",map);
	}

	@Override
	public int updateSgroup(Sgroup sgroup) {
		return sqlSession.update("sgroupMapper.updateSgroup", sgroup);
	}

	@Override
	public int joinReject(Map<String, Object> map) {
		return sqlSession.delete("sgroupMapper.joinReject", map);
	}
	
	
	@Override
	public Sgroup selectOneSgroup2(int gbId) {
		return sqlSession.selectOne("sgroupMapper.selectOneSgroup2", gbId);
	}

	@Override
	public Calendar selectOneCal(String cdid) {
		return sqlSession.selectOne("calendarMapper.selectOneCal",cdid);
	}
}

