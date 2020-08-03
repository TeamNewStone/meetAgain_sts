package com.kh.meetAgain.serviceCenter.model.dao;

import java.util.List;
import java.util.Map;

public interface ServCenterDAO {

	List<Map<String, String>> selectReportList(int cPage, int numPerPage, String userId);

	int selectReportTotalContents(String userId);

}
