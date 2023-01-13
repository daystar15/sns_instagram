<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="wrap">
    <div class="w-50 m-auto p-5">
        <h1 class="font-weight-bold mb-4">회원 가입</h1>
        <div class="form-group">
            <label for="id" class="font-weight-bold">ID</label>
            <div class="idBox d-flex">
                <input type="text" name="id" id="id" class="form-control" placeholder="ID를 입력해주세요">
                <button type="button" class="btn btn-primary ml-2">중복확인</button>
            </div>
            <div>
                <span class="text-danger d-block ">사용중인 아이디입니다.</span>
                <span class="text-success d-block">사용가능한 아이디입니다.</span>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="font-weight-bold">password</label>
            <input type="text" name="password" id="password" class="form-control" placeholder="Password">
        </div>
        <div class="form-group">
            <label for="confirmPassword" class="font-weight-bold">conform password</label>
            <input type="text" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="confirm password">
        </div>
        <div class="form-group">
            <label for="name" class="font-weight-bold">이름</label>
            <input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력해주세요">
        </div>
        <div class="form-group">
            <label for="email" class="font-weight-bold">이메일</label>
            <input type="text" name="email" id="email" class="form-control" placeholder="이메일을 입력해주세요">
        </div>
        <div class="form-group d-flex justify-content-end">
            <input type="button" value="가입하기" class="btn btn-primary">
        </div>
    </div>
</div>
    