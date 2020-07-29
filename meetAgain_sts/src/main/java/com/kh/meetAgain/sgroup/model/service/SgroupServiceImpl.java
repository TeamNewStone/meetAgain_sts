package com.kh.meetAgain.sgroup.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.sgroup.model.dao.SgroupDAO;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

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

}
