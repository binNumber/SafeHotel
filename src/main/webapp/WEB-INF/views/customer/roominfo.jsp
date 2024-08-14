<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" />

</head>
<body>
	<div class="container-roominfo">
		<div class="header">
			<div class="nav-top">
				<div class="nav-top-left">
					<a href="#" id="icon-btn"><img src="img/icon1.png" /></a>
					<div class="hidenav" id="sidebar">
						<div class="hidenavcontent">
							<button id="close-btn" class="close-btn">X</button>
							<ul>
								<li><a href="#" class="category" data-target="subcategory1">카테고리
										1</a>
									<ul class="subcategories" id="subcategory1">
										<li><a href="#">하위 카테고리 1-1</a></li>
										<li><a href="#">하위 카테고리 1-2</a></li>
										<li><a href="#">하위 카테고리 1-3</a></li>
									</ul></li>
								<li><a href="#" class="category" data-target="subcategory2">카테고리
										2</a>
									<ul class="subcategories" id="subcategory2">
										<li><a href="#">하위 카테고리 2-1</a></li>
										<li><a href="#">하위 카테고리 2-2</a></li>
										<li><a href="#">하위 카테고리 2-3</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="nav-top-center">
					<a href="/">여기가자</a>
				</div>
				<div class="nav-top-right" id="success-login">
					<c:if test="${empty user}">
						<button onclick="location.href='/usersign'">로그인/회원가입</button>
					</c:if>

					<c:if test="${not empty user}">
						<button id="mypage-btn" onclick="location.href='/mypage/checkPw'">${user.userNickname}</button>
						<button id="logout-btn" onclick="location.href='/userlogout'">로그아웃</button>
					</c:if>
				</div>
			</div>
		</div>

		<div class="sticky-nav" id="sticky-nav">
			<ul>
				<li><a href="#section1">개요</a></li>
				<li><a href="#section2">지도</a></li>
				<li><a href="#section3">객실선택</a></li>
				<li><a href="#section4">숙소소개/이용안내</a></li>
				<li><a href="#section5">리뷰</a></li>
			</ul>
		</div>
		<div class="content-roominfo">
			<div id="section1">
				<div class="content-info">
					<div class="content-mainphoto">
						<div class="mainphoto">사진1</div>

						<div class="subphoto">
							<div class="photosection">
								<div class="photo2">사진2</div>
								<div class="photo3">사진3</div>
							</div>

							<div class="photosection">
								<div class="photo4">사진4</div>
								<div class="photo5">
									사진5
									<!-- 모달 버튼 -->
									<div class="btn-photo">
										<button id="openModalBtn">사진 모두보기</button>
									</div>

									<!-- 모달 창 -->
									<div id="photoModal" class="modal">
										<div class="modal-content">
											<span class="close" id="closeModalBtn">&times;</span>
											<div class="modal-header">
												<h2>숙소명</h2>
												<div class="modal-roomlist">
													<div class="modal-roomlist-room1">
														<button>
															<p>객실명</p>
														</button>
													</div>
													<div class="modal-roomlist-room1">
														<button>
															<p>객실명2</p>
														</button>
													</div>
													<div class="modal-roomlist-room1">
														<button>
															<p>객실명3</p>
														</button>
													</div>
												</div>
											</div>
											<div class="modal-body">
												<div class="gallery-container">
													<!-- 큰 이미지가 표시될 영역 -->
													<div class="large-image-container">
														<button class="gallery-prev">&lt;</button>
														<img id="largeImage" src="img/test1.jpg"
															class="large-image">
														<button class="gallery-next">&gt;</button>
													</div>
													<!-- 썸네일 이미지들이 표시될 영역 -->
													<div class="thumbnail-container">
														<img src="img/test1.jpg" class="gallery-thumbnail"
															data-large-src="img/test1.jpg"> <img
															src="img/test2.jpg" class="gallery-thumbnail"
															data-large-src="img/test2.jpg"> <img
															src="img/test2.jpg" class="gallery-thumbnail"
															data-large-src="img/test2.jpg">
														<!-- 필요에 따라 썸네일 이미지를 추가 -->
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sectionline"></div>
			</div>
			<div id="section2">
				<div class=content-roominfo-main>
					<div class="roominfo-top">
						<div class="roominfo-title">
							<h1>숙소명</h1>
						</div>
					</div>
				</div>
				<div class="roominfo-top-position">
					<h3>숙소주소</h3>
				</div>
				<div class="roominfo-top-map">
					<p>지도
				</div>
				<div class="sectionline"></div>
			</div>
			<div id="section3">
				<div class=content-roominfo-list>
					<div>
						<h1>객실 선택</h1>
					</div>
					<div class=content-roominfo-listsection>
						<div class="listsection-photo">
							<p>객실 대표사진</p>
							<button>더보기</button>
						</div>
						<div class="listsection-main">
							<div class="listmain-title">
								<h1>객실명</h1>
							</div>
							<div class="listmain-content">
								<div class="listmain-time">
									<h6>입실시간</h6>
									<h6>퇴실시간</h6>
								</div>
								<div class="listmain-remainder">
									<h3>가격</h3>
									<button>예약하기</button>
								</div>
							</div>
							<div class="listsection-roominfo">
								<div class="listsection-roominfo-text">
									<h6>객실정보</h6>
									<h6>기준2인/최대2인</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sectionline"></div>
			</div>
			<div id="section4">
				<div class="content-roominfo-info">
					<div class="info-section">
						<div class="info-section-title">
							<h1>숙소 소개</h1>
							<h5>숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소
								소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개 숙소 소개
								숙소 소개</h5>
						</div>
					</div>
				</div>
				<div class="sectionline"></div>
				<div class="content-roominfo-text">
					<div class="info-sectiontext">
						<div class="info-section-text">
							<h1>숙소 이용 정보</h1>

							<div class="notice infosection-bottom">
								<h3>공지사항</h3>
								<ul>
									<li><p>공지사항1</p></li>
									<li><p>공지사항2</p></li>
								</ul>
							</div>

							<div class="notice infosection-bottom">
								<h3>기본정보</h3>
								<ul>
									<li><p>체크인: / 체크아웃:</p></li>
									<li><p>22시 이후 체크인 시 호텔 프론트 문의</p></li>
									<li><p>얼리체크인, 레이트 체크아웃 시 1시간당 2만원 현장 결제 (별도 문의)</p></li>
									<li><p>무료 Wi-Fi</p></li>
									<li><p>전 객실 금연</p></li>
									<li><p>Bath Amenity (치약, 칫솔 제외)</p></li>
									<li><p>주차 가능 (무료)</p></li>
									<li><p>반려동물 입장불가</p></li>
								</ul>
							</div>

							<div class="notice infosection-bottom">
								<h3>인원 추가 정보</h3>
								<ul>
									<li><p>기준 인원 외 추가 시, 1인 10,000원 (14세 이상~성인), 5,000원
											(48개월 이상~13세), 48개월 미만 무료</p></li>
									<li><p>침구 추가 : 1채당 20,000원</p></li>
									<li><p>영유아 인원수 포함 / 최대 인원 초과 불가</p></li>
									<li><p>현장 결제</p></li>
								</ul>
							</div>

							<div class="notice infosection-bottom">
								<h3>투숙객 혜택</h3>
								<ul>
									<li><p>야외 온천 수영장 객실별 투숙 기준인원 무료 이용</p></li>
									<li><p>피트니스, 골프연습장 이용 무료</p></li>
								</ul>
							</div>

							<div class="notice infosection-bottom">
								<h3>부대시설 정보</h3>
								<ul>
									<li><p>부대시설 운영시간은 현장 상황에 따라 변경될 수 있습니다</p></li>
									<li><p>모든 부대시설은 체크인 전 및 체크아웃 후에는 이용이 불가합니다</p></li>
									<li><p>웰컴존 지하1층 - 체스터책방, 치유인(온천사우나), 로비</p></li>
									<li><p>A동 1층 : 노마드오피스, 키즈락, AV룸, 야외놀이</p></li>
									<li><p>B동 1층 : 요리공작소, 멀티룸, 희희낙락</p></li>
									<li><p>C동 1층 : 골프연습장, 피트니스</p></li>
									<li><p>A/B/C동 옥상 : 루프탑</p></li>
									<li><p>매월 4월~10월 운영</p></li>
									<li><p>[온천수영장 / 노천탕]</p></li>
									<li><p>동절기 휴장기간 : 매년 11월 1일~3월 31일</p></li>
									<li><p>[치유인(온천사우나)]</p></li>
									<li><p>중앙광장 지하 1층 / 07:00~21:00 (입장마감 1시간 전까지)</p></li>
									<li><p>매월 첫 번째 화요일 휴장</p></li>
								</ul>
							</div>

							<div class="notice infosection-bottom">
								<h3>조식 정보</h3>
								<ul>
									<li><p>요리공작소 / B동 1층 / 07:00~10:00 (입장 마감 09:00)</p></li>
									<li><p>현장 결제 / 사전 예약 (선착순 마감)</p></li>
								</ul>
							</div>

							<div class="notice infosection-bottom">
								<h3>취소 및 환불 규정</h3>
								<ul>
									<li><p>[일~금요일 및 비수기]</p></li>
									<li><p>체크인일 기준 3일 전 : 100% 환불</p></li>
									<li><p>체크인일 기준 2일 전 : 70% 환불</p></li>
									<li><p>체크인일 기준 1일 전~당일 및 No-show : 환불 불가</p></li>
									<li><p>[토요일 및 성수기]</p></li>
									<li><p>체크인일 기준 6일 전 : 100% 환불</p></li>
									<li><p>체크인일 기준 5~4일 전 : 50% 환불</p></li>
									<li><p>체크인일 기준 3일 전~당일 및 No-show : 환불 불가</p></li>
									<li><p>※ 2024년 성수기 날짜 : 7월 22일~8월 10일</p></li>
									<li><p>취소, 환불 시 수수료가 발생할 수 있습니다</p></li>
								</ul>
							</div>

							<div class="notice infosection-bottom">
								<h3>확인사항 및 기타</h3>
								<ul>
									<li><p>그린 캠페인에 동참하고자 객실 정비 서비스 (침구류 교체 포함)는 3박부터 무료로
											제공되며, 별도 요청 시에는 요금이 부과되니 프론트로 문의 바랍니다</p></li>
									<li><p>외부 배달음식은 규정 상 로비에서 수령을 해 주시기 바랍니다</p></li>
									<li><p>취사는 쾌적한 객실 환경을 위하여, B동 1층의 요리 공작소를 이용하여 주시기
											바랍니다 (객실 내 별도의 조리기구는 비치되어 있지 않습니다)</p></li>
									<li><p>메세지1</p></li>
									<li><p>메세지1</p></li>
									<li><p>메세지1</p></li>
									<li><p>메세지1</p></li>
									<li><p>메세지1</p></li>
									<li><p>메세지1</p></li>
									<li><p>메세지1</p></li>
									<li><p>메세지1</p></li>
								</ul>
							</div>

						</div>
					</div>
					<div class="sectionline"></div>
				</div>

			</div>
			<div id="section5">
				<div class="content-roominfo-review">
					<div class="review-section">
						<div class="review-section-title">
							<h1>리뷰</h1>
							<h3>평점 x.x점</h3>
						</div>
						<div class="review-section-main">
							<div class="review-section-left">
								<div class="review-section-left-userinfo">
									<div class="userinfo-nickname">
										<p>닉네임</p>
									</div>
									<div class="userinfo-review">
										<h5>리뷰</h5>
										<h5>·</h5>
										<h5>사진</h5>
									</div>
								</div>
							</div>
							<div class="review-section-right">
								<div class="review-right-score">
									<p>(0/5)</p>
									<p>리뷰 남긴 날짜</p>
								</div>
								<div class="review-right-photo">

									<div class="btn_reviewpage prev">
										<button class="prev">&lt;</button>
									</div>
									<div class="reviewsection-slides">
										<div class="reviewsection-photo">사용자가 등록한 리뷰사진1</div>
										<div class="reviewsection-photo">사용자가 등록한 리뷰사진2</div>
										<div class="reviewsection-photo">사용자가 등록한 리뷰사진3</div>
										<div class="reviewsection-photo">사용자가 등록한 리뷰사진4</div>
									</div>
									<div class="btn_reviewpage next">
										<button class="next">&gt;</button>
									</div>
								</div>

								<div class="reviewsection-roominfo">
									<h4>이용한 객실명</h4>
								</div>

								<div class="reviewsection-msg">
									<p class="review-message" id="review-text">리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에
										들어갑니다. 리뷰 메세지가 여기에 들어갑니다. 리뷰 메세지가 여기에 들어갑니다.</p>
									<button class="toggle-button" id="toggle-button"
										style="display: none;">더 보기 ▾</button>
								</div>

								<div class="reviewsection-adminmsg">
									<div class="adminmsg-date">
										<h4>업체명/</h4>
										<h5>답글남긴 날짜,시간</h5>
									</div>
									<div class="adminmsg-msg">
										<h5>업체가 남긴 답글</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="sectionline"></div>
				</div>
			</div>
			<div class="footer">
				<div class="footer-top">
					<div class="footer-top-service">

						<div class="footer-top-call">
							<h4>고객센터</h4>
							<h5>오전9시 - 오후9시</h5>
						</div>

						<div class="company footer-top">
							<h4>회사</h4>
							<h5>
								<a>회사소개</a>
							</h5>
						</div>

						<div class="info footer-top">
							<h4>서비스</h4>
							<h5>
								<a>공지사항</a>
							</h5>
							<h5>
								<a>자주 묻는 질문</a>
							</h5>
						</div>

						<div class="bouns footer-top">
							<h4>혜택</h4>
							<h5>
								<a>쿠폰 이벤트</a>
							</h5>
							<h5>
								<a>일일 한정 이벤트</a>
							</h5>
							<h5>
								<a>선착순 이벤트</a>
							</h5>
						</div>


					</div>
				</div>
				<div class="footer-mid">
					<h6>(주)여기가자</h6>
					<h6>주소:충청남도 천안시 동남구 대흥로 215, 7,8층 휴먼교육센터 | 대표이사:김김김 |
						사업자등록번호:124-23-43980</h6>
					<h6>전자우편주소:help@gaja.com | 통신판매번호:2024-충남천안-02321 | 관광사업자
						등록번호:제1023-53호 | 전화번호:1698-2347 | 호스팅서비스제공자의 상호 표시:(주)여기가자</h6>
					<h6>(주)여기가자는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한
						의무와 책임은 각 판매자에게 있습니다.</h6>
				</div>
				<div class="footer-bottom">
					<h4>
						<a>이용약관</a>
					</h4>
					<h4>
						<a>개인정보처리방침</a>
					</h4>
					<h4>
						<a>소비자 분쟁해결 기준</a>
					</h4>
					<h4>
						<a>콘텐츠산업징흥법에 의한 표시</a>
					</h4>
				</div>
			</div>
			<script src="js/script.js"></script>
		</div>
</body>
</html>