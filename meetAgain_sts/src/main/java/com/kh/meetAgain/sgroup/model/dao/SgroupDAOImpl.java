package com.kh.meetAgain.sgroup.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.sgroup.model.vo.Sgroup;

@Repository("sgroupDAO")
public class SgroupDAOImpl implements SgroupDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertSgroup(Sgroup sgroup) {
		
		return sqlSession.insert("sgroupMapper.insertSgroup", sgroup);
	}

}
