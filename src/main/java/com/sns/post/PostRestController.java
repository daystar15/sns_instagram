package com.sns.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.bo.PostBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/post")
@RestController
public class PostRestController {
	
	@Autowired
	private PostBO postBO;

	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("content") String content,
			@RequestParam("file") MultipartFile file,
			HttpSession session) { // userId, userLoginId를 가져오기 위해 session을 import한다
		
		// 로그인 안된 사용자 접근 시 에러 발생
		int userId =  (int)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		String userName = (String)session.getAttribute("userName");
		
		// db insert
		int rowCount = postBO.addPost(userId, userLoginId, userName, content, file);
		
		Map<String, Object> result = new HashMap<>();
		
		if (rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "글쓰기에 실패했습니다.");
		}
		
		return result;
	}
}
