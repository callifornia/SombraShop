package com.prokopiv.sombra.dao;

import java.util.List;

import com.prokopiv.sombra.model.City;
import com.prokopiv.sombra.validation.Pagination;

public interface CityDao {
		
	public List<City> getCitiesList(Pagination pagination);
	public List<City> getCitiesList();
	public void insertCities(City city);
	public void deleteCities(String id);

}
