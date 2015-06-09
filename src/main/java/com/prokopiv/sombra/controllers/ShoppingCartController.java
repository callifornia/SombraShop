package com.prokopiv.sombra.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.prokopiv.sombra.model.Category;
import com.prokopiv.sombra.model.Search;
import com.prokopiv.sombra.service.CategoryService;
import com.prokopiv.sombra.service.ShopingCartService;

@Controller
public class ShoppingCartController {
	
	@Autowired ShopingCartService serviceCart;
	@Autowired Search search;
	@Autowired CategoryService categoryService;
	
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(){
		serviceCart.checkout();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String getShopingCart(Model model){
		model.addAttribute("product", serviceCart.getProducts());
		model.addAttribute("search", search);
		return "cart";
	}
	
	@ResponseBody
	@RequestMapping(value = "json/tree", method = RequestMethod.GET)
	public List<Category> getMainMenu(){
		return categoryService.getSortCategoriesList();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "json/remove/{id}")
	public int removeProduct(@PathVariable(value = "id") String id){
		serviceCart.removeItemFromCart(id);
		return serviceCart.getProducts().size();
	}

	@ResponseBody
	@RequestMapping(value = "json/addToCart/{id}")
	public void addProduct(@PathVariable(value = "id") String id){
		serviceCart.addProductToCart(id);
	}
}