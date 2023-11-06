package egovframework.sample.service;

public class PartVO {
	private String ID;
	private String CLSF_NM;
	
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getCLSF_NM() {
		return CLSF_NM;
	}
	
	
	public void setCLSF_NM(String cLSF_NM) {
		CLSF_NM = cLSF_NM;
	}
	@Override
	public String toString() {
		return "categorybVO [ID=" + ID + ", CLSF_NM=" + CLSF_NM + "]";
	}
}
