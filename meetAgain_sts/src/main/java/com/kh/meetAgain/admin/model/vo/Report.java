package com.kh.meetAgain.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.meetAgain.sgroup.model.vo.GB_comment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report extends GB_comment implements Serializable {

	private static final long serialVersionUID = 731L;
	
	private int rcId;
	private String userId;
	private String rcInfo;
	private String targetId;
	private String stmt;
	private int rcType;
	private String rcContent;
	private int cId;
	private int gbId;
	private Date rcTime;
	private String tnickName;
	private int warn_cnt;
}
