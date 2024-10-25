package org.jsp.enotes.repositories;

import java.util.List;

import org.jsp.enotes.models.Notes;
import org.jsp.enotes.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotesRepository extends JpaRepository<Notes, Integer> {
	List<Notes> findByUser(User user);
}
