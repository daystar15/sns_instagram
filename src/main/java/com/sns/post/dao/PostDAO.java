package com.sns.post.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public interface PostDAO {
	
	public List<Map<String, Object>> selectPostListTEST();
	
	public int insertPost(
			@Param("userId") int userId, 
			@Param("userLoginId") String userLoginId, 
			@Param("userName") String userName, 
			@Param("content") String content, 
			@Param("imagPath") MultipartFile  file);
	
}
