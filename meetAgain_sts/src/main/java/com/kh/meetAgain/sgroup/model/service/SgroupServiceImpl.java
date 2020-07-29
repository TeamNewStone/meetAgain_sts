package com.kh.meetAgain.sgroup.model.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.sgroup.model.dao.SgroupDAO;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;
import com.kh.meetAgain.sgroup.model.vo.Gboard;

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


	public List<Map<String, String>> selectgBoardList(int cPage, int numPerPage) {

		return sgroupDAO.selectgBoardList(cPage, numPerPage);
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
		return sgroupDAO.updategBoard(Gboard);
	}

	@Override
	public int updateReadCount(int bId) {
		return sgroupDAO.updateReadCount(bId);
	}
	
// -----------------------------------------------------------

}
