package com.prokopiv.sombra.controllers;

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

import com.prokopiv.sombra.model.City;
import com.prokopiv.sombra.model.Search;
import com.prokopiv.sombra.model.User;
import com.prokopiv.sombra.service.CityService;
import com.prokopiv.sombra.service.UserService;
import com.prokopiv.sombra.validation.Pagination;
import com.prokopiv.sombra.validation.UserValidation;

@Controller
public class AdminController {

	@Autowired Search search;
	@Autowired Pagination pagination;
	@Autowired UserValidation userFormValidation;
	@Autowired UserService userService;
	@Autowired CityService cityService;
	
	@InitBinder(value = "user")
	private void initUserBinder(WebDataBinder dataBinder){
		dataBinder.setValidator(userFormValidation);
	}
	
	@RequestMapping(value = "/adminEditUser", method = RequestMethod.GET)
	public String userEdit(Model model){
		pagination.setCurrentPage(1);
		model.addAttribute("search", search);
		model.addAttribute("pagi", pagination);
		model.addAttribute("users", userService.getUserList(pagination));
		return "adminUserEdit";
	}
	
	@RequestMapping(value = "/adminEditUser/{page}", method = RequestMethod.GET)
	public String userEdit(@PathVariable(value = "page") Integer page, Model model){
		pagination.setCurrentPage(page);
		model.addAttribute("search", search);
		model.addAttribute("pagi", pagination);
		model.addAttribute("users", userService.getUserList(pagination));
		return "adminUserEdit";
	}
	
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String userDelete(@PathVariable(value = "id") String id, Model model){
		userService.deleteUser(id);
		return "redirect:/adminEditUser";
	}
	
	@RequestMapping(value = "/recovery/{id}", method = RequestMethod.GET)
	public String userRecovery(@PathVariable(value = "id") String id, Model model){
		userService.recoveryUser(id);
		return "redirect:/adminEditUser";
	}
	
	@RequestMapping(value = "/userEdit/{id}", method = RequestMethod.GET)
	public String userEdit(@PathVariable(value = "id") String id, Model model){
		model.addAttribute("search", search);
		model.addAttribute("user", userService.getUserById(id));
		return "userEdit";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String userUpdate(@ModelAttribute(value="user") @Validated User user, BindingResult bindingResult, Model model){
		if(bindingResult.hasErrors()){
			model.addAttribute("search", search);
			model.addAttribute("user", user);
			return "userEdit";
		} else {
			userService.updateUser(user);
			return "redirect:/adminEditUser";
		}
	}
	
	@RequestMapping(value = "/adminEditCities", method = RequestMethod.GET)
	public String citiesEdit(@ModelAttribute(value = "city") City city, Model model){
		pagination.setCurrentPage(1);
		model.addAttribute("search", search);
		model.addAttribute("pagi", pagination);
		model.addAttribute("cities", cityService.getCitiesList(pagination));
		return "adminCitiesEdit";
	}
	
	@RequestMapping(value = "/adminEditCities/{page}", method = RequestMethod.GET)
	public String cityEdit(@PathVariable(value = "page") Integer page, @ModelAttribute(value = "city") City city, Model model){
		pagination.setCurrentPage(page);
		model.addAttribute("search", search);
		model.addAttribute("pagi", pagination);
		model.addAttribute("cities", cityService.getCitiesList(pagination));
		return "adminCitiesEdit";
	}
	
	@RequestMapping(value = "/deleteCity/{id}", method = RequestMethod.GET)
	public String cityDelete(@PathVariable(value = "id") String id, Model model){
		cityService.deleteCities(id);
		return "redirect:/adminEditCities";
	}
	
	@RequestMapping(value = "/insertCity", method = RequestMethod.POST)
	public String cityReregister(City city, Model model)	{
		cityService.insertCities(city);
		return "redirect:/adminEditCities";
	}

	@RequestMapping(value = "/join-create", method = RequestMethod.GET)
	public String userRegistration(@ModelAttribute(value = "user") User user, Model model)	{
		model.addAttribute("search", search);
		return "userRegister";
	}
	
	
	@RequestMapping(value = "/insert-user", method = RequestMethod.POST)
	public String insertAnonimus(@Validated User user, BindingResult bindingResult, Model model)	{
		if(bindingResult.hasErrors()){
			model.addAttribute("user", user);
			model.addAttribute("search", search);
			return "userRegister";
		} else {
			userService.insertUser(user);
			return "redirect:/login";
		}
	}
}
