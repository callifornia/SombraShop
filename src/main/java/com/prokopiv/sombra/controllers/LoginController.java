package com.prokopiv.sombra.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.prokopiv.sombra.model.Search;
import com.prokopiv.sombra.service.CategoryService;
import com.prokopiv.sombra.service.ProductService;
import com.prokopiv.sombra.validation.Pagination;

@Controller
public class LoginController {

	@Autowired Search search;
	@Autowired Pagination pagination;
	@Autowired ProductService productService;
	@Autowired CategoryService categoryService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model){
		model.addAttribute("search", search);
		return "login";
	}
	
	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(Model model){
		model.addAttribute("search", search);
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model, Principal principal){
		return "redirect:login";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String permition(ModelMap model){
		System.out.println("You dont have permition");
		return "redirect:login";
	}
}