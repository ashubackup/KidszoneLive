package com.Message;

public class Message 
{
	private String msg;
	private String css;
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Message(String msg, String css) {
		super();
		this.msg = msg;
		this.css = css;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCss() {
		return css;
	}
	public void setCss(String css) {
		this.css = css;
	}
}
