package com.prokopiv.sombra.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prokopiv.sombra.dao.CategoryDao;
import com.prokopiv.sombra.model.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired CategoryDao categoryDao;

	@Override
	public List<Category> getCategoryList() {
		return categoryDao.getCategoriesList();
	}
	
	@Override
	public String getSubCategories(String id) {
		String result = null;
		List<Category> categoryTree = getSortCategoriesList();
		Category categoryHead = null;
		for (Category cat : categoryTree) {
			categoryHead = getSubCategoryHead(cat, id);
			if(categoryHead != null){
				break; 
			} 
		} 
		List<Category> subCategoryList = getSubCategoryList(categoryHead, new ArrayList<Category>());
		result = getSubCategoryString(subCategoryList);
		return result;
	}

	@Override
	public List<Category> getSortCategoriesList() {
		List<Category> categoryList = new ArrayList<Category>(getCategoryList());
		List<Category> resultList = new ArrayList<Category>();
		List<String> idList = new ArrayList<String>();
		for (int i = 0; i < categoryList.size(); i++) {
			Category category = categoryList.get(i);
			if (!check(idList, category.getId())) {
				resultList.add(category);
			} 
			for (int j = i + 1; j < categoryList.size(); j++) {
				if (category.getId().equals(categoryList.get(j).getIdParent())) {
					category.getChildList().add(categoryList.get(j));
					idList.add(categoryList.get(j).getId());
				} 
			} 
		} 
		return resultList;
	}

	private String getSubCategoryString(List<Category> categoryList) {
		StringBuilder result = new StringBuilder();
		for (Category category : categoryList) {
			result.append(category.getId() + ", ");
		}
		result.deleteCharAt(result.length() - 2);
		result.delete(result.length() - 1, result.length());
		return result.toString();
	}

	private  List<Category> getSubCategoryList(Category category,	List<Category> resultList) {
		if (category.getChildList() != null) {
			for (Category cat : category.getChildList()) {
				getSubCategoryList(cat, resultList);
			}
		}
		resultList.add(category);
		return resultList;
	}

	private Category getSubCategoryHead(Category category, String id) {
		if (id.equals(category.getId())) {
			return category;
		}
		List<Category> list = category.getChildList();
		Category cat = null;
		for (int i = 0; list != null && i < list.size(); i++) {
			cat = getSubCategoryHead(list.get(i), id);
			if (cat != null) {
				return cat;
			}
		}
		return cat;
	}
	
	private boolean check(List<String> list, String id) {
		for (String s : list) {
			if (s.equals(id))
				return true;
		}
		return false;
	}
}
