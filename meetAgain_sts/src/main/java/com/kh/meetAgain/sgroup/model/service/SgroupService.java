package com.kh.meetAgain.sgroup.model.service;

import java.util.List;

import com.kh.meetAgain.sgroup.model.vo.Sgroup;

public interface SgroupService {

	int insertSgroup(Sgroup sgroup);
	
	List<Sgroup> selectSgroupList();
	
	Sgroup selectOneSgroup(String gId);
}
