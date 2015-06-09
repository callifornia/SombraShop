package com.prokopiv.sombra.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.prokopiv.sombra.model.City;
import com.prokopiv.sombra.validation.Pagination;


@Repository
public class CityDaoImpl implements CityDao {

	@Autowired DataSource dataSource;
	
	@Override
	public void deleteCities(String id) {
		String sql = "DELETE FROM location WHERE id = ?";
		try (Connection connection = dataSource.getConnection(); PreparedStatement ps = connection.prepareStatement(sql)){
			connection.setAutoCommit(false);
			ps.setInt(1, Integer.valueOf(id));
			ps.executeUpdate();
			connection.commit();
			connection.setAutoCommit(true);
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	@Override
	public List<City> getCitiesList() {
		ArrayList<City> citiesList = new ArrayList<City>();
		String getUsersSql = "SELECT id, name FROM location;";
		try (Connection connection = dataSource.getConnection(); 
				Statement st = connection.createStatement();){
			ResultSet rs = st.executeQuery(getUsersSql);
			while (rs.next()){
				City city = new City();
				city.setId(rs.getString("id"));
				city.setName(rs.getString("name"));
				citiesList.add(city);
			}
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		return citiesList;
	}
	
	@Override
	public List<City> getCitiesList(Pagination pagination) {
		ArrayList<City> citiesList = new ArrayList<City>();
		String getUsersSql = "SELECT id, name FROM location limit " + pagination.getLimitOffset() +"," + pagination.getLimitResords()  + ";" ;
		try (Connection connection = dataSource.getConnection(); 
				Statement st = connection.createStatement();){
			ResultSet rs = st.executeQuery(getUsersSql);
			while (rs.next()){
				City city = new City();
				city.setId(rs.getString("id"));
				city.setName(rs.getString("name"));
				citiesList.add(city);
			}
			rs = st.executeQuery("SELECT count(*) from location");
			rs.next();
			pagination.setTotalRecords(rs.getInt(1));
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		return citiesList;
	}
	
	@Override
	public void insertCities(City city) {
		String sql = "INSERT INTO location(name) VALUES(?)";
		try (Connection connection = dataSource.getConnection(); 
				PreparedStatement ps = connection.prepareStatement(sql)){
			connection.setAutoCommit(false);
			ps.setString(1, city.getName());
			ps.executeUpdate();
			connection.commit();
			connection.setAutoCommit(true);
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
	}
}
