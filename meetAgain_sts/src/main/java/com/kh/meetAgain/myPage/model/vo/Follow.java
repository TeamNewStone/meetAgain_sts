package com.kh.meetAgain.myPage.model.vo;

import java.io.Serializable;

import com.kh.meetAgain.member.model.vo.UserTMI;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Follow extends UserTMI implements Serializable {

	private static final long serialVersionUID = 1000L;

	private String follower;
	private String followin;

}
