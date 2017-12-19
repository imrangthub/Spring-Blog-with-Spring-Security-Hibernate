package com.imran.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.imran.model.Category;
import com.imran.model.Post;
import com.imran.model.ViewPost;
import com.imran.service.CategoryService;
import com.imran.service.PostService;
import com.imran.service.ViewService;

@Controller
@RequestMapping(value="/post")
public class PostController {
	
	@Autowired
	PostService postService;
	
	
	@Autowired
	ViewService viewService;
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView index() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<ViewPost> results = new ArrayList<ViewPost>();
		results = viewService.list();
		model.put("postList", results);
		return new ModelAndView("Post/index", model);
	}	
	
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public ModelAndView viewCreate() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Category> results = new ArrayList<Category>();
		results= categoryService.listProduct();
		model.put("categoryList", results);
		return new ModelAndView("Post/create", model);
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createPost(@RequestParam("file") MultipartFile file, @RequestParam("title") String title, @RequestParam("body") String body, @RequestParam("category_id") Integer categoryId, @RequestParam("id") Integer id, ModelMap map){
		Post post;
		String uniqName = null;
		if(title.equals("") || body.equals("")){
			map.addAttribute("errorMsg", "Require field is Empty");
			return "Post/create";
		}
		if(!file.isEmpty()){
			if(postService.checkFile(file)){
				uniqName = postService.uploadFileName(file);
			}else{
				map.addAttribute("errorMsg", "Invalide file formate");
				return "Post/create";
			}
		}
		if( id == null){
			post = new Post();
			post.setTitle(title);
			post.setBody(body);
			post.setCategoryId(categoryId);
			post.setActiveStatus(1);
			post.setCreatedDate(new Date());
			post.setCreatedBy("admin");
			post.setFeatureImg(uniqName);
		    postService.addPost(post);
		    map.put("successMsg","Successfully Save this Post");
		}else{
			post = postService.getPostById(id);
			if(uniqName != null){
				if(post.getFeatureImg() != null || post.getFeatureImg() != ""){
					File ImgFile = new File("D:/JAVA/SPRING_FRAMEWORK/SpBlog/src/main/webapp/resources/imgFolder/"+post.getFeatureImg());
					ImgFile.delete();
				}
				post.setFeatureImg(uniqName);
			}
			post.setTitle(title);
			post.setBody(body);
			post.setCategoryId(categoryId);
			post.setActiveStatus(1);
			post.setLastUpdated(new Date());
			post.setUpdatedBy("admin");
			postService.updtePost(post);
			map.put("successMsg","Successfully Update this Post");
		}
		
		return "Post/create";
	}
	
	@RequestMapping(value="/perview/{id}", method = RequestMethod.GET)
	public ModelAndView perview(@PathVariable("id") Integer id) {
		Map<String, Object> model = new HashMap<String, Object>();
	    Post previewPost = postService.getPostById(id);
		model.put("previewPost", previewPost);
		return new ModelAndView("Post/preview", model);
	}
	
	@RequestMapping(value="/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editView(@PathVariable("id") Integer id) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Category> categoryList = new ArrayList<Category>();
		categoryList= categoryService.listProduct();
		model.put("categoryList", categoryList);
	    Post editPost = postService.getPostById(id);
		model.put("post", editPost);
		return new ModelAndView("Post/create", model);
	}
		
	
	@RequestMapping(value="/delete/{id}")
	public String deleteProduct(@PathVariable("id") Integer id){
		Map<String, Object> map = new HashMap<String, Object>();
		Post deleteablePost = postService.getPostById(id);
		String deleteAbleImg = deleteablePost.getFeatureImg();
		File ImgFile = new File("D:/JAVA/SPRING_FRAMEWORK/SpBlog/src/main/webapp/resources/imgFolder/"+deleteAbleImg);
		ImgFile.delete();
		postService.deletePost(id);
		map.put("successMsg","Successfully Delete this Category");
		return "redirect:/post/";
	}
	
	
	

}
