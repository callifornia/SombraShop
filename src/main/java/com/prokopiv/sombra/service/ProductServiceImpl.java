package com.prokopiv.sombra.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prokopiv.sombra.dao.ProductDao;
import com.prokopiv.sombra.model.Product;
import com.prokopiv.sombra.validation.Pagination;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired ProductDao productDao;
	@Autowired CategoryService categoruService;
	
	@Override
	public void addProduct(Product product) {
		productDao.insertProduct(product);
	}
	
	@Override
	public Product getProduct(String id) {
		return productDao.getProduct(id);
	}
	
	@Override
	public List<Product> getProductListByCategory(Pagination pagination, String id) {
		String categoryIds = categoruService.getSubCategories(id);
		System.out.println(categoryIds);
		return productDao.getProductListByCategory(pagination, categoryIds);
	}
	
	@Override
	public List<Product> getProductsBySearch(String search,	Pagination pagination) {
		if(search == null || search.isEmpty() || search.length() < 0) return getProductsList(pagination);
		return productDao.getProductsListBySearchName(search, pagination);
	}
	
	@Override
	public List<Product> getProductsList(Pagination pagination) {
		return productDao.getProductsList(pagination);
	}
}
