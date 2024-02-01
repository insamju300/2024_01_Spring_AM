<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>



<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
	    <form class="w-3/5 rounded-xl shadow-xl bg-red-200 flex flex-col p-4 mt-10" 
     action="/usr/article/modify" method="post">
     <input type="hidden" name="id" value="${article.id }"/>

		<table class="table-box-1" border="1">
			<tbody>
				<tr>
					<th>번호</th>
					<td>${article.id }
					</td>
				</tr>
				<tr>
					<th>작성날짜</th>
					<td>${article.regDate }</td>
				</tr>
				<tr>
					<th>수정날짜</th>
					<td>${article.updateDate }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${article.extra__writer }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input class="m-2" type="text" name="title" value="${article.title }"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input class="m-2" type="text" name="body" value="${article.body }"/></td>
				</tr>
				<tr>
					<td colspan="2"><button > 전송</button></td>
				</tr>
			</tbody>
		</table>
    </form>
		<div class="btns">
			<button class="hover:underline" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>