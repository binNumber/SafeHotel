<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>사장님 MY PAGE</title>
        <link href="css/CEOmypage.css" rel="stylesheet" type="text/css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Dongle&family=East+Sea+Dokdo&family=Nanum+Pen+Script&display=swap');
        </style>
    </head>
    <body>
        <div class="top">
            <p class="dongle"><a href="">여기가자</a></p>
        </div>
        <div class="main">
            <div class="sidebar">
                <ul>
                    <li><a href="#" onclick="updateCEO()">사업자정보변경</a></li>
                    <li><a href="#" onclick="showReservation()">예약내역확인 및 변경</a></li> <!-- 예약내역 확인 클릭 시 호출 -->
                    <li><a href="#" onclick="">숙소정보변경</a></li>
                    <li><a href="#" onclick="">리뷰확인</a></li>
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
                    <p>아이디 : <input type="text" placeholder="기존값"></p>
                    <p>비밀번호 : <input type="password"></p>
                    <p>이름 : <input type="text" placeholder="기존값"></p>
                    <p>전화번호 : <input type="text" placeholder="01000008888"></p>
                    <p>사업자 번호 : <input type="text" placeholder="518205841"></p>
                    <button type="submit" class="updateBtn">수정하기</button>
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
                                <th>삭제</th> <!-- 삭제 버튼 열 추가 -->
                            </tr>
                        </thead>
                        <tbody><!--for문으로 돌리기-->
                            <tr>
                                <td>001</td>
                                <td>김철수</td>
                                <td>01084682085</td>
                                <td>101호</td>
                                <td>2024-08-01</td>
                                <td><button class="deleteBtn" onclick="deleteReservation(this)">삭제</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="updatePlace">
                    <div class="palceList">
                        <p>사업장 상호명 : <input type="text" placeholder="기존값"></p>
                        <p>사업장 위치 : <input type="text" placeholder="기존값"></p>
                        <p>업소 타입 : <select name="" id=""></select></p>
                    </div>
                </div>
                <div class="checkReview">
    
                </div>
                <div class="deleteUserCEO">
                    <form id="deleteForm" action="/delete-account" method="post">
                        <p>비밀번호 : <input type="password" name="deletePassword"></p>
                        <button type="submit" onclick="checkDeleteUser(event)">탈퇴하기</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/CEOmypage.js"></script>
    </body>
    </html>