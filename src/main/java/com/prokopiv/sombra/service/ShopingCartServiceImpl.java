package com.prokopiv.sombra.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.prokopiv.sombra.dao.ProductDao;
import com.prokopiv.sombra.dao.ShopingDao;
import com.prokopiv.sombra.model.Product;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ShopingCartServiceImpl implements ShopingCartService, Serializable {
	

	private static final long serialVersionUID = 226603051652885383L;

	private List<Product> productList = new ArrayList<Product>();

	@Autowired ShopingDao shopingDao;
	@Autowired ProductDao productDao;
	
	@Override
	public boolean productExist(String id) {
		for(Product product : productList){
			if(product.getId().equals(id)) return true;
		}
		return false;
	}
	
	@Override
	public void checkout() {
		shopingDao.checkout(this);
		this.productList.clear();
	}
	
	@Override
	public void addProductToCart(String id) {
		Product product = productDao.getProduct(id);
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
