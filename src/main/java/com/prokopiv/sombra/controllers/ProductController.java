package com.prokopiv.sombra.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.prokopiv.sombra.model.Category;
import com.prokopiv.sombra.model.City;
import com.prokopiv.sombra.model.Product;
import com.prokopiv.sombra.model.Search;
import com.prokopiv.sombra.service.CategoryService;
import com.prokopiv.sombra.service.CityService;
import com.prokopiv.sombra.service.ProductService;
import com.prokopiv.sombra.service.ShopingCartService;
import com.prokopiv.sombra.validation.Pagination;
import com.prokopiv.sombra.validation.ProductValidation;

@Controller
public class ProductController {
	
	@Autowired ProductValidation productValidation;
	@Autowired Search search;
	@Autowired Pagination pagination;
	@Autowired ShopingCartService serviceCart;
	@Autowired ProductService productService;
	@Autowired CategoryService categoryService;
	@Autowired CityService cityService;
	

	@InitBinder(value = "product")
	private void initProductBinder(WebDataBinder dataBinder){
		dataBinder.setValidator(productValidation);
	}
	
	@RequestMapping(value = "/lot/{id}", method = RequestMethod.GET)
	public String getPById(@PathVariable(value = "id")  String id, Model model){
		model.addAttribute("lot", productService.getProduct(id));
		model.addAttribute("productExist", serviceCart.productExist(id));
		model.addAttribute("search", search);
		return "viewLot";
	}
	
	@RequestMapping(value = "/adminCreateItem", method = RequestMethod.GET)
	public String addProduct(@ModelAttribute(value = "product") Product product, Model model)	{
		model.addAttribute("search", search);
		Map<String, String> mapCategory = new HashMap<String, String>();
		for(Category category : categoryService.getCategoryList()){
			mapCategory.put(category.getId(), category.getName());
		}
		Map<Boolean, String> mapInStock = new HashMap<Boolean, String>();
		mapInStock.put(true, "Yes");
		mapInStock.put(false, "No");
		Map<String, String> mapLocation = new HashMap<String, String>();
		
		for(City city :  cityService.getCitiesList() ){
			mapLocation.put(city.getId(), city.getName());
		}
		model.addAttribute("location", mapLocation);
		model.addAttribute("inStock", mapInStock);
		model.addAttribute("categories", mapCategory);
		return "createItem";
	}

	@RequestMapping(value = "/createLot", method = RequestMethod.POST)
	public String createProduct(@Validated Product product, BindingResult bindingResult, Model model)	{
		if(bindingResult.hasErrors()){
			model.addAttribute("product", product);
			model.addAttribute("search", search);
			Map<String, String> mapCategory = new HashMap<String, String>();
			for(Category category : categoryService.getCategoryList()){
				mapCategory.put(category.getId(), category.getName());
			}
			Map<Boolean, String> mapInStock = new HashMap<Boolean, String>();
			mapInStock.put(true, "Yes");
			mapInStock.put(false, "No");
			Map<String, String> mapLocation = new HashMap<String, String>();
			
			for(City city : cityService.getCitiesList(pagination) ){
				mapLocation.put(city.getId(), city.getName());
			}
			model.addAttribute("location", mapLocation);
			model.addAttribute("inStock", mapInStock);
			model.addAttribute("categories", mapCategory);
			return "createItem";
		} else {
			productService.addProduct(product);
			return "redirect:/adminEditUser";
		}
	}
	
	@RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
	public String getProductByCategory(@PathVariable(value = "id") String id, Model model) {
		pagination.setCurrentPage(1);
		model.addAttribute("search", search);
		model.addAttribute("pagi", pagination);
		model.addAttribute("product", productService.getProductListByCategory(pagination, id));
		model.addAttribute("categoryId", id);
		return "category";
	}	
	
	@RequestMapping(value = "/category/{id}/{page}", method = RequestMethod.GET)
	public String getProductByCategory(@PathVariable(value = "id") String id, @PathVariable(value = "page") Integer page, Model model) {
		pagination.setCurrentPage(page);
		model.addAttribute("search", search);
		model.addAttribute("pagi", pagination);
		model.addAttribute("product", productService.getProductListByCategory(pagination, id));
		model.addAttribute("categoryId", id);
		return "category";
	}	
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(@ModelAttribute(value = "search") Search search, RedirectAttributes redirect, Model model){
		redirect.addFlashAttribute("searchRequest123", search.getSearchRow());
		return "redirect:/1";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, RedirectAttributes redirect) {
		pagination.setCurrentPage(1);
		model.addAttribute("category", categoryService.getCategoryList());
		model.addAttribute("search", search);
		model.addAttribute("pagi", pagination);
		model.addAttribute("product", productService.getProductsBySearch(search.getSearchRow(), pagination));
		return "home";
	}
	
	@RequestMapping(value = "/{page}", method = RequestMethod.GET)
	public String home(@PathVariable(value = "page") Integer page, @ModelAttribute("searchRequest123") String searchRedirect, Model model) {
		pagination.setCurrentPage(page);
		model.addAttribute("search", search);
		model.addAttribute("pagi", pagination);
		model.addAttribute("product", productService.getProductsBySearch(searchRedirect, pagination));
		return "home";
	}
}