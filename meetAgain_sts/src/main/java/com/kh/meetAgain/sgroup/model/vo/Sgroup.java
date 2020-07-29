package com.kh.meetAgain.sgroup.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor 
@NoArgsConstructor
public class Sgroup implements Serializable {

	private static final long serialVersionUID = 123L;

	private String gId;
	private String cateId;
	private String gTitle;
	private String gImg;
	private String gIntro;
	private Date createDate;
	private int maxNum;
	private String charge;
	private String gFee;
	private String gPlace;
	private String gType;
	private Date durate;
	private String isFin;
	private String gPwd;
	private String joinType;
	private String[] limitGroup;
	private String userId;
}
