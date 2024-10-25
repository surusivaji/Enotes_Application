package org.jsp.enotes.service;

import org.jsp.enotes.dao.IUserDao;
import org.jsp.enotes.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IUserServiceImpl implements IUserService {
	
	@Autowired
	private IUserDao dao;

	@Override
	public User register(User user) {
		User save = dao.insert(user);
		return save;
	}
	
	@Override
	public User login(String email, String password) {
		User user = dao.selectDetailsByEmailAndPassword(email, password);
		return user;
	}
	
	@Override
	public User updateUser(User user) {
		User updateUser = dao.updateUser(user);
		return updateUser;
	}
	
	@Override
	public boolean removeUser(int id) {
		boolean deleteUser = dao.deleteUser(id);
		return deleteUser;
	}
	
	@Override
	public User fetchByUserId(int userid) {
		User findByUser = dao.findByUser(userid);
		return findByUser;
	}
	
	@Override
	public User fetchByUser(String email, String mobile) {
		User user = dao.selectByEmailAndMobile(email, mobile);
		return user;
	}
	
	@Override
	public User changePasswordByEmail(String email, String password) {
		return dao.updatePasswordByEmail(email, password);
	}
}
