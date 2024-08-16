<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>유저 목록</title>
    <link href="/css/adminPage/adminPage.css" rel="stylesheet">
</head>
<body>
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
        <h2>유저 목록</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>유저 코드</th>
                    <th>유저 이름</th>
                    <th>유저 이메일</th>
                    <th>유저 닉네임</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td><a href="/adminpage/userDetail?userCode=${user.userCode}">${user.userCode}</a></td>
                        <td>${user.userName}</td>
                        <td>${user.userEmail}</td>
                        <td>${user.userNickname}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="footer">
        <p>관리자 페이지</p>
    </div>
</body>
</html>
