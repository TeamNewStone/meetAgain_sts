package com.kh.meetAgain.sgroup.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor 
@NoArgsConstructor
public class Review implements Serializable{       
	/**
	 * 
	 */
	private static final long serialVersionUID = 197L;
	
	private int rvId;
	private String userId;
	private String gId;
	private String rvContent;
	private String rvImage;
	private int rvStar;
	private int rvLike;

}
