package com.prokopiv.sombra.service;

import java.util.List;

import com.prokopiv.sombra.model.Product;
import com.prokopiv.sombra.validation.Pagination;

public interface ProductService {

	public List<Product> getProductsList(Pagination pagination);
	public Product getProduct(String id);
	public List<Product> getProductsBySearch(String search, Pagination pagination); 
	public void addProduct(Product product);
	public List<Product> getProductListByCategory(Pagination pagination, String id);
}
