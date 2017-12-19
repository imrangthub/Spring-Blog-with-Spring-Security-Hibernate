package com.imran.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="view_post")
public class ViewPost {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	
	@Column(nullable = true)
	String postTitle;
	
	@Column(nullable = true)
	@Type(type="text")
	String postBody;
	
	@Column(nullable = true)
	String postImg;
	
	@Column(nullable = true)
	Integer categoryId;
	
	
	@Column(nullable = true)
	String categoryTitle;
	
	


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getPostTitle() {
		return postTitle;
	}


	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}


	public String getPostBody() {
		return postBody;
	}


	public void setPostBody(String postBody) {
		this.postBody = postBody;
	}


	public String getPostImg() {
		return postImg;
	}


	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}


	public Integer getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}


	public String getCategoryTitle() {
		return categoryTitle;
	}


	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	
	
	
	
   

}
