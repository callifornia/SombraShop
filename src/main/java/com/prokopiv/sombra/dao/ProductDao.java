package com.prokopiv.sombra.dao;

import java.util.List;

import com.prokopiv.sombra.model.Product;
import com.prokopiv.sombra.service.ShopingCartServiceImpl;
import com.prokopiv.sombra.validation.Pagination;

public interface ProductDao {

	public List<Product> getProductsList(Pagination pagination);
	public Product getProduct(String id);
	public List<Product> getProductsListBySearchName(String name, Pagination pagination);
	public void insertProduct(Product product);
	public void checkout(ShopingCartServiceImpl shopingCart);
	public List<Product> getProductListByCategory(Pagination pagination, String id);
}
