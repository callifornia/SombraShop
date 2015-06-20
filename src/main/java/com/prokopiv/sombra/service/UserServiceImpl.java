package com.prokopiv.sombra.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prokopiv.sombra.dao.UserDao;
import com.prokopiv.sombra.model.User;
import com.prokopiv.sombra.validation.Pagination;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired UserDao userDao;
	
	@Override
	public void deleteUser(String id) {
		userDao.deleteUser(id);
	}
	
	@Override
	public User getUserById(String id) {
		return userDao.getUserById(id);
	}
	
	@Override
	public List<User> getUserList(Pagination pagination) {
		return userDao.getUserList(pagination);
	}
	
	@Override
	public void insertUser(User user) {
		userDao.insertUser(user);
	}
	
	@Override
	public void recoveryUser(String id) {
		userDao.recoveryUser(id);
	}
	
	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}
	
	@Override
	public boolean userExist(String login) {
		return userDao.userExist(login);
	}

}
