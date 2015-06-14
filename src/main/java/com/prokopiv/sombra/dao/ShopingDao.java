package com.prokopiv.sombra.dao;

import com.prokopiv.sombra.service.ShopingCartServiceImpl;

public interface ShopingDao {

	public void checkout(ShopingCartServiceImpl shopingCart);
}
