package com.imran.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.imran.model.Post;
import com.imran.model.ViewPost;
import com.imran.service.CategoryService;
import com.imran.service.PostService;
import com.imran.service.ViewService;

@Controller
public class HomeController {
	
	@Autowired
	PostService postService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ViewService viewService;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView index() {
		ViewPost lastPost= null;
		Map<String, Object> model = new HashMap<String, Object>();
		List<ViewPost> results = new ArrayList<ViewPost>();
		results= viewService.list();
		if(!results.isEmpty()){
			Collections.reverse(results);
			lastPost = results.get(0);
			results.remove(0);
		}
		model.put("lastPost", lastPost);
		model.put("postList", results);
		return new ModelAndView("index", model);
	}
	
	
	@RequestMapping(value="/about")
	public String about(){
		return "about";
	}
	
	@RequestMapping(value="/contact")
	public String contact(){
		return "contact";
	}

}
