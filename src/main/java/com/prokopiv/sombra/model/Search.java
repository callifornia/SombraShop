package com.prokopiv.sombra.model;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

@Component
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Search {

	private String searchType = "all";
	private String searchRow;
	
	public Search() {
	}
	
	public String getSearchRow() {
		return searchRow;
	}

	public void setSearchRow(String searchRow) {
		this.searchRow = searchRow;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	@Override
	public String toString() {
		return "searchType: " + this.searchType + ", searchRow: " + this.searchRow;
	}
}
