package com.kh.meetAgain.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserTMI extends Member {

	private static final long serialVersionUID = 9701L;
	
	private String mbti;
	private String blood;
	private String keyword;
	private String userImg;

}
