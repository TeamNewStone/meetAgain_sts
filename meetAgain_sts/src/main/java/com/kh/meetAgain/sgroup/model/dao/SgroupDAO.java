package com.kh.meetAgain.sgroup.model.dao;

import java.util.List;

import com.kh.meetAgain.sgroup.model.vo.Sgroup;

public interface SgroupDAO {

	int insertSgroup(Sgroup sgroup);
	
	List<Sgroup> selectSgroupList();
	
	Sgroup selectOneSgroup(String gId);

}
