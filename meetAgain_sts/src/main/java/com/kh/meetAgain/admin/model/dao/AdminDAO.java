package com.kh.meetAgain.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.meetAgain.admin.model.vo.Report;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.sgroup.model.vo.GB_comment;
import com.kh.meetAgain.sgroup.model.vo.Gboard;

public interface AdminDAO {

	int selectAdmin(Map<String, String> map);

	Member selectOneAdmin(Map<String, String> map);

	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeTotalContents();

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	Report selectOneBoard(int rcId);

	List<Map<String, String>> selectCommentList(int cPage, int numPerPage);

	int selectCommentTotalContents();

	Report selectOneComment(int rcId);

	int reportReject(Report report);

	int reportUpdate(Report report);

	int memberWarnUpdate(Member member);

	int gbDelUpdate(Gboard gboard);

	int gcDelUpdate(GB_comment gbComment);
	
}
