package com.kh.meetAgain.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // 롬복을 이용한 getter, setter 자동 추가 어노테이션
@AllArgsConstructor // 전체 매개변수 받는 생성자 자동 생성 어노테이션
@NoArgsConstructor // 기본 생성자용
// @Getter / @Setter 로 각각 선택하여 추가할 수도 있다.
public class Board implements Serializable {

	private static final long serialVersionUID = 486L;
	
	private int bId;
	private String userId;
	private int bType;
	private String bTitle;
	private String bContent;
	private int bRate;
	private Date bDate;
	private String bDel;
}
	

