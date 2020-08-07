package com.kh.meetAgain.sgroup.model.vo;

import com.kh.meetAgain.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor 
@NoArgsConstructor
public class Joing extends Member {

	private static final long serialVersionUID = 3456L;
	private String userId;
	private String gId;
	private String isCpt;
	private int isReady;
	private String isOut;
	private String isLeave;
	private String joinType;

}
