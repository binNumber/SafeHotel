<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>숙소 리스트</title>
    <link href="/css/adminPage/adminPage.css" rel="stylesheet">
</head>
<body>
    <div class="header">
        <h1>숙소 리스트</h1>
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
        <h2>숙소 리스트</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>숙소 코드</th>
                    <th>숙소 유형</th>
                    <th>숙소명</th>
                    <th>사업자 코드</th>
                    <th>주소</th>
                    <th>전화번호</th>
                    <th>사이트 등록 상태</th>
                    <th>상태 변경</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="acm" items="${accommodations}">
                    <tr>
                        <td><a href="/adminpage/accommodationDetail?acmCode=${acm.acmCode}">${acm.acmCode}</a></td>
                        <td>${acm.acmType}</td>
                        <td>${acm.acmName}</td>
                        <td>${acm.bsnsCode}</td>
                        <td>${acm.acmAddr}</td>
                        <td>${acm.acmTel}</td>
                        <td id="status-${acm.acmCode}">
                            <c:choose>
                                <c:when test="${acm.acmRegSite == 0}">
                                    대기
                                </c:when>
                                <c:when test="${acm.acmRegSite == 1}">
                                    승인됨
                                </c:when>
                                <c:when test="${acm.acmRegSite == 2}">
                                    거절됨
                                </c:when>
                                <c:otherwise>
                                    알 수 없음
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <button onclick="changeStatus(${acm.acmCode}, 1)" class="btn btn-success">승인</button>
                            <button onclick="changeStatus(${acm.acmCode}, 2)" class="btn btn-danger">거절</button>
                            <button onclick="changeStatus(${acm.acmCode}, 0)" class="btn btn-secondary">대기</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="footer">
        <p>관리자 페이지</p>
    </div>

    <script src="/js/admin/accommodationList.js"></script> <!-- JavaScript 파일 포함 -->
</body>
</html>
