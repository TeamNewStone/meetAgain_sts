package com.kh.meetAgain.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberShip extends Member implements Serializable {
	
	private static final long serialVersionUID = 8282L;
	private String userId;
	private Date joinDate;
	private Date quitDate;

}
