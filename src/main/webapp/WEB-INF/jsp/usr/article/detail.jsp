<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageTitle" value="Article"></c:set>
<%@ include file="../common/head.jspf"%>

	<c:choose>
		<c:when test="${resultData.success }">
			<div class="container">
				<ul>
					<li>번호 : ${resultData.data1.id }</li>
					<li>작성날짜 : ${fn:substring(resultData.data1.regDate, 0, 10) }</li>
					<li>수정 날짜 : ${fn:substring(resultData.data1.updateDate, 0, 10) }</li>
					<li>작성자 : ${resultData.data1.extra__writer }</li>
					<li>제목 : ${resultData.data1.title }</li>
				</ul>
				<div>
					<p>${resultData.data1.body }</p>

				</div>
			</div>
		</c:when>
		<c:otherwise>
			<script>
				var msg = '<c:out value="${resultData.msg }"/>'
				alert(msg);
				window.location.replace("list");
			</script>
		</c:otherwise>
	</c:choose>


<%@ include file="../common/foot.jspf"%>