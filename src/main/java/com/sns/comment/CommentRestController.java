package com.sns.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.comment.bo.CommentBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/comment")
@RestController
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;

	@GetMapping("/create")
	//@PostMapping("/create")
	public Map<String, Object> createComment(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			HttpSession session) {

		Map<String, Object> result = new HashMap<>();

		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500); // 비로그인
			result.put("result", "error");
			result.put("errorMessage", "로그인을 다시 해주세요.");
			return result;
		}

		commentBO.createComment(userId, postId, content);
		result.put("code", 100); // 성공
		result.put("result", "success");

		return result;
	}
}
