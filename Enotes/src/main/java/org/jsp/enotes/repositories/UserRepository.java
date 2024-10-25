package org.jsp.enotes.repositories;

import org.jsp.enotes.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByEmailAndPassword(String email, String password);
	User findByEmailAndMobile(String email, String mobile);
	User findByEmail(String email);
	
}
