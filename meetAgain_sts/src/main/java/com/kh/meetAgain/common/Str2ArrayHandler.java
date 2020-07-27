package com.kh.meetAgain.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 * 문자열과 배열을 상호 호환하기 위한 
 * 타입(자료형)변환기
 * 
 * 3개의 getter 메소드와 1개의 setter 메소드를
 * 구현해야 한다. <br>
 * 
 * <h3> getter </h3>
 * <p> 1. 결과셋(ResultSet)에서 컬럼이름으로 변환하는 방법 </p>
 * <p> 2. 결과셋에서 컬럼의 순번으로 찾아 변환하는 방법 </p>
 * <p> 3. 프로시져 호출용 getter 구현 용도 </p>
 * 
 * <h3> setter </h3>
 * <p> 1. setter : String[] => String (join 메소드 역할) </p>
 * 
 * 여러개 (취미뿐만아니라 다른것도 있다면 이걸로) , 한번만쓴다면 board에 hobby 자바에서 join했던것처럼 쓰기
 * @author Hyunjung
 *
 */
// 문자열을 배열로 배열을 문자열로 상호치환 해주는 class
public class Str2ArrayHandler implements TypeHandler<String[]> {

	// 이 메소드들을 구현 하지 않으면 에러 나는데, 이런걸 강제성이라고 함!
	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		if(parameter != null) {
			// null이면 문자열로 바꾸고 할것도 없으니까 null이 아니라면
			ps.setString(i, String.join(",", parameter));
		} else {
			ps.setString(i, "");
		}
	}
	// ↑ 얘는 Setter , 화면에서 db로 넘어갈때 일반 문자열로 넘어감
	//  "자바,영어,모국어"

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String colVal = rs.getString(columnName); // "Java,C,C++"
		String[] result = colVal.split(",");      // [0] : "Java" / [1] : "C" / [2] : "C++"
		return result;
	}
	// db에서 화면으로 보낼때는 문자열에서 배열로 보내야함
	// split을 사용해서 자바,영어,모국어를 ","기준으로 짤라서 보내라

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String colVal = rs.getString(columnIndex); // "Java,C,C++"
		String[] result = colVal.split(",");      // [0] : "Java" / [1] : "C" / [2] : "C++"
		return result;
	}
	// columnIndex는 setString(m.getUserId(1)) 이렇게 숫자로 넣는 사람들을 위한 메소드

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String colVal = cs.getString(columnIndex); // "Java,C,C++"
		String[] result = colVal.split(",");      // [0] : "Java" / [1] : "C" / [2] : "C++"
		return result;
	}
	//callablestatement로 가져와도 결국 resultset

}
