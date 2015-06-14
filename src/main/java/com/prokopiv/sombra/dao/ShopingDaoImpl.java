package com.prokopiv.sombra.dao;

import org.springframework.stereotype.Repository;

import com.prokopiv.sombra.model.Product;
import com.prokopiv.sombra.service.ShopingCartServiceImpl;

@Repository
public class ShopingDaoImpl implements ShopingDao{

	@Override
	public void checkout(ShopingCartServiceImpl shopingCart) {
		for(Product product : shopingCart.getProducts()){
			System.out.println("Insert into Data Base:" + product.getId());
		}
	}

}
