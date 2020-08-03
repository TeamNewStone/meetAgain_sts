package com.kh.meetAgain.sgroup.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor 
@NoArgsConstructor
public class Joing {

	private String userId;
	private String gId;
	private String isCpt;
	private int isReady;
	private String isOut;
	private String isLeave;
}
