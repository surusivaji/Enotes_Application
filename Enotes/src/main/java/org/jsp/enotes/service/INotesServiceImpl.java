package org.jsp.enotes.service;

import java.util.List;

import org.jsp.enotes.dao.INotesDao;
import org.jsp.enotes.models.Notes;
import org.jsp.enotes.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class INotesServiceImpl implements INotesService {
	
	@Autowired
	private INotesDao notesDao;

	@Override
	public Notes addNotes(Notes notes) {
		Notes insert = notesDao.insertNotes(notes);
		return insert;
	}
	
	@Override
	public List<Notes> fetchByUser(User user) {
		List<Notes> notes = notesDao.selectByUser(user);
		return notes;
	}
	
	@Override
	public Notes fetchNotesById(int id) {
		Notes notes = notesDao.selectById(id);
		return notes;
	}
	
	@Override
	public void removeNotesById(int id) {
		notesDao.deleteNotesById(id);
	}
	
	@Override
	public void removeNotesByUser(User user) {
		notesDao.deleteUser(user);
	}

}
