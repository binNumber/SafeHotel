<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>숙소 등록 승인</title>
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
            <li><a href="/adminpage/userManagement">유저 관리</a></li>
            <li><a href="/adminpage/reviewReportManagement">리뷰 신고 관리</a></li>
            <li><a href="/adminpage/eventCouponManagement">이벤트/쿠폰 관리</a></li>
        </ul>
    </div>

    <div class="content">
        <h2>숙소 등록 승인</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>등록 번호</th>
                    <th>숙소명</th>
                    <th>사업자명</th>
                    <th>등록 날짜</th>
                    <th>승인</th>
                    <th>거절</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>001</td>
                    <td>호텔 A</td>
                    <td>김철수</td>
                    <td>2024-08-01</td>
                    <td><button class="btn btn-success" onclick="approveAccommodation(this)">승인</button></td>
                    <td><button class="btn btn-danger" onclick="rejectAccommodation(this)">거절</button></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="footer">
        <p>관리자 페이지</p>
    </div>

    <script src="/js/admin/accommodationApproval.js"></script>
</body>
</html>
