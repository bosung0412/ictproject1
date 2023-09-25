package com.jeju.model.bean;

public class Event {
	private String eno;
	private String id;
	private String ename;
	private int ephoneno;
	private String eduration;
	private String econtent;
	private String epalce;
	private String emap;
	private String eimage1;
	private String eimage2;
	private String eimage3;
	private String eimage4;
	private String eimage5;
	private String regdate;
	public String getEno() {
		return eno;
	}
	public void setEno(String eno) {
		this.eno = eno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public int getEphoneno() {
		return ephoneno;
	}
	public void setEphoneno(int ephoneno) {
		this.ephoneno = ephoneno;
	}
	public String getEduration() {
		return eduration;
	}
	public void setEduration(String eduration) {
		this.eduration = eduration;
	}
	public String getEcontent() {
		return econtent;
	}
	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}
	public String getEpalce() {
		return epalce;
	}
	public void setEpalce(String epalce) {
		this.epalce = epalce;
	}
	public String getEmap() {
		return emap;
	}
	public void setEmap(String emap) {
		this.emap = emap;
	}
	public String getEimage1() {
		return eimage1;
	}
	public void setEimage1(String eimage1) {
		this.eimage1 = eimage1;
	}
	public String getEimage2() {
		return eimage2;
	}
	public void setEimage2(String eimage2) {
		this.eimage2 = eimage2;
	}
	public String getEimage3() {
		return eimage3;
	}
	public void setEimage3(String eimage3) {
		this.eimage3 = eimage3;
	}
	public String getEimage4() {
		return eimage4;
	}
	public void setEimage4(String eimage4) {
		this.eimage4 = eimage4;
	}
	public String getEimage5() {
		return eimage5;
	}
	public void setEimage5(String eimage5) {
		this.eimage5 = eimage5;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "Event [eno=" + eno + ", id=" + id + ", ename=" + ename + ", ephoneno=" + ephoneno + ", eduration="
				+ eduration + ", econtent=" + econtent + ", epalce=" + epalce + ", emap=" + emap + ", eimage1="
				+ eimage1 + ", eimage2=" + eimage2 + ", eimage3=" + eimage3 + ", eimage4=" + eimage4 + ", eimage5="
				+ eimage5 + ", regdate=" + regdate + "]";
	}
	
	public Event(String eno, String id, String ename, int ephoneno, String eduration, String econtent, String epalce,
			String emap, String eimage1, String eimage2, String eimage3, String eimage4, String eimage5,
			String regdate) {
		super();
		this.eno = eno;
		this.id = id;
		this.ename = ename;
		this.ephoneno = ephoneno;
		this.eduration = eduration;
		this.econtent = econtent;
		this.epalce = epalce;
		this.emap = emap;
		this.eimage1 = eimage1;
		this.eimage2 = eimage2;
		this.eimage3 = eimage3;
		this.eimage4 = eimage4;
		this.eimage5 = eimage5;
		this.regdate = regdate;
	}
	
	
	
}
