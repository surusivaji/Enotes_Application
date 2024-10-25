package org.jsp.enotes.controllers;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsp.enotes.models.Notes;
import org.jsp.enotes.models.User;
import org.jsp.enotes.service.INotesService;
import org.jsp.enotes.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomeController 
{
	
	@Autowired
	private IUserService service;
	
	@Autowired
	private INotesService notesService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public String indexPage() 
	{
		return "index";
	}
	
	@RequestMapping("/signup")
	public String signupPage() 
	{
		return "signup";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@ModelAttribute User user) 
	{
		User register = service.register(user);
		System.out.println(register);
		if (register!=null) 
		{
			session.setAttribute("accountsuccess", "your account successfully created");;
			return "redirect:/signin";
		}
		else 
		{
			session.setAttribute("accountfail", "something went wrong");
			return "redirect:/signup";
		}
	}
	
	@RequestMapping("/signin")
	public String singinPage() 
	{
		return "signin";
	}
	
	@RequestMapping(value="/loginUser", method=RequestMethod.POST)
	public String signin(String email, String password) 
	{
		User login = service.login(email, password);
		System.out.println(login);
		if (login!=null) 
		{
			session.setAttribute("user", login);
			return "redirect:/home";
		}
		else 
		{
			session.setAttribute("loginFailed", "email and password invalid");
			return "redirect:/signin";
		}
	}
	
	@RequestMapping(value="/home")
	public String homePage() 
	{
		return "home";
	}
	
	@RequestMapping(value="/logout")
	public String logout()
	{
		session.removeAttribute("user");
		session.setAttribute("logoutInfo", "Logout successfully completed");
		return "redirect:/signin";
	}
	
	@RequestMapping("/addnotes")
	public String addNotes() 
	{
		return "addnotes";
	}
	
	@RequestMapping(value="/saveNotes", method=RequestMethod.POST)
	public String saveNotes(@ModelAttribute Notes notes)
	{
		User user = (User) session.getAttribute("user");
		notes.setDate(Date.valueOf(LocalDate.now()));
		notes.setUser(user);
		Notes addNotes = notesService.addNotes(notes);
		if (addNotes!=null) 
		{
			session.setAttribute("addNotes", "Notes added successfully");
			return "redirect:/addnotes";
		}
		else 
		{
			session.setAttribute("addNotesFail", "Something went wrong");
			return "redirect:/addnotes";
		}
	}
	
	@RequestMapping("/viewNotes")
	public String displayNotes(Model model) 
	{
		User user = (User) session.getAttribute("user");
		List<Notes> notes = notesService.fetchByUser(user);
		session.setAttribute("displayAllNotes", notes);
		return "viewnotes";
	}
	
	@RequestMapping("/editNotes/{notesId}")
	public String editNotes(@PathVariable("notesId") int notesId)
	{
		Notes fetchNotesById = notesService.fetchNotesById(notesId);
		if (fetchNotesById!=null) 
		{
			session.setAttribute("singleNotes", fetchNotesById);
			return "editnotes";
		}
		else 
		{
			session.setAttribute("updateFailed", "Something went wrong");
			return "redirect:/Enotes/viewNotes";
		}
	}
	
	@RequestMapping(value="/updateNotes", method = RequestMethod.POST)
	public String updateNotes(Notes notes) 
	{
		notes.setDate(Date.valueOf(LocalDate.now()));
		User user = (User) session.getAttribute("user");
		notes.setUser(user);
		Notes update = notesService.addNotes(notes);
		if (update!=null) 
		{
			session.setAttribute("updateSuccess", "Notes updated successfully completed");
			return "redirect:/viewNotes";
		}
		else 
		{
			session.setAttribute("updateFailed", "Something went wrong");
			return "redirect:/editNotes";
		}
	}
	
	@RequestMapping("/removeNotes/{notesId}")
	public String removeNotes(@PathVariable("notesId") int notedId) 
	{
		notesService.removeNotesById(notedId);
		session.setAttribute("deleteSuccess", "Notes deleted successfully");
		return "redirect:/viewNotes";
	}
	
	@RequestMapping("/showUser")
	public String displayUser() 
	{
		return "displayuser";
	}
	
	@RequestMapping("/cancelUser")
	public String cancelUser() 
	{
		return "redirect:/showUser";
	}
	
	@RequestMapping("/editUser/{userid}")
	public String editUser(@PathVariable("userid") int userid) 
	{
		User fetchByUserId = service.fetchByUserId(userid);
		if (fetchByUserId!=null) 
		{
			session.setAttribute("updateUser", fetchByUserId);
			return "edituser";
		}
		else 
		{
			return "redirect:/signin";
		}
	}
	
	@RequestMapping(value="/updateUser", method=RequestMethod.POST)
	public String updateUser(@ModelAttribute User user) {
		User updateUser = service.updateUser(user);
		if (updateUser!=null) 
		{
			session.setAttribute("user", updateUser);
			session.setAttribute("updateUserSuccess", "user information successfully updated");
			return "redirect:/showUser";
		}
		else 
		{
			session.setAttribute("updateUserFailure", "something went wrong");
			return "redirect:/showUser";
		}
	}
		
	@RequestMapping("/removeUser/{userId}")
	public String removeUser(@PathVariable("userId") int id) 
	{
		User user = service.fetchByUserId(id);
		if (user!=null) 
		{
			notesService.removeNotesByUser(user);
			boolean removeUser = service.removeUser(id);
			if (removeUser) 
			{
				session.setAttribute("removeUserSuccess", "user account permunantly deleted");
				return "redirect:/signin";
			}
			else 
			{
				session.setAttribute("removeUserFailure", "something went wrong");
				return "redirect:/showUser";
			}
		}
		else 
		{
			session.setAttribute("removeUserFailure", "something went wrong");
			return "redirect:/showUser";
		}
	}
	
	@RequestMapping("/forgotPassword")
	public String forgotPassword() 
	{
		return "forgotpassword";
	}
	
	@RequestMapping(value="/findUser", method=RequestMethod.POST)
	public String changePassword(@RequestParam("email") String email, @RequestParam("mobile") String mobile) 
	{
		User fetchByUser = service.fetchByUser(email, mobile);
		System.out.println(fetchByUser);
 		if (fetchByUser!=null) 
 		{
 			session.setAttribute("userEmail", email);
			return "forgotpassword1";
		}
		else 
		{
			session.setAttribute("forgotpasswordfail", "Invalid mobile and email");
			return "redirect:/forgotPassword";
		}
	}
	
	@RequestMapping(value="/changePassword", method=RequestMethod.POST)
	public String updateNewPassword(@RequestParam("password") String password, @RequestParam("email") String email) 
	{
		User fetchByEmail = service.changePasswordByEmail(email, password);
		if (fetchByEmail!=null) 
		{
			session.setAttribute("changePasswordSuccess", "password updated successfully");
			return "redirect:/signin";
		}
		else 
		{
			session.setAttribute("changePasswordFail", "something went wrong");
			return "redirect:/sigin";
		}
	}
}
