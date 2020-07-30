package com.kh.meetAgain.sgroup.model.vo;

import java.sql.Date;
import java.sql.Time;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor // 전체 매개변수 받는 생성자 자동 생성 어노테이션
@NoArgsConstructor // 기본 생성자용
public class Calendar {
	
	private String gid;
	private Date gdate;
	private String ginfo;
	private Time gtime;	
	private char isctn;

}
