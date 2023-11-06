package egovframework.sample.service;
import java.util.Date;

public class BoardVO {//BOARD 테이블

	private String id;//게시판 일련번호
	private String reg_user;//사용자
	private String mdfcn_user;//수정자
	private String ctgry_b;//게시판 카테고리
	private String ttl;//게시판 제목
	private String bbs_cn;//게시판 내용
	private Date reg_dt;//게시글 등록일자
	private Date mdfcn_dt;//게시글 수정일자
	private int rcmdin_cnt;//게시글 추천 수
	private String searchCondition;
	private String searchKeyWord;
	private int view_num; //조회수
	private int startIndex; // 페이지 시작 인덱스
    private int pageSize;   // 페이지당 표시할 게시물 수
    private int endIndex; // 페이지 종료 인덱스
    
    
    
    
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getView_num() {
		return view_num;
	}
	public void setView_num(int view_num) {
		this.view_num = view_num;
	}
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
	public String getCtgry_b() {
		return ctgry_b;
	}
	public void setCtgry_b(String ctgry_b) {
		this.ctgry_b = ctgry_b;
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
	public int getRcmdin_cnt() {
		return rcmdin_cnt;
	}
	public void setRcmdin_cnt(int rcmdin_cnt) {
		this.rcmdin_cnt = rcmdin_cnt;
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
	
	
	
	
	
	
	

	

}
