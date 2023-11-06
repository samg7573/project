package egovframework.sample.service;

public class Category_EVO {
	private String e_ctgry_id;
	//카테고리 분류이름
	private String clsf_nm;
	public Category_EVO() {
		// TODO Auto-generated constructor stub
	}
	public String getE_ctgry_id() {
		return e_ctgry_id;
	}
	public void setE_ctgry_id(String e_ctgry_id) {
		this.e_ctgry_id = e_ctgry_id;
	}
	public String getClsf_nm() {
		return clsf_nm;
	}
	public void setClsf_nm(String clsf_nm) {
		this.clsf_nm = clsf_nm;
	}
	public Category_EVO(String e_ctgry_id, String clsf_nm) {
		this.e_ctgry_id = e_ctgry_id;
		this.clsf_nm = clsf_nm;
	}
	
}
