package org.jsp.enotes.service;

import java.util.List;

import org.jsp.enotes.models.Notes;
import org.jsp.enotes.models.User;

public interface INotesService {
	
	Notes addNotes(Notes notes);
	List<Notes> fetchByUser(User user);
	Notes fetchNotesById(int id);
	void removeNotesById(int id);
	void removeNotesByUser(User user);

}
