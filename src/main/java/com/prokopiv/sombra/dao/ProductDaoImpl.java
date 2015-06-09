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
import org.springframework.stereotype.Repository;

import com.prokopiv.sombra.model.Product;
import com.prokopiv.sombra.service.ShopingCartServiceImpl;
import com.prokopiv.sombra.validation.Pagination;


@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired DataSource dataSource;

	@Override
	public void checkout(ShopingCartServiceImpl shopingCart) {
		for(Product product : shopingCart.getProducts()){
			System.out.println("Insert into Data Base:" + product.getId());
		}
	}
	
	@Override
	public Product getProduct(String id) {
		Product product = new Product();
		String sql = "SELECT pr.id, pr.name, pr.inStock, ua.user_login, pr.cond, l.name as 'loc', pr.price, pr.description, pr.img FROM product as pr, user_authentication as ua, location as l WHERE pr.id = ? AND pr.seller  = ua.user_id AND pr.location = l.id  ";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)){
			ps.setInt(1, Integer.valueOf(id));
			ResultSet rs = ps.executeQuery();
			rs.next();
			product.setId(String.valueOf(rs.getInt("id")));
			product.setCondition(rs.getString("cond"));
			product.setDescription(rs.getString("description"));
			product.setImg(rs.getString("img"));
			product.setInStock(rs.getBoolean("inStock"));
			product.setLocation(rs.getString("loc"));
			product.setName(rs.getString("name"));
			product.setPrice(rs.getString("price"));
			product.setSeller(rs.getString("user_login"));
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		return product; 
	}
	
	@Override
	public List<Product> getProductListByCategory(Pagination pagination,String categoryIds) {
		ArrayList<Product> productList = new ArrayList<Product>();		
		String sqlCount = "SELECT count(*) from product WHERE category IN (" + categoryIds +");";		
		String sql = "SELECT pr.id, pr.name, pr.price, pr.img, l.name as 'loc' FROM product as pr, location as l WHERE pr.category IN ("+ categoryIds +") AND pr.location = l.id limit " + pagination.getLimitOffset() +"," + pagination.getLimitResords()  + ";";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);){
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
		String sql = "SELECT pr.id, pr.name, pr.inStock, pr.seller, pr.cond, l.name as 'loc', pr.price, pr.description, pr.img FROM product as pr, location as l WHERE pr.location = l.id limit " + pagination.getLimitOffset() +"," + pagination.getLimitResords()  + ";";
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
				product.setLocation(rs.getString("loc"));
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
	public void insertProduct(Product product) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String sellerName = auth.getName();
	    String getSellerIdSql = "SELECT user_id FROM user_authentication WHERE user_login = '" +sellerName + "'"; 
		String sql = "INSERT INTO product(name, inStock, seller, cond, location, price, description, img, category) VALUES(?,?,?,?,?,?,?,?,?)";
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
			ps.setInt(9, Integer.valueOf(product.getCategory()));			
			ps.executeUpdate();
			connection.commit();
			connection.setAutoCommit(true);
			connection.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
	}
}