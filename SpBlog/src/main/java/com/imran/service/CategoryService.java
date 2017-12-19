package com.imran.service;

import java.util.List;

import com.imran.model.Category;

public interface CategoryService {
	
	 public void addCategory(Category category);
		
		public void updateCategory(Category category);
		
		public List<Category> listProduct();
		
		public Category getCategoryById(Integer categoryId);
		
		public void removeCategory(Integer categoryId);

}
