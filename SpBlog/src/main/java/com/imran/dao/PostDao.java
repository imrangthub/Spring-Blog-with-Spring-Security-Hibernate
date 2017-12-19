package com.imran.dao;

import java.util.List;

import com.imran.model.Category;
import com.imran.model.Post;


public interface PostDao {
	
  public void addPost(Post post);
  
  public List<Post> listPost();
  
  public Post getPostById(Integer postId);
  
  public void updtePost(Post updtePost);

  public void deletePost(Integer postId);
}
