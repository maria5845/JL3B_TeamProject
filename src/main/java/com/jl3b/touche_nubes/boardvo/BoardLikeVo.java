package com.jl3b.touche_nubes.boardvo;

public class BoardLikeVo {
	
	private int board_like_no;
	private int board_no;
	private int member_no;
	private String board_like;
	
	public BoardLikeVo() {
		super();
	}
	
	public BoardLikeVo(int board_like_no, int board_no, int member_no, String board_like) {
		super();
		this.board_like_no = board_like_no;
		this.board_no = board_no;
		this.member_no = member_no;
		this.board_like = board_like;
	}
	public int getBoard_like_no() {
		return board_like_no;
	}
	public void setBoard_like_no(int board_like_no) {
		this.board_like_no = board_like_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getBoard_like() {
		return board_like;
	}
	public void setBoard_like(String board_like) {
		this.board_like = board_like;
	}
	
}
