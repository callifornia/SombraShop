package com.prokopiv.sombra.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.prokopiv.sombra.model.User;
import com.prokopiv.sombra.service.UserService;

@Repository
public class UserValidation implements Validator {

	@Autowired UserService userService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		if(user.getId() == null){
			if(user.getLogin().isEmpty() || user.getLogin().length() < 4 || user.getLogin().length() > 40){
				errors.rejectValue("login", "user.err.login");				
			}
			
			if (!errors.hasFieldErrors("login") && userService.userExist(user.getLogin())){
				errors.rejectValue("login", "user.err.login.exist");
			} 			
			if (user.getPassword().isEmpty() || user.getPassword().length() < 4	|| user.getPassword().length() > 40){
				errors.rejectValue("password", "user.err.password");
			}
			System.out.println("hehehehehe");
		}
		

		if (!isPhoneNumberValid(user.getPhone())) {
			errors.rejectValue("phone", "user.err.phone");
		}
		if(user.getLastName().isEmpty() || user.getLastName().length() > 50){
			errors.rejectValue("lastName", "user.err.lastName");
		}
		if(user.getFirstName().isEmpty() || user.getFirstName().length() > 50){
			errors.rejectValue("firstName", "user.err.firstName");
		}
		if(!EmailValidator.getInstance().isValid(user.getEmail())){
			errors.rejectValue("email", "user.err.email");
		}
	}
	
	private boolean isPhoneNumberValid(String phoneNumber){  
		String expression = "^((8|\\+3)[\\- ]?)?(\\(?\\d{3}\\)?[\\- ]?)?[\\d\\- ]{7,10}$";
		return isValid(phoneNumber, expression);
	}
	
	private boolean isValid(String inputString, String expression){
		boolean isValid = false;  
		CharSequence valid = inputString;
		Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);  
		Matcher matcher = pattern.matcher(valid);  
		if(matcher.matches()){  
			isValid = true;  
		}  
		return isValid;  
	}
}