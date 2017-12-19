package com.imran.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.imran.model.Category;
import com.imran.model.Product;
import com.imran.service.CategoryService;


@Controller
@RequestMapping(value="/category")
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	
	
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView listProduct() {
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<Category> results = new ArrayList<Category>();
		results= categoryService.listProduct();
		model.put("categoryList", results);
		return new ModelAndView("Category/index", model);
	}
	
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String viewCreate() {
		return "Category/create";
	}
	
	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public ModelAndView viewEdit() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Category> results = new ArrayList<Category>();
		results= categoryService.listProduct();
		model.put("categoryList", results);
		return new ModelAndView("Category/create", model);
	}

	
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public ModelAndView create(@RequestParam("title") String title, @RequestParam("id") Integer id){
		Map<String, Object> map = new HashMap<String, Object>();
		
		Category category;
		
			if(title == "" || title == null){
				map.put("errorMsg","Require field is empty");
				return new ModelAndView("Category/create", map);
			}
			if(id == null || id == 0){
				category = new Category();
				category.setTitle(title);
				category.setCreatedDate(new Date());
				category.setCreatedBy("admin");
				categoryService.addCategory(category);
				map.put("successMsg","Successfully Save this Category");
			}else{
				category = categoryService.getCategoryById(id);
				category.setId(id);
				category.setTitle(title);
				category.setUpdatedBy("Admin");
				category.setLastUpdated(new Date());
				map.put("successMsg","Successfully Update this Category");
				categoryService.updateCategory(category);
				return new ModelAndView("redirect:/category/", map);
			}
			return new ModelAndView("Category/create", map);
	}
	
	
	@RequestMapping(value="/edit/{id}")
	public String editProduct(@PathVariable("id") Integer id, Map<String, Object> map){
		Category category = categoryService.getCategoryById(id);
		map.put("category", category);
		System.out.println(category);
		return "Category/create";
	}
	
	@RequestMapping(value="/delete/{id}")
	public String deleteProduct(@PathVariable("id") Integer id){
		Map<String, Object> map = new HashMap<String, Object>();
		categoryService.removeCategory(id);
		map.put("successMsg","Successfully Delete this Category");
		return "redirect:/category/";
	}

}
