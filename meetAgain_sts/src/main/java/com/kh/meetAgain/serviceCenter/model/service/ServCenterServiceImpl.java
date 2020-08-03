package com.kh.meetAgain.serviceCenter.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetAgain.serviceCenter.model.dao.ServCenterDAO;

@Service("scs")
public class ServCenterServiceImpl implements ServCenterService {
	
	@Autowired ServCenterDAO scdao;

	@Override
	public List<Map<String, String>> selectReportList(int cPage, int numPerPage, String userId) {
		return scdao.selectReportList(cPage, numPerPage, userId);
	}

	@Override
	public int selectReportTotalContents(String userId) {
		return scdao.selectReportTotalContents(userId);
	}

}
