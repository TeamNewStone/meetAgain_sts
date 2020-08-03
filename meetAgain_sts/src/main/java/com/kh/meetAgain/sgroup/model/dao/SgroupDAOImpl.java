package com.kh.meetAgain.sgroup.model.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.meetAgain.sgroup.model.vo.Calendar;
import com.kh.meetAgain.sgroup.model.vo.GB_comment;
import com.kh.meetAgain.sgroup.model.vo.Gboard;
import com.kh.meetAgain.sgroup.model.vo.Sgroup;

@Repository("sgroupDAO")
public class SgroupDAOImpl implements SgroupDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertSgroup(Sgroup sgroup) {

		return sqlSession.insert("sgroupMapper.insertSgroup", sgroup);
	}

	@Override
	public List<Map<String, String>> selectgBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		List<Map<String, String>> list = sqlSession.selectList("sgroupMapper.selectgBoardList", null, rows);

		System.out.println("cPage : " + cPage);
		System.out.println("numPerPage : " + numPerPage);
		System.out.println("list 출력 : " + list);
		return list;
	}

	@Override
	public List<Sgroup> selectSgroupList() {
		return sqlSession.selectList("sgroupMapper.selectSgroupList");
	}

	@Override
	public Sgroup selectOneSgroup(String gId) {
		return sqlSession.selectOne("sgroupMapper.selectOneSgroup", gId);
	}

	public int selectgBoardTotalContents() {
		return sqlSession.selectOne("sgroupMapper.selectgBoardTotalContent");
	}

	@Override
	public Gboard selectOnegBoard(int gbId) {
		return sqlSession.selectOne("sgroupMapper.selectOnegBoard", gbId);
	}

	@Override
	public int insertgBoard(Gboard Gboard) {
		System.out.println("Gboard : " + Gboard);
		return sqlSession.insert("sgroupMapper.insertgBoard", Gboard);
	}

	@Override
	public int updategBoard(Gboard Gboard) {
		return sqlSession.update("sgroupMapper.updategBoard", Gboard);
	}

	@Override
	public int updateReadCount(int gbId) {
		return sqlSession.update("sgroupMapper.updateReadCount", gbId);
	}

	@Override
	public int addCalendar(Calendar calendar) {
		return sqlSession.insert("calendarMapper.insertSchedule", calendar);
	}

	@Override
	public int deletegBoard(int gbId) {
		System.out.println("deleteDAO : " + gbId);
		return sqlSession.delete("sgroupMapper.deletegBoard", gbId);
	}
	@Override
	public List<GB_comment> selectCommentList(int gbId) {
		return sqlSession.selectList("sgroupMapper.selectCommentList", gbId);
	}

	@Override
	public int insertComment(GB_comment gB_comment) {
		return sqlSession.insert("sgroupMapper.insertComment");
	}

}