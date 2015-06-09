package com.prokopiv.sombra.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.prokopiv.sombra.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired DataSource dataSource;
	
	@Override
	public List<Category> getCategoriesList() {
		List<Category> categoryList = new ArrayList<Category>();
		String sql = "SELECT id, name, parent_id FROM Category";
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
		return categoryList;
	}
}
