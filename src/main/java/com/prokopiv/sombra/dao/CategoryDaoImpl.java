package com.prokopiv.sombra.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.prokopiv.sombra.model.Category;

@Repository()
@Scope("singleton")
public class CategoryDaoImpl implements CategoryDao, InitializingBean {

	@Autowired DataSource dataSource;
	private List<Category> categoriesList;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("init method");
		initCategoryList();
	}
	
	private void initCategoryList(){
		System.out.println("piupiu");
		List<Category> categoryList = new ArrayList<Category>();
		String sql = "SELECT id, name, parent_id FROM category";
		try(Connection connection = dataSource.getConnection(); Statement st = connection.createStatement()){
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				Category category = new Category();
				category.setId(rs.getString("id"));
				category.setName(rs.getString("name"));
				category.setIdParent(rs.getString("parent_id"));
				categoryList.add(category);
			}
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		this.categoriesList = categoryList;
	}
	
	@Override
	public List<Category> getCategoriesList() {
		List<Category> clone = new ArrayList<Category>(categoriesList.size());
		for(Category category : categoriesList){
			Category cloneCategory = new Category();
			cloneCategory.setId(category.getId());
			cloneCategory.setName(category.getName());
			cloneCategory.setIdParent(category.getIdParent());
			clone.add(cloneCategory);
		}
		return clone;
	}
}
