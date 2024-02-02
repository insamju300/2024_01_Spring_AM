<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<div class="fromBox w-full py-20 flex justify-center ">
	<form class="p-10 w-full max-w-sm rounded border border-pink-300 shadow-lg" action="../article/doWrite" method="post">
	<input type="hidden" value="${article.id}" name="id"> 
		<div class="md:flex md:items-center mb-6 ">
			<div class="md:w-1/3">
				<label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4" for="title"> 타이틀 </label>
			</div>
			<div class="md:w-2/3">
				<input
					class="bg-pink-100 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-pink-400 leading-tight focus:outline-none focus:bg-white focus:border-pink-400"
					id="title" name="title" type="text" placeholder="타이틀" autocomplete='off'>
			</div>
		</div>

		<div class="md:flex md:items-center mb-6">
			<div class="md:w-full">

				<textarea
					class="bg-pink-100 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-pink-400 leading-tight focus:outline-none focus:bg-white focus:border-pink-400"
					rows="15" id="body" name="body" autocomplete='off'> </textarea>
			</div>
		</div>

		<div class="flex items-center justify-center">
			<button
				class="shadow bg-pink-200 text-pink-700 hover:bg-pink-700 hover:text-white focus:shadow-outline focus:outline-none font-bold py-2 px-4 rounded duration-100 ">
				글쓰기</button>
		</div>
	</form>
</div>


<%@ include file="../common/foot.jspf"%>