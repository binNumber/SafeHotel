<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리뷰 신고 관리</title>
<link href="/css/adminPage/adminPage.css" rel="stylesheet">
</head>
<body>
	<div class="header">
		<h1>관리자 메뉴</h1>
	</div>
	<div class="sidebar">
		<h3>관리 메뉴</h3>
		<ul>
			<li><a href="/adminpage/accommodationApproval">숙소 등록 승인</a></li>
			<li><a href="/adminpage/accommodationList">숙소 리스트</a></li>
			<li><a href="/adminpage/userManagement">유저 관리</a></li>
			<li><a href="/adminpage/reviewReportManagement">리뷰 신고 관리</a></li>
			<li><a href="/adminpage/eventCouponManagement">이벤트/쿠폰 관리</a></li>
		</ul>
	</div>

	<div class="content">
		<h2>리뷰 신고 관리</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>리뷰 번호</th>
					<th>유저 코드</th>
					<th>신고 내용</th>
					<th>리뷰 내용</th>
					<th>리뷰 날짜</th>
					<th>처리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="report" items="${reviewReportList}">
					<tr>
						<td>${report.reviewCode}</td>
						<td>${report.userCode}</td>
						<td>${report.reportReason}</td>
						<td>${report.reviewText}</td>
						<td>${report.reviewDate}</td>
						<td>
							<button class="btn btn-warning"
								onclick="handleReviewReport(this)">처리</button>
							<button class="btn btn-secondary"
								onclick="revertReviewReport(this)">취소</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="footer">
		<p>관리자 페이지</p>
	</div>

	<script src="/js/admin/reviewReportManagement.js"></script>
</body>
</html>
