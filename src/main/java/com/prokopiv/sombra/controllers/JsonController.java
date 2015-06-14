package com.prokopiv.sombra.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.prokopiv.sombra.model.Category;
import com.prokopiv.sombra.model.Search;
import com.prokopiv.sombra.service.CategoryService;
import com.prokopiv.sombra.service.ShopingCartService;

@Controller
public class JsonController {

	@Autowired ShopingCartService serviceCart;
	@Autowired Search search;
	@Autowired CategoryService categoryService;
	
	@RequestMapping(value = "json/tree", headers="Accept=application/json", method = RequestMethod.GET)
	public @ResponseBody List<Category> getMainMenu(){
		return categoryService.getSortCategoriesList();
	}
	
	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = "json/remove/{id}")
	public int removeProduct(@PathVariable(value = "id") String id){
		serviceCart.removeItemFromCart(id);
		return serviceCart.getProducts().size();
	}
	
	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = "json/addToCart/{id}")
	public void addProduct(@PathVariable(value = "id") String id){
		serviceCart.addProductToCart(id);
	}
}
