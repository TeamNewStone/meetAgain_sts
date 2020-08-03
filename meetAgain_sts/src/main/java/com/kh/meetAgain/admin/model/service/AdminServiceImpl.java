package com.kh.meetAgain.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.admin.model.dao.AdminDAO;
import com.kh.meetAgain.admin.model.vo.Report;
import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.sgroup.model.vo.GbComment;
import com.kh.meetAgain.sgroup.model.vo.Gboard;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminDAO adminDAO;

	@Override
	public int selectAdmin(Map<String, String> map) {
		return adminDAO.selectAdmin(map);
	}

	@Override
	public Member selectOneAdmin(Map<String, String> map) {
		return adminDAO.selectOneAdmin(map);
	}

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		return adminDAO.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeTotalContents() {
		return adminDAO.selectNoticeTotalContents();
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		return adminDAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		return adminDAO.selectBoardTotalContents();
	}

	@Override
	public Report selectOneBoard(int rcId) {
		return adminDAO.selectOneBoard(rcId);
	}

	@Override
	public List<Map<String, String>> selectCommentList(int cPage, int numPerPage) {
		return adminDAO.selectCommentList(cPage, numPerPage);
	}

	@Override
	public int selectCommentTotalContents() {
		return adminDAO.selectCommentTotalContents();
	}

	@Override
	public Report selectOneComment(int rcId) {
		return adminDAO.selectOneComment(rcId);
	}

	@Override
	public int reportReject(Report report) {
		return adminDAO.reportReject(report);
	}

	@Override
	public int reportUpdate(Report report, Member member) {
		int result = adminDAO.reportUpdate(report);
		int result2 = adminDAO.memberWarnUpdate(member);
		if(result != 0 && result2 != 0) {
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public int gbDelUpdate(Gboard gboard) {
		return adminDAO.gbDelUpdate(gboard);
	}

	@Override
	public int gcDelUpdate(GbComment gbComment) {
		return adminDAO.gcDelUpdate(gbComment);
	}

}
