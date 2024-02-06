<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${pagenation.totalItem }개</div>
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
	<div class="pagination flex justify-center mt-3">
		<div class="btn-group">
			<c:if test="${pagenation.startPage > 1 }">
				<a class="btn btn-sm" href="?boardId=${param.boardId }&page=1&search=${param.search }&searchType=${param.searchType }"> ◀◀ </a>
			</c:if>
			<c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="?boardId=${param.boardId }&page=${i }&search=${param.search }&searchType=${param.searchType }">${i }</a>
			</c:forEach>
			<c:if test="${pagenation.endPage < pagenation.totalPage }">
				<a class="btn btn-sm" href="?boardId=${param.boardId }&page=${ pagenation.totalPage}&search=${param.search }&searchType=${param.searchType }"> ▶▶ </a>
			</c:if>
		</div>
	</div>



	<div class="join">
		<div>
			<div>
				<select id="searchType" class="select select-bordered join-item">
					<option value="1" selected>제목</option>
					<option value="2">내용</option>
					<option value="3">작성자</option>
				</select>
				 <input id="search" class="input input-bordered join-item" placeholder="Search" />

			</div>

		</div>
		<div class="indicator">
			<button class="btn join-item btn-outline" onclick="hrefForSearch()">Search</button>
		</div>
	</div>
</section>


<script>
	function hrefForSearch() {
		var searchKeyword = document.getElementById('search').value;
		var boardId = "${param.boardId }";
		var page = "${pagenation.currentPage }";
		var searchType = document.getElementById('searchType').value;
		//alert(searchKeyword + ", " + boardId+","+page);
		window.location.assign("?search=" + searchKeyword + "&boardId="
				+ boardId + "&searchType=" + searchType);
	}
</script>


<%@ include file="../common/foot.jspf"%>