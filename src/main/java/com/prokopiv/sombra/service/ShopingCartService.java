package com.prokopiv.sombra.service;

import java.util.List;

import com.prokopiv.sombra.model.Product;

public interface ShopingCartService {

	public List<Product> getProducts();
	public void addProductToCart(String id);
	public void removeItemFromCart(String id);
	public void checkout();
	public boolean productExist(String id);
}
