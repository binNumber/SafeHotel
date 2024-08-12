<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사장님 MY PAGE</title>
    <link href="/css/myPageCEO.css" rel="stylesheet" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Dongle&family=East+Sea+Dokdo&family=Nanum+Pen+Script&display=swap');
    </style>
</head>
<body onload="hideAllSections()">
    <div class="top">
        <p class="dongle"><a href="/">여기가자</a></p>
    </div>
    <div class="main">
        <div class="sidebar">
            <ul>
                <li><a href="#" onclick="updateCEO()">사업자정보변경</a></li>
                <li><a href="#" onclick="showReservation()">예약내역확인 및 변경</a></li>
                <li><a href="#" onclick="showPlaceList()">숙소정보변경</a></li>
                <li><a href="#" onclick="showReviewList()">리뷰확인</a></li>
                <li><a href="#" onclick="deleteUserCEO()">사업자탈퇴</a></li>
            </ul>
        </div>
        <div class="content">
            <div id="password-container">
                <h1>사장님 MY PAGE</h1>
                <p>비밀번호를 입력해주세요</p>
                <input type="password" id="password">
                <button onclick="checkPassword()" class="btn">확인</button>
            </div>
            <div class="updateCEO">
                <h2>사업자 정보 변경</h2>
                <p>아이디 : <input type="text" placeholder="기존값"></p>
                <p>비밀번호 : <input type="password"></p>
                <p>이름 : <input type="text" placeholder="기존값"></p>
                <p>전화번호 : <input type="text" placeholder="01000008888"></p>
                <p>사업자 번호 : <input type="text" placeholder="518205841"></p>
                <button type="submit" class="btn">수정하기</button>
            </div>
            <div class="checkReservation">
                <h2>예약내역</h2>
                <table>
                    <thead>
                        <tr>
                            <th>예약번호</th>
                            <th>예약자 이름</th>
                            <th>전화 번호</th>
                            <th>예약한 방</th>
                            <th>예약 날짜</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>001</td>
                            <td>김철수</td>
                            <td>01084682085</td>
                            <td>101호</td>
                            <td>2024-08-01</td>
                            <td><button class="btn deleteBtn" onclick="deleteReservation(this)">삭제</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="updatePlace">
                <div class="placeList">
                    <p class="placeName"><a href="#" onclick="showPlaceListDetail('사업장 상호명')">사업장 상호명</a></p>
                </div>
                <div class="placeListDetail">
                    <h2>상세 정보</h2>
                    <p>사업장 상호명 : <input type="text" placeholder="기존값"></p>
                    <p>사업장 위치 : <input type="text" placeholder="기존값"></p>
                    <p>업소 타입 : 
                        <select name="" id="">
                            <option value="">호텔</option>
                            <option value="">펜션</option>
                            <option value="">모텔</option>
                            <option value="">게스트하우스</option>
                            <option value="">홈/빌라</option>
                        </select>
                    </p>
                    <p>사업장 전화번호 : <input type="text"></p>
                    <p>객실 종류 : 
                        <select name="" id="">
                            <option value=""></option>
                        </select>
                    </p>
                    <p>객실 갯수 : <input type="text" placeholder="기존값"></p>
                    <p>가격 : <input type="text" placeholder="기존가격"></p>
                    <p>영업상태 : 
                        영업중 <input type="radio" name="status" value="open"> 
                        휴업중 <input type="radio" name="status" value="closed">
                    </p>
                    <button type="submit" class="btn">수정하기</button>
                </div>
            </div>
            <div class="checkReview">
                <div class="reviewList">
                    <p class="placeName"><a href="#" onclick="showReviewListDetail('사업장 상호명')">사업장 상호명</a></p>
                </div>
                <div class="reviewListDetail">
                    <h2>사업장 상호명 리뷰</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>예약번호</th>
                                <th>ID</th>
                                <th>별점</th>
                                <th>리뷰내용</th>
                                <th>작성날짜</th>
                                <th>신고</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>001</td>
                                <td>sek322</td>
                                <td>★★★★★</td>
                                <td>정말 좋은 숙소였어요~!</td>
                                <td>2024-08-01</td>
                                <td><button class="btn deleteBtn" onclick="reviewReport()">신고</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="deleteUserCEO">
                <h2>사업자 탈퇴</h2>
                <form id="deleteForm" action="/delete-account" method="post">
                    <p>비밀번호 : <input type="password" name="deletePassword" id="deletePassword"></p>
                    <button type="submit" onclick="checkDeleteUser(event)" class="btn">탈퇴하기</button>
                </form>
            </div>
        </div>
    </div>
    <script src="/js/myPageCEO.js"></script>
</body>
</html>
