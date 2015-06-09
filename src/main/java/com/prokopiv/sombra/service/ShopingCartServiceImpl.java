package com.prokopiv.sombra.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.prokopiv.sombra.dao.Dao;
import com.prokopiv.sombra.model.Product;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ShopingCartServiceImpl implements ShopingCartService {

	private List<Product> productList = new ArrayList<Product>();

	@Autowired Dao dao;
	
	@Override
	public boolean productExist(String id) {
		for(Product product : productList){
			if(product.getId().equals(id)) return true;
		}
		return false;
	}
	
	@Override
	public void checkout() {
		dao.checkout(this);
		this.productList.clear();
	}
	
	@Override
	public void addProductToCart(String id) {
		Product product = dao.getProduct(id);
		productList.add(product);
	}
	
	@Override
	public void removeItemFromCart(String id) {
		Iterator<Product> iterator = this.productList.iterator();
		while(iterator.hasNext()){
			if(iterator.next().getId().equals(id)) iterator.remove();
		}
	}
	
	public List<Product> getProducts(){
		return this.productList;
	}
	
}
