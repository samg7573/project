package egovframework.sample.service;



import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class FeedbackVO {
	//id
	private String id;
	//제목
	private String ttl;
	//게시판내용
	private String bbs_cn;
	//사진
	private String photo;
	private MultipartFile uploadphoto;
	//좋아요수
	private int rcmdtn_cnt; 
	//작성 시간
	private Date reg_dt;
	//수정 시간
	private Date mdfcn_dt;
	private int view_num;
	
	
	public int getView_num() {
		return view_num;
	}
	public void setView_num(int view_num) {
		this.view_num = view_num;
	}
	//연결관계 : user id
	private String reg_user;
	private String mdfcn_user;
	
	//연결관계 : image id
	private String image_id;
	
	public String getImage_id() {
		return image_id;
	}
	public void setImage_id(String image_id) {
		this.image_id = image_id;
	}
	public MultipartFile getUploadphoto() {
		return uploadphoto;
	}
	public void setUploadphoto(MultipartFile uploadphoto) {
		this.uploadphoto = uploadphoto;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTtl() {
		return ttl;
	}
	public void setTtl(String ttl) {
		this.ttl = ttl;
	}
	public String getBbs_cn() {
		return bbs_cn;
	}
	public void setBbs_cn(String bbs_cn) {
		this.bbs_cn = bbs_cn;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getRcmdtn_cnt() {
		return rcmdtn_cnt;
	}
	public void setRcmdtn_cnt(int rcmdtn_cnt) {
		this.rcmdtn_cnt = rcmdtn_cnt;
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
	
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public String getReg_user() {
		return reg_user;
	}
	
	public String getMdfcn_user() {
		return mdfcn_user;
	}
	public void setMdfcn_user(String mdfcn_user) {
		this.mdfcn_user = mdfcn_user;
	}
	
}
