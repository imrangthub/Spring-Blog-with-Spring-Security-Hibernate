package com.imran.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.imran.dao.CategoryDao;
import com.imran.model.Category;


@Repository
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	CategoryDao categoryDao;
	
	 public void addCategory(Category category){
		 categoryDao.addCategory(category);
	 }
		
		public void updateCategory(Category category){
			categoryDao.updateCategory(category);
		}
		
		public List<Category> listProduct(){
			return categoryDao.listProduct();
		}
		
		public Category getCategoryById(Integer categoryId){
			return categoryDao.getCategoryById(categoryId);
		}
		
		public void removeCategory(Integer categoryId){
			categoryDao.removeCategory(categoryId);
		}

}
