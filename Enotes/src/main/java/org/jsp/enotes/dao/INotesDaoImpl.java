package org.jsp.enotes.dao;

import java.util.List;
import java.util.Optional;

import org.jsp.enotes.models.Notes;
import org.jsp.enotes.models.User;
import org.jsp.enotes.repositories.NotesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class INotesDaoImpl implements INotesDao {
	
	@Autowired
	private NotesRepository notesRepository;
	
	@Override
	public Notes insertNotes(Notes notes) {
		try {
			Notes save = notesRepository.save(notes);
			return save;
		}
		catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public List<Notes> selectByUser(User user) {
		try {
			List<Notes> notes = notesRepository.findByUser(user);
			return notes;
		}
		catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public Notes selectById(int id) {
		Optional<Notes> optional = notesRepository.findById(id);
		if (optional.isPresent()) {
			return optional.get();
		}
		else {
			return null;
		}
	}
	
	@Override
	public void deleteNotesById(int id) {
		notesRepository.deleteById(id);
	}
	
	@Override
	public void deleteUser(User user) {
		try {
			List<Notes> list = notesRepository.findByUser(user);
			try {
				notesRepository.deleteInBatch(list);
			}
			catch (Exception e) {
				System.out.println("Some fishy happening");
			}
		}
		catch (Exception e) {
			System.out.println("User not found");
		}
		
	}

}
