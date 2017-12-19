package com.imran.dao;

import java.util.List;

import com.imran.model.Category;
import com.imran.model.Product;


public interface CategoryDao {
	
    public void addCategory(Category category);
	
	public void updateCategory(Category category);
	
	public List<Category> listProduct();
	
	public Category getCategoryById(Integer categoryId);
	
	public void removeCategory(Integer categoryId);

}
