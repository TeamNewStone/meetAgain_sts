package com.kh.meetAgain.sgroup.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GB_comment extends Gboard implements Serializable {

	private static final long serialVersionUID = 6679L;
	
	private int cId;
	private int gbId;
	private String userId;
	private Date cDate;
	private String cContent;
	private int cRef;
	private int cLevel;
	private int cRec;
	private String cDel;
}
