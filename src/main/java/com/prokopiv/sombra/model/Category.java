package com.prokopiv.sombra.model;

import java.util.ArrayList;
import java.util.List;

public class Category {

	private String id;
	private String name;
	private String idParent;
	private List<Category> childList = null;
	
	public Category() {
		this.childList = new ArrayList<Category>();
	}
	
	public List<Category> getChildList() {
		return childList;
	}
	public void setChildList(List<Category> childList) {
		this.childList = childList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdParent() {
		return idParent;
	}
	public void setIdParent(String idParent) {
		this.idParent = idParent;
	}
}
