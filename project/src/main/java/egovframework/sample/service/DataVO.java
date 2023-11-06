package egovframework.sample.service;

public class DataVO {
	private String id;
	private String part;
	private String youtuber;
	private String link;
	private String framelink;
	
	public DataVO() {}
	
	public String getId() {
		return id;
	}
	public String getYoutuber() {
		return youtuber;
	}

	public void setYoutuber(String youtuber) {
		this.youtuber = youtuber;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getFramelink() {
		return framelink;
	}

	public void setFramelink(String framelink) {
		this.framelink = framelink;
	}

	public DataVO(String id, String part, String youtuber, String link, String framelink) {
		super();
		this.id = id;
		this.part = part;
		this.youtuber = youtuber;
		this.link = link;
		this.framelink = framelink;
	}
	
	
	
}
