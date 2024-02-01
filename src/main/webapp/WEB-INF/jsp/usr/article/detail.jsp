<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<table class="table-box-1" border="1">
			<tbody>
				<tr>
					<th><spring:message code="article.id"/></th>
					<td>${article.id }</td>
				</tr>
				<tr>
					<th><spring:message code="article.regDate"/></th>
					<td>${article.regDate }</td>
				</tr>
				<tr>
					<th><spring:message code="article.updateDate"/></th>
					<td>${article.updateDate }</td>
				</tr>
				<tr>
					<th><spring:message code="article.extra__writer"/></th>
					<td>${article.extra__writer }</td>
				</tr>
				<tr>
					<th><spring:message code="title"/></th>
					<td>${article.title }</td>
				</tr>
				<tr>
					<th><spring:message code="body"/></th>
					<td>${article.body }</td>
				</tr>
			</tbody>
		</table>
		<div class="btns">
			<button class="hover:underline" type="button" onclick="history.back();">뒤로가기</button>
			<c:if test="${article.userCanModify }">
				<a href="../article/modify?id=${article.id }">수정</a>
			</c:if>
			<c:if test="${article.userCanDelete }">
				<a onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="../article/doDelete?id=${article.id }">삭제</a>
			</c:if>

		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>