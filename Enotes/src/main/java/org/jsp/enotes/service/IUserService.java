package org.jsp.enotes.service;

import org.jsp.enotes.models.User;

public interface IUserService {
	
	User register(User user);
	User login(String email, String password);
	User updateUser(User user);
	boolean removeUser(int id);
	User fetchByUserId(int userid);
	User fetchByUser(String email, String mobile);
	User changePasswordByEmail(String email, String password);

}
