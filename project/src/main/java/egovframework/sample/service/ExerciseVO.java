package egovframework.sample.service;

import java.sql.Date;

public class ExerciseVO {

	// id
	private String excr_id;
	// 제목
	private String ttl;
	// 체중
	private Long wght;
	// 칼로리
	private Long cal;
	// 운동시간
	private String excr_tm;
	// 공개여부
	private boolean prvt;
	// 작성일자
	private Date reg_dt;
	// 수정일자
	private Date mdfcn_dt;
	// 조회수
	private Long inq_cnt;
	
	private String searchCondition;
	private String searchKeyWord;

	private Date startdt;
	private Date enddt;

	// UserVO id (1:n관계)
	private UserVO reg_user;
	private UserVO mdfcn_user;
	// 분류
	private Category_EVO ctgry_e;
	public String getExcr_id() {
		return excr_id;
	}
	public void setExcr_id(String excr_id) {
		this.excr_id = excr_id;
	}
	public String getTtl() {
		return ttl;
	}
	public void setTtl(String ttl) {
		this.ttl = ttl;
	}
	public Long getWght() {
		return wght;
	}
	public void setWght(Long wght) {
		this.wght = wght;
	}
	public Long getCal() {
		return cal;
	}
	public void setCal(Long cal) {
		this.cal = cal;
	}
	public String getExcr_tm() {
		return excr_tm;
	}
	public void setExcr_tm(String excr_tm) {
		this.excr_tm = excr_tm;
	}
	public boolean isPrvt() {
		return prvt;
	}
	public void setPrvt(boolean prvt) {
		this.prvt = prvt;
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
	public Long getInq_cnt() {
		return inq_cnt;
	}
	public void setInq_cnt(Long inq_cnt) {
		this.inq_cnt = inq_cnt;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyWord() {
		return searchKeyWord;
	}
	public void setSearchKeyWord(String searchKeyWord) {
		this.searchKeyWord = searchKeyWord;
	}
	public UserVO getReg_user() {
		return reg_user;
	}
	public void setReg_user(UserVO reg_user) {
		this.reg_user = reg_user;
	}
	public UserVO getMdfcn_user() {
		return mdfcn_user;
	}
	public void setMdfcn_user(UserVO mdfcn_user) {
		this.mdfcn_user = mdfcn_user;
	}
	public Category_EVO getCtgry_e() {
		return ctgry_e;
	}
	public void setCtgry_e(Category_EVO ctgry_e) {
		this.ctgry_e = ctgry_e;
	}
	public Date getStartdt() {
		return startdt;
	}
	public void setStartdt(Date startdt) {
		this.startdt = startdt;
	}
	public Date getEnddt() {
		return enddt;
	}
	public void setEnddt(Date enddt) {
		this.enddt = enddt;
	}
	public ExerciseVO() {
	}
	public ExerciseVO(String excr_id, String ttl, Long wght, Long cal, String excr_tm, boolean prvt, Date reg_dt,
			Date mdfcn_dt, Long inq_cnt, String searchCondition, String searchKeyWord, Date startdt, Date enddt,
			UserVO reg_user, UserVO mdfcn_user, Category_EVO ctgry_e) {
		this.excr_id = excr_id;
		this.ttl = ttl;
		this.wght = wght;
		this.cal = cal;
		this.excr_tm = excr_tm;
		this.prvt = prvt;
		this.reg_dt = reg_dt;
		this.mdfcn_dt = mdfcn_dt;
		this.inq_cnt = inq_cnt;
		this.searchCondition = searchCondition;
		this.searchKeyWord = searchKeyWord;
		this.startdt = startdt;
		this.enddt = enddt;
		this.reg_user = reg_user;
		this.mdfcn_user = mdfcn_user;
		this.ctgry_e = ctgry_e;
	}


}
