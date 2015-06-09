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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.prokopiv.sombra.model.Category;
import com.prokopiv.sombra.model.City;
import com.prokopiv.sombra.model.Product;
import com.prokopiv.sombra.model.User;
import com.prokopiv.sombra.service.ShopingCartServiceImpl;
import com.prokopiv.sombra.validation.Pagination;

@Component
public class DaoImpl implements Dao{
	
	@Autowired	private DataSource dataSource;
	@Autowired Pagination pagination;
	@Autowired BCryptPasswordEncoder encoder;
	
	
	
	@Override
	public List<Product> getProductListByCategory(Pagination pagination, String id) {
		ArrayList<Product> productList = new ArrayList<Product>();		
		String sqlCount = "SELECT count(*) from product WHERE category = ?";		
		String sql = "SELECT pr.id, pr.name, pr.price, pr.img, l.name as 'loc' FROM product as pr, location as l WHERE pr.category = ? AND pr.location = l.id limit " + pagination.getLimitOffset() +"," + pagination.getLimitResords()  + ";";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);){
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				Product product = new Product();
				product.setId(rs.getInt("id") + "");
				product.setName(rs.getString("name"));
				product.setPrice(rs.getString("price"));
				product.setImg(rs.getString("img"));
				product.setLocation(rs.getString("loc"));				
				productList.add(product);
			}
			try( PreparedStatement pss = connection.prepareStatement(sqlCount);){
				pss.setString(1, id);
				ResultSet rss = pss.executeQuery();
				rss.next();
				pagination.setTotalRecords(rss.getInt(1));				
			} catch(SQLException ex){
				ex.printStackTrace();
			}
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		} 
		return productList;
	}
	
	@Override
	public void checkout(ShopingCartServiceImpl shopingCart) {
		for(Product product : shopingCart.getProducts()){
			System.out.println("Insert into Data Base:" + product.getId());
		}
	}
	
	@Override
	public void insertProduct(Product product) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String sellerName = auth.getName();
	    String getSellerIdSql = "SELECT user_id FROM user_authentication WHERE user_login = '" +sellerName + "'"; 
		String sql = "INSERT INTO product(name, inStock, seller, cond, location, price, description, img) VALUES(?,?,?,?,?,?,?,?)";
		try (Connection connection = dataSource.getConnection(); 
				PreparedStatement ps = connection.prepareStatement(sql)){
			ResultSet rs = ps.executeQuery(getSellerIdSql);
			rs.next();
			product.setSeller(rs.getString("user_id"));
			connection.setAutoCommit(false);
			ps.setString(1, product.getName());
			ps.setBoolean(2, product.isInStock());
			ps.setString(3, product.getSeller());
			ps.setString(4, product.getCondition());
			ps.setString(5, product.getLocation());
			ps.setDouble(6, Double.valueOf(product.getPrice()));
			ps.setString(7, product.getDescription());
			ps.setString(8, product.getImg());			
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
	public List<Category> getCategoriesList() {
		List<Category> categoryList = new ArrayList<Category>();
		String sql = "SELECT id, name, parent_id FROM Category";
		try(Connection connection = dataSource.getConnection(); Statement st = connection.createStatement()){
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				Category category = new Category();
				category.setId(rs.getString("id"));
				category.setName(rs.getString("name"));
				category.setIdParent(rs.getString("parent_id"));
				categoryList.add(category);
			}
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		return categoryList;
	}
	
	
	@Override
	public void insertUser(User user) {
		String userAuthenticationSql = "INSERT INTO user_authentication (user_login, user_password, user_enable) VALUES (?, ?, ?);";
		String userAuthorizationSql = "INSERT INTO user_authorization (user_id, role_id) VALUES (?,?);";
		String userSql = "INSERT INTO user(id, phone, first_name, last_name, email) VALUES(?,?,?,?,?);";
		try (Connection connection = dataSource.getConnection()){
			connection.setAutoCommit(false);
			Integer genId = null;

			try (PreparedStatement ps = connection.prepareStatement(userAuthenticationSql, Statement.RETURN_GENERATED_KEYS);){
				ResultSet rs = ps.getResultSet();
				ps.setString(1, user.getLogin());
				ps.setString(2, encoder.encode(user.getPassword()));
				ps.setBoolean(3, true);
				ps.executeUpdate();
				rs = ps.getGeneratedKeys();
				rs.next();
				genId = rs.getInt(1);
			} catch(SQLException ex){
				connection.rollback();
				connection.setAutoCommit(true);
				ex.printStackTrace();
			}
			
			try (PreparedStatement ps = connection.prepareStatement(userAuthorizationSql)){				
				ps.setInt(1, genId);
				ps.setInt(2, 2);
				ps.executeUpdate();
			} catch(SQLException ex){
				connection.rollback();
				connection.setAutoCommit(true);
				ex.printStackTrace();
			}
			
			try (PreparedStatement ps = connection.prepareStatement(userSql)){
				ps.setInt(1, genId);
				ps.setString(2, user.getPhone());
				ps.setString(3, user.getFirstName());
				ps.setString(4, user.getLastName());
				ps.setString(5, user.getEmail());
				ps.executeUpdate();
			} catch(SQLException ex){
				connection.rollback();
				connection.setAutoCommit(true);
				ex.printStackTrace();
			}		
			connection.commit();
			connection.setAutoCommit(false);
			connection.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
	
	
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
	
	
	@Override
	public boolean userExist(String login) {
		boolean result = true;
		String sql = "SELECT 1 FROM user_authentication WHERE user_login = ?";
		try (Connection connection = dataSource.getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);){
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();
			if(!rs.next()){
				result = !result;
			}	
			connection.close();
		} catch(SQLException ex){
			result = !result;
			ex.printStackTrace();
		}
		return result;
	}
	
	
	@Override
	public void updateUser(User user) {
		String sql = "UPDATE user SET phone = ?, first_name = ?, last_name = ?, email = ? WHERE id = ?";
		try (Connection connection = dataSource.getConnection(); PreparedStatement ps = connection.prepareStatement(sql)){
			connection.setAutoCommit(false);
				ps.setString(1, user.getPhone());
				ps.setString(2, user.getFirstName());
				ps.setString(3, user.getLastName());
				ps.setString(4, user.getEmail());
				ps.setInt(5, Integer.valueOf(user.getId()));
				ps.executeUpdate();
				connection.commit();
				connection.setAutoCommit(true);
				connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	
	@Override
	public User getUserById(String id) {
		String sql = "SELECT ua.user_id, ua.user_login, us.phone as user_phone, us.first_name as user_first_name, us.last_name as user_last_name, us.email as user_email FROM user_authentication as ua, user as us WHERE ua.user_id = us.id AND ua.user_id = ?";
		User user = new User();
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)){
			ps.setInt(1, Integer.valueOf(id));
			ResultSet rs = ps.executeQuery();
			rs.next();
			user.setId(rs.getInt("user_id") + "");
			user.setLogin(rs.getString("user_login"));
			user.setPhone(rs.getString("user_phone"));
			user.setFirstName(rs.getString("user_first_name"));
			user.setLastName(rs.getString("user_last_name"));
			user.setEmail(rs.getString("user_email"));
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		return user;
	}
	
	@Override
	public void recoveryUser(String id) {
		String sql = "UPDATE user_authentication SET user_enable = true WHERE user_id = ?";
		try (Connection connection = dataSource.getConnection()){
			connection.setAutoCommit(false);
			Integer userId = Integer.valueOf(id);
			try(PreparedStatement ps = connection.prepareStatement(sql)){
				ps.setInt(1, userId);
				ps.executeUpdate();
			} catch (SQLException ex){
				connection.rollback();
				connection.setAutoCommit(true);
				ex.printStackTrace();
			}
			connection.commit();
			connection.setAutoCommit(true);
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		
	}
	
	
	@Override
	public void deleteUser(String id) {
		String sql = "UPDATE user_authentication SET user_enable = false WHERE user_id = ?";
		try (Connection connection = dataSource.getConnection()){
			connection.setAutoCommit(false);
			Integer userId = Integer.valueOf(id);
			try(PreparedStatement ps = connection.prepareStatement(sql)){
				ps.setInt(1, userId);
				ps.executeUpdate();
			} catch (SQLException ex){
				connection.rollback();
				connection.setAutoCommit(true);
				ex.printStackTrace();
			}
			connection.commit();
			connection.setAutoCommit(true);
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	@Override
	public List<User> getUserList(Pagination pagination) {
		ArrayList<User> userList = new ArrayList<User>();
		String getUsersSql = "SELECT ua.user_id, ua.user_login, u.phone, u.first_name, u.last_name, u.email, ur.name as 'role',ua.user_enable FROM user_authentication as ua, user as u, user_role as ur, user_authorization as uz WHERE ua.user_id = u.id AND (ua.user_id = uz.user_id AND uz.role_id = ur.id) limit " + pagination.getLimitOffset() +"," + pagination.getLimitResords()  + ";";
		try (Connection connection = dataSource.getConnection(); 
				Statement st = connection.createStatement();){
			ResultSet rs = st.executeQuery(getUsersSql);
			while (rs.next()){
				User user = new User();	
				user.setId(String.valueOf(rs.getInt("user_id")));
				user.setEmail(rs.getString("email"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setLogin(rs.getString("user_login"));
				user.setPhone(rs.getString("phone"));
				user.setRole(rs.getString("role"));
				user.setEnable(rs.getBoolean("user_enable"));
				userList.add(user);
			}
			rs = st.executeQuery("SELECT count(*) from user_authentication");
			rs.next();
			pagination.setTotalRecords(rs.getInt(1));
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		return userList;
	}
	
	@Override
	public List<Product> getProductsListBySearchName(String name, Pagination pagination) {

		ArrayList<Product> productList = new ArrayList<Product>();		
		String sqlCount = "SELECT count(*) from product WHERE name like ?";		
		String sql = "SELECT pr.id, pr.name, pr.price, pr.img, pr.seller, l.name as 'loc' FROM product as pr, location as l WHERE pr.name like ? AND pr.location = l.id limit " + pagination.getLimitOffset() +"," + pagination.getLimitResords()  + ";";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);){
			ps.setString(1, name + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				Product product = new Product();
				product.setId(rs.getInt("id") + "");
				product.setName(rs.getString("name"));
				product.setPrice(rs.getString("price"));
				product.setImg(rs.getString("img"));
				product.setSeller(rs.getString("seller"));
				product.setLocation(rs.getString("loc"));				
				productList.add(product);
			}
			try( PreparedStatement pss = connection.prepareStatement(sqlCount);){
				pss.setString(1, name + "%");
				ResultSet rss = pss.executeQuery();
				rss.next();
				pagination.setTotalRecords(rss.getInt(1));				
			} catch(SQLException ex){
				ex.printStackTrace();
			}
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		} 
		return productList;
	}
	
	@Override
	public List<Product> getProductsList(Pagination pagination) {
		ArrayList<Product> productList = new ArrayList<Product>();
		String sql = "SELECT pr.id, pr.name, pr.inStock, pr.seller, pr.cond, pr.location, pr.price, pr.description, pr.img FROM product as pr limit " + pagination.getLimitOffset() +"," + pagination.getLimitResords()  + ";";

		try (Connection connection = dataSource.getConnection(); 
			  Statement st = connection.createStatement();){
			
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()){
				Product product = new Product();
				product.setId(String.valueOf(rs.getInt("id")));
				product.setCondition(rs.getString("cond"));
				product.setDescription(rs.getString("description"));
				product.setImg(rs.getString("img"));
				product.setInStock(rs.getBoolean("inStock"));
				product.setLocation(rs.getString("location"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getString("price"));
				product.setSeller(rs.getString("seller"));
				productList.add(product);
			}
			rs = st.executeQuery("SELECT count(*) from product");
			rs.next();
			pagination.setTotalRecords(rs.getInt(1));
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		return productList; 
	}
	
	@Override
	public Product getProduct(String id) {
		Product product = new Product();
		String sql = "SELECT pr.id, pr.name, pr.inStock, ua.user_login, pr.cond, pr.location, pr.price, pr.description, pr.img FROM product as pr, user_authentication as ua WHERE id = ? AND pr.seller  = ua.user_id ";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)){
			ps.setInt(1, Integer.valueOf(id));
			ResultSet rs = ps.executeQuery();
			rs.next();
			product.setId(String.valueOf(rs.getInt("pr.id")));
			product.setCondition(rs.getString("cond"));
			product.setDescription(rs.getString("description"));
			product.setImg(rs.getString("img"));
			product.setInStock(rs.getBoolean("inStock"));
			product.setLocation(rs.getString("location"));
			product.setName(rs.getString("name"));
			product.setPrice(rs.getString("price"));
			product.setSeller(rs.getString("user_login"));
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		return product; 
	}

}
