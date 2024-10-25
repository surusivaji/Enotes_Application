package org.jsp.enotes.dao;


import java.util.Optional;

import org.jsp.enotes.models.User;
import org.jsp.enotes.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IUserDaoImpl implements IUserDao {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public User insert(User user) {
		try {
			User save = userRepository.save(user);
			return save;
		}
		catch (Exception e) {
			return null;
		}		
	}
	
	@Override
	public User selectDetailsByEmailAndPassword(String email, String password) {
		try {
			User user = userRepository.findByEmailAndPassword(email, password);
			return user;
		}
		catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public User updateUser(User user) {
		try {
			User save = userRepository.save(user);
			if (save!=null) {
				return save;
			}
			else {
				return null;
			}
		}
		catch(Exception e) {
			return null;
		}
	}
	
	@Override
	public boolean deleteUser(int id) {
		try {
			userRepository.deleteById(id);
			return true;
		}
		catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public User findByUser(int userid) {
		try {
			Optional<User> optional = userRepository.findById(userid);
			if (optional.isPresent()) {
				return optional.get();
			}
			else {
				return null;
			}
		}
		catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public User selectByEmailAndMobile(String email, String mobile) {
		try {
			User user = userRepository.findByEmailAndMobile(email, mobile);
			if (user!=null) {
				return user;
			}
			else {
				return null;
			}
		}
		catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public User updatePasswordByEmail(String email, String password) {
		try {
			User user = userRepository.findByEmail(email);
			if (user!=null) {
				user.setPassword(password);
				User save = userRepository.save(user);
				if (save!=null) {
					return save;
				}
				else {
					return null;
				}
			}
			else {
				return null;
			}
		} 
		catch (Exception e) {
			return null;
		}
	}

}
