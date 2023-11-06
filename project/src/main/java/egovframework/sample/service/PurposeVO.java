package egovframework.sample.service;

import java.sql.Date;
import java.util.Optional;

public class PurposeVO {
	private String prps_id;
	
	// 한 주 총 운동시간
	private String wk;
	// 한 주 총 칼로리
	private Long allcal;

	// 등록일
	private Date reg_dt;
	
	// 연
	private String prps_y;
	
	// 월
	private String prps_m;
	
	// 월 주차
	private String mnth_wk;
		
	// 작성자
	private UserVO reg_user;

	public String getPrps_id() {
		return prps_id;
	}

	public void setPrps_id(String prps_id) {
		this.prps_id = prps_id;
	}

	public String getWk() {
		return wk;
	}

	public void setWk(String wk) {
		this.wk = wk;
	}

	public Long getAllcal() {
		return allcal;
	}

	public void setAllcal(Long allcal) {
		this.allcal = allcal;
	}

	public Date getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getPrps_y() {
		return prps_y;
	}

	public void setPrps_y(String prps_y) {
		this.prps_y = prps_y;
	}

	public String getPrps_m() {
		return prps_m;
	}

	public void setPrps_m(String prps_m) {
		this.prps_m = prps_m;
	}

	public String getMnth_wk() {
		return mnth_wk;
	}

	public void setMnth_wk(String mnth_wk) {
		this.mnth_wk = mnth_wk;
	}

	public UserVO getReg_user() {
		return reg_user;
	}

	public void setReg_user(UserVO reg_user) {
		this.reg_user = reg_user;
	}

	public PurposeVO() {
	}

	public PurposeVO(String prps_id, String wk, Long allcal, Date reg_dt, String prps_y, String prps_m, String mnth_wk,
			UserVO reg_user) {
		this.prps_id = prps_id;
		this.wk = wk;
		this.allcal = allcal;
		this.reg_dt = reg_dt;
		this.prps_y = prps_y;
		this.prps_m = prps_m;
		this.mnth_wk = mnth_wk;
		this.reg_user = reg_user;
	}
	
}
