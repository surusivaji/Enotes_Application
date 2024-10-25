package org.jsp.enotes.dao;

import org.jsp.enotes.models.User;

public interface IUserDao {
	
	User insert(User user);
	User selectDetailsByEmailAndPassword(String email, String password);
	User updateUser(User user);
	boolean deleteUser(int id);
	User findByUser(int userid);
	User selectByEmailAndMobile(String email, String mobile);
	User updatePasswordByEmail(String email, String password);


}
