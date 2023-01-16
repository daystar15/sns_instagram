<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="p-3 pl-5 d-flex align-items-center justify-content-between">
	<h1 class="logo font-weight-bold">
		<a href="#">
			Marondalgram
		</a>
	</h1>
	<c:if test="${not empty userName}">
		<div>
			<span class="font-weight-bold">${userName}</span>님 환영합니다!
			<a href="/user/sign_out" class="ml-3">로그아웃</a>
		</div>
	</c:if>
</div>