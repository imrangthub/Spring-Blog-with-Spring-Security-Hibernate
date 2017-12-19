package com.imran.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imran.model.Category;
import com.imran.model.Product;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public void addCategory(Category category){
		sessionFactory.getCurrentSession().save(category);
	}

	@Transactional
	public void updateCategory(Category category){
		sessionFactory.getCurrentSession().update(category);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<Category> listProduct(){
		return (List<Category>) sessionFactory.getCurrentSession().createCriteria(Category.class).list();
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public Category getCategoryById(Integer categoryId){
		return (Category) sessionFactory.getCurrentSession().get(Category.class, categoryId);
	}

	@Transactional
	public void removeCategory(Integer categoryId){
		Category category = (Category)sessionFactory.getCurrentSession().load(Category.class, categoryId);
		if(category != null){
			sessionFactory.getCurrentSession().delete(category);
		}
	}

}
