<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>유저 상세 정보</title>
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
        <h2>유저 상세 정보</h2>
        <form action="/adminpage/updateUser" method="post">
            <input type="hidden" name="userCode" value="${user.userCode}" />
            <p>유저 코드: <strong>${user.userCode}</strong></p>
            <p>유저 타입: <strong>${user.userType}</strong></p>
            <p>유저 이름: <input type="text" name="userName" value="${user.userName}" /></p>
            <p>유저 이메일: <input type="text" name="userEmail" value="${user.userEmail}" /></p>
            <p>유저 닉네임: <input type="text" name="userNickname" value="${user.userNickname}" /></p>
            <p>유저 전화번호: <input type="text" name="userPhoneNum" value="${user.userPhoneNum}" /></p>
            <p>유저 주소: <input type="text" name="userAddr" value="${user.userAddr}" /></p>
            <p>상세 주소: <input type="text" name="userAddrLine" value="${user.userAddrLine}" /></p>
            <p>우편 번호: <input type="text" name="userPostalCode" value="${user.userPostalCode}" /></p>
            <p>가입 날짜: <strong>${user.userRegDt}</strong></p>
            <p>회원 상태: <strong>${user.userStatus}</strong></p>
            <button type="submit" class="btn btn-primary">수정</button>
        </form>
    </div>

    <div class="footer">
        <p>관리자 페이지</p>
    </div>
</body>
</html>
