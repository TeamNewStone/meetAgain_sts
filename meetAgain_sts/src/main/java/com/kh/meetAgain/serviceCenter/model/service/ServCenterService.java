package com.kh.meetAgain.serviceCenter.model.service;

import java.util.List;
import java.util.Map;

public interface ServCenterService {

	List<Map<String, String>> selectReportList(int cPage, int numPerPage, String userId);

	int selectReportTotalContents(String userId);

}
