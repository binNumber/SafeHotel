<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>숙소 상세 정보</title>
    <link href="/css/adminPage/adminPage.css" rel="stylesheet">
</head>
<body>
    <div class="header">
        <h1>숙소 상세 정보</h1>
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
        <h2>숙소 기본 정보</h2>
        <form action="/adminpage/updateAccommodation" method="post">
            <input type="hidden" name="acmCode" value="${accommodation.acmCode}" />
            <p><strong>숙소 코드:</strong> ${accommodation.acmCode}</p>
            <p><strong>숙소 이름:</strong> <input type="text" name="acmName" value="${accommodation.acmName}" /></p>
            <p><strong>사업자 코드:</strong> ${accommodation.bsnsCode}</p>
            <p><strong>주소:</strong> <input type="text" name="acmAddr" value="${accommodation.acmAddr}" /></p>
            <p><strong>전화번호:</strong> <input type="text" name="acmTel" value="${accommodation.acmTel}" /></p>

            <h2>숙소 상세 정보</h2>
            <p><strong>숙소 소개:</strong> <textarea name="acmDtlIntroduction">${accommodationDetails.acmDtlIntroduction}</textarea></p>
            <p><strong>공지사항:</strong> <textarea name="acmDtlNotice">${accommodationDetails.acmDtlNotice}</textarea></p>
            <p><strong>기본 정보:</strong> <textarea name="acmDtlInfo">${accommodationDetails.acmDtlInfo}</textarea></p>
            <p><strong>숙소 이용 안내:</strong> <textarea name="acmDtlUsageGuide">${accommodationDetails.acmDtlUsageGuide}</textarea></p>
            <p><strong>인원 추가 정보:</strong> <textarea name="acmDtlAddPersonnel">${accommodationDetails.acmDtlAddPersonnel}</textarea></p>
            <p><strong>객실 정보:</strong> <textarea name="acmDtlRoomInfo">${accommodationDetails.acmDtlRoomInfo}</textarea></p>
            <p><strong>부대시설 정보:</strong> <textarea name="acmDtlFacilities">${accommodationDetails.acmDtlFacilities}</textarea></p>
            <p><strong>주차장 안내:</strong> <textarea name="acmDtlParking">${accommodationDetails.acmDtlParking}</textarea></p>
            <p><strong>대중교통 정보:</strong> <textarea name="acmDtlTransport">${accommodationDetails.acmDtlTransport}</textarea></p>
            <p><strong>이용 혜택:</strong> <textarea name="acmDtlBenefit">${accommodationDetails.acmDtlBenefit}</textarea></p>
            <p><strong>주변 정보:</strong> <textarea name="acmDtlSurroundingInfo">${accommodationDetails.acmDtlSurroundingInfo}</textarea></p>
            <p><strong>추가 안내사항:</strong> <textarea name="acmDtlGuide">${accommodationDetails.acmDtlGuide}</textarea></p>
            <p><strong>취소 및 환불 규정:</strong> <textarea name="acmDtlPolicy">${accommodationDetails.acmDtlPolicy}</textarea></p>
            <p><strong>확인사항 및 기타:</strong> <textarea name="acmDtlEtc">${accommodationDetails.acmDtlEtc}</textarea></p>
            
            <button type="submit" class="btn btn-primary">수정하기</button>
        </form>
    </div>

    <div class="footer">
        <p>관리자 페이지</p>
    </div>
</body>
</html>
