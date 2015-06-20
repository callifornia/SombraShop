package com.prokopiv.sombra.validation;

import org.springframework.stereotype.Repository;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.prokopiv.sombra.model.Product;
@Repository
public class ProductValidation implements Validator {

	
	@Override
	public boolean supports(Class<?> clazz) {
		return Product.class.equals(clazz);
	}
	
	public void validate(Object target, Errors errors) {
		Product product = (Product) target;
		
		if(product.getName().isEmpty() || product.getName().length() > 20){
			errors.rejectValue("name", "create.product.error.name");
		}
		
		if(!isDouble(product.getPrice())){
			errors.rejectValue("price", "create.product.error.price");
		}
		
		if(product.getDescription().length() > 5000){
			errors.rejectValue("description", "create.product.error.description");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "inStock","create.product.error.inStock");
		
		if(product.getCondition().length() > 50){
			errors.rejectValue("condition", "create.product.error.condition");
		}
	};
	
	private boolean isDouble(String string){
		boolean result = true;
		try{
			Double.parseDouble(string);
		} catch (NumberFormatException ex){
			result = !result;
		}
		return result;
	}
}
