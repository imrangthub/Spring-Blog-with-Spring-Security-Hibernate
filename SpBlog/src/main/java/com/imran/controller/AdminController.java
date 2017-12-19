package com.imran.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/dashboard")
public class AdminController {
	
	@RequestMapping(value="/")
	public String index(){
		System.out.println("From Home Controller");
		return "Admin/dashboard";
	}

}
