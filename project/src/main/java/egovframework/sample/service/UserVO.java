package egovframework.sample.service;

public class UserVO {
	//user번호
	private String  id;
	//이름
	private String user_nm;
	//닉네임
	private String nick_nm;
	//아이디
	private String user_id;
	//비밀번호
	private String user_pswd;
	//성별
	private String sexdstn;
	//이메일
	private String eml;
	//회원등급
	private String mbr_grd;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getNick_nm() {
		return nick_nm;
	}
	public void setNick_nm(String nick_nm) {
		this.nick_nm = nick_nm;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pswd() {
		return user_pswd;
	}
	public void setUser_pswd(String user_pswd) {
		this.user_pswd = user_pswd;
	}
	public String getSexdstn() {
		return sexdstn;
	}
	public void setSexdstn(String sexdstn) {
		this.sexdstn = sexdstn;
	}
	public String getEml() {
		return eml;
	}
	public void setEml(String eml) {
		this.eml = eml;
	}
	public String getMbr_grd() {
		return mbr_grd;
	}
	public void setMbr_grd(String mbr_grd) {
		this.mbr_grd = mbr_grd;
	}
	
	
	public UserVO(String id, String user_nm, String nick_nm, String user_id, String user_pswd, String sexdstn, String eml,
			String mbr_grd) {
	
		this.id = id;
		this.user_nm = user_nm;
		this.nick_nm = nick_nm;
		this.user_id = user_id;
		this.user_pswd = user_pswd;
		this.sexdstn = sexdstn;
		this.eml = eml;
		this.mbr_grd = mbr_grd;
	}
	
	public UserVO(String id, String nick_nm) {
		super();
		this.id = id;
		this.nick_nm = nick_nm;
	}
	
	
	
}