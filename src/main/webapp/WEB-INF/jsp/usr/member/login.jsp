<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>
<div class="w-full flex justify-center  mx-auto">
	<form class="bg-gray-700 shadow-md rounded px-8 pt-6 pb-8 mb-4" action="/usr/member/login" method="post">
		<label class="block text-white text-sm font-bold mb-2" for="loginId">로그인 id</label> 
		<input
			class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
			type="text" name="loginId" /> 
		<label class="block text-white text-sm font-bold mb-2" for="password">패스워드</label> 
		<input
			class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline "
			type="password" name="loginPw">
		<div class="w-full flex justify-center mt-5">
			<button
				class=" bg-white text-gray-700 hover:bg-gray-500 hover:text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline duration-200">전송</button>
		</div>
	</form>
</div>
<%@ include file="../common/foot.jspf"%>
