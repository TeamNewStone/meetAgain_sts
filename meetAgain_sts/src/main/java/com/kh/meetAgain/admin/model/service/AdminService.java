package com.kh.meetAgain.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.meetAgain.admin.model.vo.Report;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.sgroup.model.vo.GB_comment;
import com.kh.meetAgain.sgroup.model.vo.Gboard;

public interface AdminService {

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

	int reportUpdate(Report report, Member member, int warn_cnt);

	int gbDelUpdate(Gboard gboard);

	int gcDelUpdate(GB_comment gbComment);

	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();

	Member selectOneMember(String userId);

	List<Map<String, String>> selectMemberOrderList(int cPage, int numPerPage, Map<String, String> map);
	
}
