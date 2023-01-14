package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.common.EncryptUtils;
import com.sns.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicationId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		boolean isDuplicated = userBO.existloginId(loginId);
		if (isDuplicated) { // 중복
			result.put("code", 1);
			result.put("result", true);
		} else { // 사용가능
			result.put("code", 1);
			result.put("result", false);
		}
		
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl) {
		
		// 비밀번호 암호화
		String hashedPassword = EncryptUtils.md5(password);
		
		// db insert
		userBO.addUser(loginId, hashedPassword, name, email, profileImageUrl);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
