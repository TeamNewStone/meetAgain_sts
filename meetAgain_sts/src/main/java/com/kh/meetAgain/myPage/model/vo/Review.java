package com.kh.meetAgain.myPage.model.vo;

import java.io.Serializable;

import com.kh.meetAgain.sgroup.model.vo.Sgroup;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor 
@NoArgsConstructor
public class Review extends Sgroup implements Serializable{       
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
