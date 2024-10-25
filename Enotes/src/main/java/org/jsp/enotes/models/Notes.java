package org.jsp.enotes.models;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Notes {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer notesId;
	@Column(name="Title", nullable = false, length=2000)
	private String title;
	@Column(name="Description", nullable = false, length=10000)
	private String description;
	@Column(name="Date", nullable = false)
	private Date date;
	@ManyToOne
	private User user;
	
	public Notes() {
		
	}

	public Notes(Integer notesId, String title, String description, Date date, User user) {
		this.notesId = notesId;
		this.title = title;
		this.description = description;
		this.date = date;
		this.user = user;
	}

	public Integer getNotesId() {
		return notesId;
	}

	public void setNotesId(Integer notesId) {
		this.notesId = notesId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Notes [notesId=" + notesId + ", title=" + title + ", description=" + description + ", date=" + date
				+ ", user=" + user + "]";
	}
	
}
