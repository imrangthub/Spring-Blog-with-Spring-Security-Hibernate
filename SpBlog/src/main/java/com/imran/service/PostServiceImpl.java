package com.imran.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.imran.dao.PostDao;
import com.imran.model.Post;
import com.sun.prism.Image;

@Repository
public class PostServiceImpl implements PostService{
	
	@Autowired
	PostDao postDao;
	
	 public void addPost(Post post){
		 postDao.addPost(post);
	 }
	 
	 public List<Post> listPost(){
		 return postDao.listPost();
	 }
	 
	 public Post getPostById(Integer postId){
		 return postDao.getPostById(postId);
	 }
	 
	 public void updtePost(Post updtePost){
		postDao.updtePost(updtePost); 
	 }
     
	 public void deletePost(Integer postId){
		 postDao.deletePost(postId);
	 }
	 
	 
	 public Boolean checkFile(MultipartFile file){
		        boolean fileExtCheck = false;
				try {
					byte[] bytes = file.getBytes();	
					String fileName = file.getOriginalFilename();
					
				    String [] fileExt = {".jpg", ".png", ".jpeg"};
	       		    int IndexOf = fileName.indexOf(".");
	       		    String currentImgExt = fileName.substring(IndexOf);
	       		    System.out.println("Current imag formate: "+currentImgExt);
	                fileExtCheck = Arrays.asList(fileExt).contains(currentImgExt);
		       	
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return fileExtCheck;
	 }
	 
	 public String uploadFileName(MultipartFile file){	 
		 String uniqName = null;

					byte[] bytes;
					try {
						bytes = file.getBytes();
					
					String fileName = file.getOriginalFilename();
					
					 Random generator = new Random();
			         int r = Math.abs(generator.nextInt());
			         uniqName = r+"_"+(String)fileName;
					  File dir = new File("D:/JAVA/SPRING_FRAMEWORK/SpBlog/src/main/webapp/resources/imgFolder/");
						// Create the file on server
						File serverFile = new File(dir.getAbsolutePath()
								+ File.separator+uniqName);
						BufferedOutputStream stream = new BufferedOutputStream(
								new FileOutputStream(serverFile));
						stream.write(bytes);
						stream.close();
						
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					return uniqName;
			}
		

}
