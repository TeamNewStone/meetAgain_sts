package com.kh.meetAgain.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // 롬복을 이용한 getter, setter 자동 추가 어노테이션
@AllArgsConstructor // 전체 매개변수 받는 생성자 자동 생성 어노테이션
@NoArgsConstructor
public class Member implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 109L;
	private String userId;
	private String userName;
	private String address1;
	private String address2;
	private String address3;
	private String nickName;
	private Date birthday;
	private String gender;
	private String email;
	private String phone;
	private int mLevel;
	private Date enrollDate;
	private Date wdDate;
	private String wd_Yn;
	private String out_Yn;
	private int warn_Cnt;
	private String stop_Yna;
	private Date stop_Time;
	private int rcId;
	
}
