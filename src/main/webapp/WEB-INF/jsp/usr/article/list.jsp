<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 60%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="article" items="${articles }">
					<tr class="hover">
						<td>${article.id }</td>
						<td>${article.regDate.substring(0,10) }</td>
						<td><a href="detail?id=${article.id }">${article.title }</a></td>
						<td>${article.extra__writer }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
<div class="join w-full flex  justify-center">

	<c:if test="${pagenation.startPage > 1 }">
		<button class="join-item btn btn-md" onclick="location.href='/usr/article/list?currentPage=${pagenation.startPage-1 }&boardId=${board.id }'">◀</button>
	</c:if>
	<c:forEach var="pageIndex" begin="${pagenation.startPage }" end="${pagenation.endPage}">

		<c:choose>
			<c:when test="${pageIndex==pagenation.currentPage }">
				<button onclick="false" class="join-item btn btn-md btn-active">${pageIndex }</button>
			</c:when>
			<c:otherwise>
				<button onclick="location.href='/usr/article/list?currentPage=${pageIndex }&boardId=${board.id }'" class="join-item btn btn-md">${pageIndex }</button>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pagenation.endPage < pagenation.totalPage }">
		<button onclick="location.href='/usr/article/list?currentPage=${pagenation.endPage+1 }&boardId=${board.id }'" class="join-item btn btn-md">▶</button>
	</c:if>
</div>



<%@ include file="../common/foot.jspf"%>