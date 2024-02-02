<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<div class="fromBox w-full py-20 flex justify-center ">
	<form class="p-10 w-full max-w-sm rounded border border-pink-300 shadow-lg" action="../member/doJoin" method="post">
		<div class="md:flex md:items-center mb-6 ">
			<div class="md:w-1/3">
				<label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4" for="loginId"> 로그인Id </label>
			</div>
			<div class="md:w-2/3">
				<input
					class="bg-pink-100 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-pink-400 leading-tight focus:outline-none focus:bg-white focus:border-pink-400"
					id="loginId" name="loginId" type="text" placeholder="아이디를 입력해주세요." autocomplete='off'>
			</div>
		</div>

		<div class="md:flex md:items-center mb-6 ">
			<div class="md:w-1/3">
				<label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4" for="loginPw"> 로그인 패스워드 </label>
			</div>
			<div class="md:w-2/3">
				<input
					class="bg-pink-100 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-pink-400 leading-tight focus:outline-none focus:bg-white focus:border-pink-400"
					id="loginPw" name="loginPw" type="password" placeholder="비밀번호를 입력해주세요." autocomplete='off'>
			</div>
		</div>

		<div class="md:flex md:items-center mb-6 ">
			<div class="md:w-1/3">
				<label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4" for="name"> 이름 </label>
			</div>
			<div class="md:w-2/3">
				<input
					class="bg-pink-100 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-pink-400 leading-tight focus:outline-none focus:bg-white focus:border-pink-400"
					id="name" name="name" type="text" placeholder="이름을 입력해주세요." autocomplete='off'>
			</div>
		</div>

		<div class="md:flex md:items-center mb-6 ">
			<div class="md:w-1/3">
				<label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4" for="nickname"> 닉네임 </label>
			</div>
			<div class="md:w-2/3">
				<input
					class="bg-pink-100 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-pink-400 leading-tight focus:outline-none focus:bg-white focus:border-pink-400"
					id="nickname" name="nickname" type="text" placeholder="닉네임을 입력해주세요." autocomplete='off'>
			</div>
		</div>

		<div class="md:flex md:items-center mb-6 ">
			<div class="md:w-1/3">
				<label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4" for="cellphoneNum"> 전화번호 </label>
			</div>
			<div class="md:w-2/3">
				<input
					class="bg-pink-100 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-pink-400 leading-tight focus:outline-none focus:bg-white focus:border-pink-400"
					id="cellphoneNum" name="cellphoneNum" type="text" placeholder="전화번호를 입력해주세요." autocomplete='off'>
			</div>
		</div>

		<div class="md:flex md:items-center mb-6 ">
			<div class="md:w-1/3">
				<label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4" for="email"> 이메일 </label>
			</div>
			<div class="md:w-2/3">
				<input
					class="bg-pink-100 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-pink-400 leading-tight focus:outline-none focus:bg-white focus:border-pink-400"
					id="email" name="email" type="text" placeholder="이메일을 입력해주세요." autocomplete='off'>
			</div>
		</div>

		<div class="flex items-center justify-center">
			<button
				class="shadow bg-pink-200 text-pink-700 hover:bg-pink-700 hover:text-white focus:shadow-outline focus:outline-none font-bold py-2 px-4 rounded duration-100 ">
				회원가입</button>
		</div>
	</form>
</div>


<%@ include file="../common/foot.jspf"%>