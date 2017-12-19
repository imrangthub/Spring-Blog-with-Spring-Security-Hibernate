package com.imran.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="/auth")
public class AuthController {
	
	@RequestMapping(value="/login")
	public String login(ModelMap map){
		map.addAttribute("title", "Login");
		System.out.println("Form login Controller");
		return "Auth/login";
	}
	
	@RequestMapping(value="/loginfailed")
	public String loginFailed(ModelMap map){
		map.addAttribute("title", "Login | Failed");
		System.out.println("Form login Controller");
		return "Auth/login";
	}
	
	@RequestMapping(value="/logout")
	public String logout(ModelMap map){
		map.addAttribute("title", "Logout");
		System.out.println("Form login Controller");
		return "index";
	}
	
	

}
