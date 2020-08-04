package com.kh.meetAgain.sgroup.model.service;

import java.util.HashMap;
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
	public Sgroup selectOneSgroup(String gId) {
		return sgroupDAO.selectOneSgroup(gId);
	}

	@Override
	public List<CateInfo> selectCateInfo(String userId) {
		return sgroupDAO.selectCateInfo(userId);
	}

	@Override
	public List<Joing> selectJoing(String gId) {
		return sgroupDAO.selectJoing(gId);
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
	public List<Map<String, String>> selectgBoardList(String gId, int cPage, int numPerPage) {
		System.out.println("Service gId : " + gId);
		return sgroupDAO.selectgBoardList(gId, cPage, numPerPage);
	}

	@Override
	public int selectgBoardTotalContents() {
		return sgroupDAO.selectgBoardTotalContents();
	}

	@Override
	public Gboard SelectOnegBoard(int bId) {
		return sgroupDAO.selectOnegBoard(bId);
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
		return sgroupDAO.selectCommentList(gbId);
	}


	@Override
	public List<Calendar> loadList() {
		return sgroupDAO.loadList();
	}

	@Override
	public Object commentUpdate(int cId) {
		return sgroupDAO.commentUpdate(cId);
	}


}
