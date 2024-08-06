<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 MY PAGE</title>
    <link href="/css/myPageAdmin.css" rel="stylesheet" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Dongle&family=East+Sea+Dokdo&family=Nanum+Pen+Script&display=swap');
    </style>
</head>
<body>
    <div class="top">
        <p class="dongle"><a href="#">여기가자</a></p>
    </div>
    <div class="main">
        <div class="sidebar">
            <ul>
                <li><a href="#" onclick="showAccommodationApproval()">숙소 등록 승인</a></li>
                <li><a href="#" onclick="showUserManagement()">유저 관리</a></li>
                <li><a href="#" onclick="showReviewReportManagement()">리뷰 신고 관리</a></li>
                <li>
                    <a href="#" onclick="toggleEventCouponSubmenu()">이벤트/쿠폰 관리</a>
                    <ul class="submenu" id="eventCouponSubmenu">
                        <li><a href="#" onclick="showEventCouponRegistration()">이벤트/쿠폰 등록</a></li>
                        <li><a href="#" onclick="showEventCouponList()">등록된 리스트 보기</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="content">
            <div class="accommodationApproval">
                <h2>숙소 등록 승인</h2>
                <table>
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
                        <!-- 숙소 등록 요청 리스트 출력 -->
                        <tr>
                            <td>001</td>
                            <td>호텔 A</td>
                            <td>김철수</td>
                            <td>2024-08-01</td>
                            <td><button class="btn approveBtn" onclick="approveAccommodation(this)">승인</button></td>
                            <td><button class="btn rejectBtn" onclick="rejectAccommodation(this)">거절</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="userManagement">
                <h2>유저 관리</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>이름</th>
                            <th>이메일</th>
                            <th>전화 번호</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 유저 리스트 출력 -->
                        <tr>
                            <td>user001</td>
                            <td>홍길동</td>
                            <td>hong@example.com</td>
                            <td>010-1234-5678</td>
                            <td><button class="btn deleteBtn" onclick="deleteUser(this)">삭제</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="reviewReportManagement">
                <h2>리뷰 신고 관리</h2>
                <table>
                    <thead>
                        <tr>
                            <th>리뷰 번호</th>
                            <th>ID</th>
                            <th>신고 내용</th>
                            <th>리뷰 내용</th>
                            <th>리뷰 날짜</th>
                            <th>처리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 리뷰 신고 리스트 출력 -->
                        <tr>
                            <td>R001</td>
                            <td>user002</td>
                            <td>부적절한 내용</td>
                            <td>리뷰 내용 예시</td>
                            <td>2024-08-01</td>
                            <td><button class="btn handleBtn" onclick="handleReviewReport(this)">처리</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="eventCouponRegistration">
                <h2>이벤트/쿠폰 등록</h2>
                <form id="eventCouponForm">
                    <p>이벤트명 : <input type="text" placeholder="이벤트 이름" name="eventName"></p>
                    <p>쿠폰 코드 : <input type="text" placeholder="쿠폰 코드" name="couponCode"></p>
                    <p>할인율 : <input type="text" placeholder="10%" name="discountRate"></p>
                    <p>유효기간 : <input type="date" name="expiryDate"></p>
                    <button type="submit" class="btn" onclick="addEventCoupon()">등록</button>
                </form>
            </div>
            <div class="eventCouponList">
                <h2>등록된 이벤트/쿠폰 리스트</h2>
                <table>
                    <thead>
                        <tr>
                            <th>이벤트명</th>
                            <th>쿠폰 코드</th>
                            <th>할인율</th>
                            <th>유효기간</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody id="eventCouponList">
                        <!-- 예시 데이터 -->
                        <tr>
                            <td>여름 할인</td>
                            <td>SUMMER2024</td>
                            <td>20%</td>
                            <td>2024-08-31</td>
                            <td><button class="btn deleteBtn" onclick="deleteEventCoupon(this)">삭제</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="/js/myPageAdmin.js"></script>
</body>
</html>
