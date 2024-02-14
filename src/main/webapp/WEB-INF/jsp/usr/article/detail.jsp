<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- <iframe src="http://localhost:8081/usr/article/doIncreaseHitCountRd?id=372" frameborder="0"></iframe> -->
<script>
	const params = {};
	params.id = parseInt('${param.id}');
	let localStorageName = 'isAlreadyHit' + params.id;

	function ArticleDetail__doIncreaseHitCount() {
		$.get('../article/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode : 'Y'
		}, function(data) {
			$('.article-detail__hit-count').empty().html(data.data1);
		}, 'json');

		localStorage.setItem(localStorageName, true);
	}

	$(function() {
		console.log('isAlreadyHit' + params.id);
		if (!localStorage.getItem(localStorageName)) {
			ArticleDetail__doIncreaseHitCount();
			// 		setTimeout(ArticleDetail__doIncreaseHitCount, 2000);
		}
	})
	
	function loginCheck() {
		var loginCheck = "${rq.isLogined() }";
		if (loginCheck=="false") {
			alert("로그인 후 이용할 수 있습니다.");
			return false;
		}
		
		return true;
	}

	function toggleLike() {
		if(!loginCheck()){
			return;
		}

		$.get('../preferance/toggleLike', {
			id : params.id
		}, function(data) {
			console.log(data);
			if (data.likes) {
				document.getElementById("like").classList.add('text-red-600')
				document.getElementById("like").classList
						.remove('text-gray-400')
			} else {
				document.getElementById("like").classList.add('text-gray-400')
				document.getElementById("like").classList
						.remove('text-red-600')
			}
			if (data.hates) {
				document.getElementById("hate").classList
						.add('text-purple-700')
				document.getElementById("hate").classList
						.remove('text-gray-400')
			} else {
				document.getElementById("hate").classList.add('ext-gray-400')
				document.getElementById("hate").classList
						.remove('text-purple-700')
			}
			$('#likesCount').empty().html(data.likesCount);

		}, 'json');

	}

	function toggleHate() {
		if(!loginCheck()){
			return;
		}
		loginCheck();
		$.get('../preferance/toggleHate', {
			id : params.id
		}, function(data) {
			console.log(data);
			if (data.likes) {
				document.getElementById("like").classList.add('text-red-600')
				document.getElementById("like").classList
						.remove('text-gray-400')
			} else {
				document.getElementById("like").classList.add('text-gray-400')
				document.getElementById("like").classList
						.remove('text-red-600')
			}
			if (data.hates) {
				document.getElementById("hate").classList
						.add('text-purple-700')
				document.getElementById("hate").classList
						.remove('text-gray-400')
			} else {
				document.getElementById("hate").classList.add('text-gray-400')
				document.getElementById("hate").classList
						.remove('text-purple-700')
			}
			$('#likesCount').empty().html(data.likesCount);
		}, 'json');

	}
</script>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<table class="table-box-1" border="1">
			<tbody>
				<tr>
					<th>번호</th>
					<td>${article.id }</td>
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
					<td>${article.title }</td>
				</tr>

				<tr>
					<th>좋아요</th>
					<td>
						<button id="like" onclick="toggleLike()" class="${article.likes? 'text-red-600' : 'text-gray-400' }">
							<i class="fa-solid fa-heart"></i>
						</button>
						<p id="likesCount">${article.likesCount }</p>
					</td>
				</tr>
				<tr>
					<th>싫어요</th>
					<td>
						<button id="hate" onclick="toggleHate()" class="${article.hates? 'text-purple-700' : 'text-gray-400' }">
							<i class="fa-solid fa-hand-middle-finger"></i>
						</button>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${article.body }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><span class="article-detail__hit-count">${article.hitCount }</span></td>
				</tr>
			</tbody>
		</table>
		<div class="btns mt-5">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
			<c:if test="${article.userCanModify }">
				<a class="btn btn-outline" href="../article/modify?id=${article.id }">수정</a>
			</c:if>
			<c:if test="${article.userCanDelete }">
				<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
					href="../article/doDelete?id=${article.id }">삭제</a>
			</c:if>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>