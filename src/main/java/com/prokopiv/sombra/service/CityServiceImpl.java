package com.prokopiv.sombra.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prokopiv.sombra.dao.CityDao;
import com.prokopiv.sombra.model.City;
import com.prokopiv.sombra.validation.Pagination;


@Service
public class CityServiceImpl implements CityService{

	@Autowired CityDao cityDao;
	
	@Override
	public void deleteCities(String id) {
		cityDao.deleteCities(id);
	}
	
	@Override
	public List<City> getCitiesList() {
		return cityDao.getCitiesList();
	}
	
	@Override
	public List<City> getCitiesList(Pagination pagination) {
		return cityDao.getCitiesList(pagination);
	}
	
	@Override
	public void insertCities(City city) {
		cityDao.insertCities(city);
	}
}
