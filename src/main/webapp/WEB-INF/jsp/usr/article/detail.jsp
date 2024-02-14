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
		if (loginCheck == "false") {
			alert("로그인 후 이용할 수 있습니다.");
			return false;
		}
		var loginMemberId = "${rq.loginedMemberId }";
		var articleMemberId = "${article.memberId}"
		
		if(loginMemberId == articleMemberId){
			alert("본인의 글에는 좋아요나 싫어요를 누를 수 없습니다.")
			return false;
		}

		return true;
	}
	function test(){
		alert("곤란해");
		Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.add('text-gray-400'));
		Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.remove('text-red-600'));
	}
	
	function toggleLikeOnly(){
		if (!loginCheck()) {
			return;
		}
		
		$.get('../preferance/toggleLikeOnly', {
			id : params.id
		}, function(data) {
			console.log(data);
			if (data.likes) {
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.add('text-red-600'));
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.remove('text-gray-400'));
			} else {
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.add('text-gray-400'));
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.remove('text-red-600'));
			}
			$('.likesCount').empty().html(data.likesCount);

		}, 'json');
	}

	function toggleLike() {
		if (!loginCheck()) {
			return;
		}

		$.get('../preferance/toggleLike', {
			id : params.id
		}, function(data) {
			console.log(data);
			if (data.likes) {
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.add('text-red-600'));
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.remove('text-gray-400'));
			} else {
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.add('text-gray-400'));
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.remove('text-red-600'));
			}
			if (data.hates) {
				Array.from(document.getElementsByClassName("hate")).forEach((element) =>element.classList.add('text-purple-700'));
				Array.from(document.getElementsByClassName("hate")).forEach((element) =>element.classList.remove('text-gray-400'));
			} else {
				Array.from(document.getElementsByClassName("hate")).forEach((element) =>element.classList.add('text-gray-400'));
				Array.from(document.getElementsByClassName("hate")).forEach((element) =>element.classList.remove('text-purple-700'));
			}
			$('.likesCount').empty().html(data.likesCount);

		}, 'json');

	}

	function toggleHate() {
		if (!loginCheck()) {
			return;
		}
		loginCheck();
		$.get('../preferance/toggleHate', {
			id : params.id
		}, function(data) {
			console.log(data);
			if (data.likes) {
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.add('text-red-600'));
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.remove('text-gray-400'));
			} else {
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.add('text-gray-400'));
				Array.from(document.getElementsByClassName("like")).forEach((element) =>element.classList.remove('text-red-600'));
			}
			if (data.hates) {
				Array.from(document.getElementsByClassName("hate")).forEach((element) =>element.classList.add('text-purple-700'));
				Array.from(document.getElementsByClassName("hate")).forEach((element) =>element.classList.remove('text-gray-400'));
			} else {
				Array.from(document.getElementsByClassName("hate")).forEach((element) =>element.classList.add('text-gray-400'));
				Array.from(document.getElementsByClassName("hate")).forEach((element) =>element.classList.remove('text-purple-700'));
			}
			$('.likesCount').empty().html(data.likesCount);
		}, 'json');

	}
</script>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<div class="flex">
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
						<th>테스트</th>
						<td>
							<button onclick="test()">
								테스트
							</button>
						</td>					
					</tr>


					<tr>
						<th>좋아요</th>
						<td>
							<button onclick="toggleLike()" class="like ${article.likes? 'text-red-600' : 'text-gray-400' }">
								<i class="fa-solid fa-heart"></i>
							</button>
							<p class="likesCount">${article.likesCount }</p>
						</td>
					</tr>
					<tr>
						<th>싫어요</th>
						<td>
							<button onclick="toggleHate()" class="hate ${article.hates? 'text-purple-700' : 'text-gray-400' }">
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
							<button onclick="toggleLikeOnly()" class="like ${article.likes? 'text-red-600' : 'text-gray-400' }">
								<i class="fa-solid fa-heart"></i>
							</button>
							<p class="likesCount">${article.likesCount }</p>
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

		</div>
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