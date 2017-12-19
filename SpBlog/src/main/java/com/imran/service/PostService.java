package com.imran.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.imran.model.Post;

public interface PostService {

	public void addPost(Post post);

	public List<Post> listPost();

    public Post getPostById(Integer postId);
    
    public void updtePost(Post updtePost);
	
	public void deletePost(Integer postId);
	
	 public Boolean checkFile(MultipartFile file);
	 
	 public String uploadFileName(MultipartFile file);

}
