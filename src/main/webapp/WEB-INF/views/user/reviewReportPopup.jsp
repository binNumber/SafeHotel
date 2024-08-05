<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/reviewReport.css">
</head>
<body>
    <div class="form-container">
        <form action="">
            <h2>신고사유를 선택해주세요</h2>
            <label>
                <input type="radio" name="reportReason">
                영리목적/홍보성
            </label>
            <label>
                <input type="radio" name="reportReason">
                욕설/인신공격
            </label>
            <label>
                <input type="radio" name="reportReason">
                개인정보노출
            </label>
            <label>
                <input type="radio" name="reportReason">
                음란성/선정성
            </label>
            <label>
                <input type="radio" name="reportReason">
                같은 내용 도배
            </label>
            <label>
                <input type="radio" name="reportReason">
                기타
            </label>
            <input type="text" placeholder="직접작성해주세요" class="custom-input">
            <button type="submit">제출</button>
        </form>
    </div>
</body>
</html>