package com.sns.timeline;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/timeline")
public class TimelineController {
	
	@Autowired
	private PostBO postBO;

	@GetMapping("/timeline_view")
	public String timelineView(
			@RequestParam("content") String content,
			@RequestParam("file") MultipartFile file,
			Model model,
			HttpSession session) {
		model.addAttribute("viewName", "timeline/timeline");
		

		// db select
		Post post = postBO.getPostByUserNameContentFile(userId, content, file);

		// 글쓴 사람 정보 담기
		session.setAttribute("postUserId", post.getUserId());
		session.setAttribute("postContent", post.getContent());
		session.setAttribute("postImagePath", post.getImagePath());
		return "template/layout";
	}
	
}
