package com.kh.meetAgain.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.meetAgain.admin.model.vo.Report;
import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.sgroup.model.vo.GB_comment;
import com.kh.meetAgain.sgroup.model.vo.Gboard;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Autowired SqlSessionTemplate sqlSession;
	
	@Override
	public int selectAdmin(Map<String, String> map) {
		return sqlSession.selectOne("memberMapper.selectAdmin", map);
	}

	@Override
	public Member selectOneAdmin(Map<String, String> map) {
		return sqlSession.selectOne("memberMapper.selectOneAdmin", map);
	}

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("boardMapper.selectBoardList", null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {
		return sqlSession.selectOne("boardMapper.selectBoardTotalContent");
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("adminMapper.selectBoardList", null, rows);
	}

	@Override
	public int selectBoardTotalContents() {
		return sqlSession.selectOne("adminMapper.selectBoardTotalContent");
	}

	@Override
	public Report selectOneBoard(int rcId) {
		return sqlSession.selectOne("adminMapper.selectOneBoard", rcId);
	}

	@Override
	public List<Map<String, String>> selectCommentList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminMapper.selectCommentList", null, rows);
	}

	@Override
	public int selectCommentTotalContents() {
		return sqlSession.selectOne("adminMapper.selectCommentTotalContent");
	}

	@Override
	public Report selectOneComment(int rcId) {
		return sqlSession.selectOne("adminMapper.selectOneComment", rcId);
	}

	@Override
	public int reportReject(Report report) {
		return sqlSession.update("adminMapper.reportReject", report);
	}

	@Override
	public int reportUpdate(Report report) {
		return sqlSession.update("adminMapper.reportUpdate", report);
	}

	@Override
	public int memberWarnUpdate(Member member) {
		return sqlSession.update("adminMapper.memberWarnUpdate", member);
	}

	@Override
	public int gbDelUpdate(Gboard gboard) {
		return sqlSession.update("adminMapper.gbDelUpdate", gboard);
	}

	@Override
	public int gcDelUpdate(GB_comment gbComment) {
		return sqlSession.update("adminMapper.gcDelUpdate", gbComment);
	}

}
