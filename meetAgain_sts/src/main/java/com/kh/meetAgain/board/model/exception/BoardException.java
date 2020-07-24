package com.kh.meetAgain.board.model.exception;

public class BoardException extends RuntimeException {

	private static final long serialVersionUID = 113L;

	public BoardException() {
		super();
	}

	public BoardException(String message) {
		super("Board 에러 발생 : " + message);
	}
}
