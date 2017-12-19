package com.imran.service;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imran.model.ViewPost;

@Repository
public class ViewService {
	
	@Autowired
	private SessionFactory sessionFactory;

	

	@Transactional
	@SuppressWarnings("unchecked")
	 public List<ViewPost> list(){
		 return (List<ViewPost>) sessionFactory.getCurrentSession().createCriteria(ViewPost.class).list();
		
	 }
}
