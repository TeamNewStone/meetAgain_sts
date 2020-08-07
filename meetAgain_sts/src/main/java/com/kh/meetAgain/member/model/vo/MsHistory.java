package com.kh.meetAgain.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MsHistory extends MemberShip implements Serializable {

	private static final long serialVersionUID = 981L;
	private String userId;
	private int payment;
	private Date payDate;
	private int discount;

}
