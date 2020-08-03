package com.kh.meetAgain.serviceCenter.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("scdao")
public class ServCenterDAOImpl implements ServCenterDAO {
	
	@Autowired SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectReportList(int cPage, int numPerPage, String userId) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("servCenterMapper.selectReportList", userId, rows);
	}

	@Override
	public int selectReportTotalContents(String userId) {
		return sqlSession.selectOne("servCenterMapper.selectReportTotalContents", userId);
	}

}
