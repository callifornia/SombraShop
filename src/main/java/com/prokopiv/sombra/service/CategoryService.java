package com.prokopiv.sombra.service;

import java.util.List;

import com.prokopiv.sombra.model.Category;

public interface CategoryService {

	public List<Category> getSortCategoriesList();
	public List<Category> getCategoryList();
	public String getSubCategories(String id);
}
