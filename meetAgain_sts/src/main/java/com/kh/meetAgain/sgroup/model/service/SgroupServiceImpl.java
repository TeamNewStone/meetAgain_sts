package com.kh.meetAgain.sgroup.model.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.member.model.vo.CateInfo;
import com.kh.meetAgain.sgroup.model.dao.SgroupDAO;
import com.kh.meetAgain.sgroup.model.exception.SgroupException;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;
import com.kh.meetAgain.sgroup.model.vo.Calendar;
import com.kh.meetAgain.sgroup.model.vo.GB_comment;
import com.kh.meetAgain.sgroup.model.vo.Gboard;
import com.kh.meetAgain.sgroup.model.vo.Joing;

@Service("sgroupService")
public class SgroupServiceImpl implements SgroupService {

	@Autowired
	SgroupDAO sgroupDAO;

	@Override
	public int insertSgroup(Sgroup sgroup) {
		return sgroupDAO.insertSgroup(sgroup);
	}

	@Override
	public List<Sgroup> selectSgroupList() {
		return sgroupDAO.selectSgroupList();
	}

	@Override
	public Sgroup selectOneSgroup(String gid) {
		return sgroupDAO.selectOneSgroup(gid);
	}

	@Override
	public List<CateInfo> selectCateInfo(String userId) {
		return sgroupDAO.selectCateInfo(userId);
	}

	@Override
	public List<Joing> selectJoing(String gid) {
		return sgroupDAO.selectJoing(gid);
	}

	@Override
	public List<Joing> selectJoingUser(String userId) {
		return sgroupDAO.selectJoingUser(userId);
	}
	
	@Override
	public int insertGroupJoin(Joing joing) {
		return sgroupDAO.insertGroupJoin(joing);
	}
	
	@Override
	public int groupLeave(Map<String, String> map) {
		return sgroupDAO.groupLeave(map);
	}
	
	@Override
	public List<Map<String, String>> selectgBoardList(String gId, int cPage, int numPerPage) {
		System.out.println("Service gId : " + gId);
		return sgroupDAO.selectgBoardList(gId, cPage, numPerPage);
	}
	public int selectGroupCount(String userId) {
		return sgroupDAO.selectGroupCount(userId);
	}

	@Override
	public int selectgBoardTotalContents(String gId) {
		return sgroupDAO.selectgBoardTotalContents(gId);
	}

	@Override
	public Gboard SelectOnegBoard(int gbId) {
		return sgroupDAO.selectOnegBoard(gbId);
	}

	@Override
	public int insertgBoard(Gboard Gboard) {
		System.out.println("service : " + Gboard);
		return sgroupDAO.insertgBoard(Gboard);
	}

	@Override
	public int updategBoard(Gboard Gboard) {
		System.out.println("service : " + Gboard);
		return sgroupDAO.updategBoard(Gboard);
	}

	@Override
	public int deletegBoard(int gbId) {
		int result = sgroupDAO.deletegBoard(gbId);

		if (result > SGROUP_SERVICE_ERROR)
			result = SGROUP_SERVICE_COMPLETE;
		else
			throw new SgroupException("게시글 삭제 실패!");
		System.out.println("service.delete : " + gbId);
		return result;
	}

	@Override
	public int updateReadCount(int bId) {
		return sgroupDAO.updateReadCount(bId);
	}

	@Override
	public int addCalendar(Calendar calendar) {
		return sgroupDAO.addCalendar(calendar);
	}

	@Override
	public int insertComment(GB_comment gB_comment) {
		System.out.println("Service : " + gB_comment);
		return sgroupDAO.insertComment(gB_comment);
	}

	@Override
	public List<GB_comment> selectCommentList(int gbId) {
		System.out.println("selectCommentList : "+gbId);
		return sgroupDAO.selectCommentList(gbId);
	}
	
	@Override
	public List<Calendar> loadList(String gId) {
		return sgroupDAO.loadList(gId);
	}
	
	@Override
	public int commentUpdate(GB_comment gB_comment) {
		System.out.println("Service : " + gB_comment);
		return sgroupDAO.commentUpdate(gB_comment);
	}

	@Override
	public int commentDelete(int cId) {
		
		return sgroupDAO.commentDelete(cId);
	}

	@Override
	public int deleteCalendar(String cdId) {
		return sgroupDAO.deleteCalendar(cdId);
	}

	@Override
	public int countGroupMember(String gid) {
		return sgroupDAO.countGroupMember(gid);
	}	

	@Override
	public int joinSuccess(Map<String, String> map) {
		return sgroupDAO.joinSuccess(map);
	}

	@Override
	public int checkCtn(String gId, String userId) {
		return sgroupDAO.checkCtn(gId, userId);
	}	

	@Override
	public Sgroup getMyPlace(String gId) {
		return sgroupDAO.getMyPlace(gId);
	}

	@Override
	public int getMasterStatus(Map<String, Object> map) {
		return sgroupDAO.getMasterStatus(map);
	}

	@Override
	public int groupMapUpdate(Map<String, String> map) {
		return sgroupDAO.groupMapUpdate(map);
	}

	@Override
	public List<Sgroup> searchGroup(Map<String, Object> map) {
		return sgroupDAO.searchGroup(map);
	}

}
