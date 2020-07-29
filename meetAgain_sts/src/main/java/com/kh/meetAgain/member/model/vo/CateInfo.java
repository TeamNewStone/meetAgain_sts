package com.kh.meetAgain.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CateInfo extends UserTMI {
	
	private static final long serialVersionUID = 1L;
	
	private String userId;
	private String[] cateId;
	private String cate_id; /* DBMS와 연결할 가상 변수 */
}
