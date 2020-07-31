package com.kh.meetAgain.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.meetAgain.admin.model.vo.Report;
import com.kh.meetAgain.board.model.vo.Board;
import com.kh.meetAgain.member.model.vo.Member;

public interface AdminDAO {

	int selectAdmin(Map<String, String> map);

	Member selectOneAdmin(Map<String, String> map);

	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeTotalContents();

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	Report selectOneBoard(int rcId);


}
