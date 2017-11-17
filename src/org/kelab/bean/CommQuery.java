package org.kelab.bean;

import java.util.HashMap;
import java.util.Map;

public class CommQuery {
	int page;
	int pageSize;
	String start;
	String end;
	String keyWord;
	String other;
	int naviId;
	Map<Object, Object> map = new HashMap<Object, Object>();
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public Map<Object, Object> getMap() {
		return map;
	}
	public void setMap(Map<Object, Object> map) {
		this.map = map;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public int getNaviId() {
		return naviId;
	}
	public void setNaviId(int naviId) {
		this.naviId = naviId;
	}
	
	
}
