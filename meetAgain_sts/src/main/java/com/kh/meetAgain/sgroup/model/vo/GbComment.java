package com.kh.meetAgain.sgroup.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GbComment extends Gboard implements Serializable {

	private static final long serialVersionUID = 802L;
	
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
