<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>이벤트/쿠폰 관리</title>
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
        <h2>이벤트/쿠폰 관리</h2>
        <button class="btn btn-primary" onclick="showSection('eventCouponRegistration')">이벤트/쿠폰 등록</button>
        <button class="btn btn-secondary" onclick="showSection('eventCouponList')">등록된 리스트 보기</button>

        <div id="eventCouponRegistration" class="section" style="display:none;">
            <h3>이벤트/쿠폰 등록</h3>
            <form id="eventCouponForm">
                <div class="mb-3">
                    <label>이벤트명</label>
                    <input type="text" class="form-control" placeholder="이벤트 이름" name="eventName">
                </div>
                <div class="mb-3">
                    <label>쿠폰 코드</label>
                    <input type="text" class="form-control" placeholder="쿠폰 코드" name="couponCode">
                </div>
                <div class="mb-3">
                    <label>할인율</label>
                    <input type="text" class="form-control" placeholder="10%" name="discountRate">
                </div>
                <div class="mb-3">
                    <label>유효기간</label>
                    <input type="date" class="form-control" name="expiryDate">
                </div>
                <button type="submit" class="btn btn-success" onclick="addEventCoupon()">등록</button>
            </form>
        </div>

        <div id="eventCouponList" class="section" style="display:none;">
            <h3>등록된 이벤트/쿠폰 리스트</h3>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>이벤트명</th>
                        <th>쿠폰 코드</th>
                        <th>할인율</th>
                        <th>유효기간</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody id="eventCouponListBody">
                    <tr>
                        <td>여름 할인</td>
                        <td>SUMMER2024</td>
                        <td>20%</td>
                        <td>2024-08-31</td>
                        <td><button class="btn btn-danger" onclick="deleteEventCoupon(this)">삭제</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="footer">
        <p>관리자 페이지</p>
    </div>

    <script src="/js/admin/eventCouponManagement.js"></script>
</body>
</html>
