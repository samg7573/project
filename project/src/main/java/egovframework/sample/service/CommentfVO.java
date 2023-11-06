package egovframework.sample.service;

import java.sql.Date;

public class CommentfVO {
	//댓글 번호
	private String id;
	//댓글내용
	private String cmnt;
	//작성 시간
	private Date reg_dt;
	//수정 시간
	private Date mdfcn_dt;
	//연결관계 게시판 일련번호
	private String bbs_fk;
	//작성자
	private String reg_user;
	//수정자
	private String mdfcn_user;
	
	private boolean editMode; //수정상태표시
	
	
	
	public String getBbs_fk() {
		return bbs_fk;
	}
	public void setBbs_fk(String bbs_fk) {
		this.bbs_fk = bbs_fk;
	}
	public boolean isEditMode() {
		return editMode;
	}
	public void setEditMode(boolean editMode) {
		this.editMode = editMode;
	}
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public void setMdfcn_user(String mdfcn_user) {
		this.mdfcn_user = mdfcn_user;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCmnt() {
		return cmnt;
	}
	public void setCmnt(String cmnt) {
		this.cmnt = cmnt;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public Date getMdfcn_dt() {
		return mdfcn_dt;
	}
	public void setMdfcn_dt(Date mdfcn_dt) {
		this.mdfcn_dt = mdfcn_dt;
	}
	public String getReg_user() {
		return reg_user;
	}
	public String getMdfcn_user() {
		return mdfcn_user;
	}
	
}
