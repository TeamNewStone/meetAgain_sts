package com.kh.meetAgain.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.admin.model.dao.AdminDAO;
import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.member.model.vo.Member;

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

}