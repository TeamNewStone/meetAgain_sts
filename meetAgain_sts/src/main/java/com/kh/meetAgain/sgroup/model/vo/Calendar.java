package com.kh.meetAgain.sgroup.model.vo;

import java.sql.Timestamp;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본 생성자용
@AllArgsConstructor // 전체 매개변수 받는 생성자 자동 생성 어노테이션
public class Calendar {
	
	private String gid;
	private Date gdate;
	private String ginfo;
	private String gtimeStr; // 시간
	private Timestamp gtime;	
	private String isctn;

}
