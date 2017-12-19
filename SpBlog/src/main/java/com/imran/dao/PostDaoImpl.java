package com.imran.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.imran.model.Category;
import com.imran.model.Post;

@Repository
public class PostDaoImpl implements PostDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public void addPost(Post post) {
		sessionFactory.getCurrentSession().save(post);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<Post> listPost() {
		return (List<Post>) sessionFactory.getCurrentSession().createCriteria(Post.class).list();
	}
	
	@Transactional
	@SuppressWarnings("unchecked")
	public Post getPostById(Integer postId){
		return (Post) sessionFactory.getCurrentSession().get(Post.class, postId);	  
	}
	
	@Transactional
	public void updtePost(Post updtePost){
		sessionFactory.getCurrentSession().update(updtePost);
	}
	
	@Transactional
	public void deletePost(Integer postId){
		Post post = (Post)sessionFactory.getCurrentSession().load(Post.class, postId);
		if(post != null){
			sessionFactory.getCurrentSession().delete(post);
		}
	}

}
