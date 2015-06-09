package com.prokopiv.sombra.service;

import java.util.List;

import com.prokopiv.sombra.model.City;
import com.prokopiv.sombra.validation.Pagination;

public interface CityService {

	public List<City> getCitiesList(Pagination pagination);
	public List<City> getCitiesList();
	public void insertCities(City city);
	public void deleteCities(String id);
}
