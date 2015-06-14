package com.prokopiv.sombra.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
}