package com.kh.meetAgain.sgroup.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Gboard extends Sgroup implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1997L;
	private int gbId;
	private String gId;
	private String userId;
	private String nickName;
	private String gbTitle;
	private String gbContent;
	private int gbRate;
	private Date gbDate;
	private String gbDel;
	private int gbRec;
	private boolean isNotice;
}
