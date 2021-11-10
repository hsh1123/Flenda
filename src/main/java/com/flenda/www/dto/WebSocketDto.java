package com.flenda.www.dto;

public class WebSocketDto {
		
	private String id;
	private String content;
	private int stat;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStat() {
		return stat;
	}
	public void setStat(int stat) {
		this.stat = stat;
	}
	
	
	@Override
	public String toString() {
		return "WebSocketDto [id=" + id + ", content=" + content + ", stat=" + stat + "]";
	}
	
	
	public WebSocketDto(String id, String content, int stat) {
		super();
		this.id = id;
		this.content = content;
		this.stat = stat;
	}
	
	
	
	
	
	
}
