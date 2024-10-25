package org.jsp.enotes.dao;

import java.util.List;

import org.jsp.enotes.models.Notes;
import org.jsp.enotes.models.User;

public interface INotesDao {
	
	Notes insertNotes(Notes notes);
	List<Notes> selectByUser(User user);
	Notes selectById(int id);
	void deleteNotesById(int id);
	void deleteUser(User user);

}
