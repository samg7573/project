package egovframework.sample.service;

import java.util.Date;

public class CommentbVO {//COMMENT_B 테이블
	
	private String id;//댓글 일련번호
	private String reg_user;//댓글 작성자
	private String mdfcn_user;//댓글 수정자(관리자)
	private String bbs_fk;//게시판 일련번호
	private String cmnt;//댓글 내용
	private Date reg_dt;//등록일시
	private Date mdfcn_dt;//수정일시
	private boolean editMode;//수정상태표시
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReg_user() {
		return reg_user;
	}
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public String getMdfcn_user() {
		return mdfcn_user;
	}
	public void setMdfcn_user(String mdfcn_user) {
		this.mdfcn_user = mdfcn_user;
	}
	public String getBbs_fk() {
		return bbs_fk;
	}
	public void setBbs_fk(String bbs_fk) {
		this.bbs_fk = bbs_fk;
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
	public boolean isEditMode() {
		return editMode;
	}
	public void setEditMode(boolean editMode) {
		this.editMode = editMode;
	}
	@Override
	public String toString() {
		return "CommentbVO [id=" + id + ", reg_user=" + reg_user + ", mdfcn_user=" + mdfcn_user + ", bbs_fk=" + bbs_fk
				+ ", cmnt=" + cmnt + ", reg_dt=" + reg_dt + ", mdfcn_dt=" + mdfcn_dt + ", editMode=" + editMode + "]";
	}
	
	

		
	
}
