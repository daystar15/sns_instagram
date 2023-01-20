package com.sns.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.timeline.bo.TimelineBO;
import com.sns.timeline.model.CardView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/timeline")
public class TimelineController {

	@Autowired
	private TimelineBO timelineBO;

	@GetMapping("/timeline_view")
	public String timelineView(Model model) {
		
		//List<Post> postList = postBO.getPostListByUserId();
		//model.addAttribute("postList", postList);
		
		List<CardView> cardList = timelineBO.generateCardList();

		model.addAttribute("cardList", cardList);
		model.addAttribute("viewName", "timeline/timeline");
		
		return "template/layout";
	}
	
}
