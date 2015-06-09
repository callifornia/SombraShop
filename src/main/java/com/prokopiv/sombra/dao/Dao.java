package com.prokopiv.sombra.dao;

import java.util.List;

import com.prokopiv.sombra.model.Category;
import com.prokopiv.sombra.model.City;
import com.prokopiv.sombra.model.Product;
import com.prokopiv.sombra.model.User;
import com.prokopiv.sombra.service.ShopingCartServiceImpl;
import com.prokopiv.sombra.validation.Pagination;

public interface Dao {

	// product
	public List<Product> getProductsList(Pagination pagination);
	public Product getProduct(String id);
	public List<Product> getProductsListBySearchName(String name, Pagination pagination);
	public void insertProduct(Product product);
	public void checkout(ShopingCartServiceImpl shopingCart);
	public List<Product> getProductListByCategory(Pagination pagination, String id);
	
	//user
	public List<User> getUserList(Pagination pagination);
	public void deleteUser(String id);
	public void recoveryUser(String id);
	public User getUserById(String id);
	public void updateUser(User user);
	public boolean userExist(String login);
	public void insertUser(User user);
	
	//cities
	public List<City> getCitiesList(Pagination pagination);
	public List<City> getCitiesList();
	public void insertCities(City city);
	public void deleteCities(String id);
	
	//category
	public List<Category> getCategoriesList();
	
}
