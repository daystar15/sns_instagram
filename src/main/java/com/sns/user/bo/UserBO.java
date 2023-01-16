package com.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.user.dao.UserDAO;
import com.sns.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;

	public boolean existloginId(String loginId) {
		return userDAO.existloginId(loginId);
	}
	
	public void addUser(String loginId, String password, String name, String email, String profileImageUrl) {
		userDAO.insertUser(loginId, password, name, email, profileImageUrl);
	}
	
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}
	
}
