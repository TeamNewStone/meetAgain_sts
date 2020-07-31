package com.kh.meetAgain.sgroup.model.exception;

public class SgroupException extends RuntimeException {

	private static final long serialVersionUID = 113L;

	public SgroupException() {
		super();
	}

	public SgroupException(String message) {
		super("Board 에러 발생 : " + message);
	}
}
