<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Nanum+Gothic&family=Nanum+Myeongjo&family=Noto+Serif+KR:wght@200..900&display=swap"
	rel="stylesheet">
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

		<div class="content">
			<div class="content-top-search">
				<div class="search-main">
					<div class="input-search">
						<img src='img/magnifier.png' /> <input id="search_term"
							name="search_term" type="text" placeholder="여행지나 숙소를 검색해보세요.">
						<div class="hide search-best" id="search_best">
							<div class="search-best-history">
								<h3>최근 검색어</h3>
							</div>
							<p>검색한 단어1</p>
							<p>검색한 단어2</p>
						</div>
					</div>

					<div class="btn-date">
						<div class="btn-date-checkin">
							<input type="date">
						</div>
						<div class="btn-date-checkout">
							<input type="date">
						</div>
					</div>

					<div class="btn-people">
						<button id="btn_people">
							<img src='img/human.png' /> <span> 인원 2 </span>
						</button>

						<div class="hide people-picker" id="people_picker">
							<p>인원</p>
							<div class="people-controls">
								<button class="decrease">-</button>
								<span class="people-count">2</span>
								<button class="increase">+</button>
							</div>
							<h6>유아 및 아동도 인원수에 포함해주세요.</h6>
						</div>
					</div>

					<div class="btn-searchright">
						<button onclick="location.href='/listpage'">
							<span><img> 검색 </span>
						</button>
					</div>
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
						<div class="mainphoto">
							<img
								src="${acmRepImg.accImgUrl }/${acmRepImg.accImgSaveName}${acmRepImg.accImgExtension}">
						</div>

						<div class="subphoto">
							<div class="photosection">
								<div class="photo2">
									<img
										src="${acmImgList[1].accImgUrl }/${acmImgList[1].accImgSaveName}${acmImgList[1].accImgExtension}"
										alt="사진2" class="thumbnail">
								</div>
								<div class="photo3">
									<img
										src="${acmImgList[2].accImgUrl }/${acmImgList[2].accImgSaveName}${acmImgList[2].accImgExtension}"
										alt="사진3" class="thumbnail">
								</div>
							</div>

							<div class="photosection">
								<div class="photo4">
									<img
										src="${acmImgList[3].accImgUrl }/${acmImgList[3].accImgSaveName}${acmImgList[3].accImgExtension}"
										alt="사진4" class="thumbnail">
								</div>
								<div class="photo5">
									<img
										src="${acmImgList[4].accImgUrl }/${acmImgList[4].accImgSaveName}${acmImgList[4].accImgExtension}"
										alt="사진5" class="thumbnail">
									<!-- 모달 버튼 -->
									<div class="btn-photo">
										<button id="openModalBtn">사진 모두보기</button>
									</div>

									<!-- 모달 창 -->
									<div id="photoModal" class="modal">
										<div class="modal-content-roominfo">
											<span class="close" id="closeModalBtn">&times;</span>
											<div class="modal-header">
												<h2>${acm.acmName }</h2>
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
														<img id="largeImage"
															src="${acmRepImg.accImgUrl }/${acmRepImg.accImgSaveName}${acmRepImg.accImgExtension}"
															class="large-image">
														<button class="gallery-next">&gt;</button>
													</div>
													<!-- 썸네일 이미지들이 표시될 영역 -->
													<div class="thumbnail-container-wrapper">
														<div class="thumbnail-container">
															<c:forEach var="acmImg" items="${acmImgList}">
																<img
																	src="${acmImg.accImgUrl }/${acmImg.accImgSaveName }${acmImg.accImgExtension}"
																	class="gallery-thumbnail"
																	data-large-src="${acmImg.accImgUrl }/${acmImg.accImgSaveName }${acmImg.accImgExtension}">
															</c:forEach>
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
				</div>
				<div class="sectionline"></div>
			</div>
			<div id="section2">
				<div class="content-roominfo-main">
					<div class="roominfo-top">
						<div class="roominfo-title">
							<h1>${acm.acmName }</h1>


						</div>
					</div>
				</div>
				<div class="roominfo-top-position">
					<p>주소 : ${acm.acmAddr }</p>
					<input type="hidden" id="acmAddrInput" value="${acm.acmAddr }">
					<input type="hidden" id="acmNameInput" value="${acm.acmName }">
				</div>
				<div class="roominfo-top-map"></div>
				<div class="sectionline"></div>
			</div>
			<div id="section3">
				<div class=content-roominfo-list>
					<div>
						<h1>객실 선택</h1>
					</div>
					<c:forEach var="room" items="${roomList}">
						<div class="content-roominfo-listsection">
							<div class="listsection-photo">
								<img
									src="${room.roomRepImg.accImgUrl}/${room.roomRepImg.accImgSaveName}${room.roomRepImg.accImgExtension}">
								<button>더보기</button>
							</div>
							<div class="listsection-main">
								<div class="listmain-title">
									<h1>${room.roomName }<span> </span> ${room.roomType }
									</h1>
								</div>
								<div class="listmain-content">
									<div class="listmain-time">
										<h5>입실시간 : ${room.checkInTime}</h5>
										<h5>퇴실시간 : ${room.checkOutTime }</h5>
									</div>
									<div class="listmain-remainder">
										<h3>금액 : ${room.roomAmountStr } 원</h3>
										<button type="button" class="reserve-btn"
											data-room-code="${room.roomCode}"
											data-room-name="${room.roomName}"
											data-room-type="${room.roomType}"
											data-check-in-time="${room.checkInTime}"
											data-check-out-time="${room.checkOutTime}"
											data-room-amount="${room.roomAmount}">예약하기</button>
									</div>
								</div>
								<div class="listsection-roominfo">
									<div class="listsection-roominfo-text">
										<h5>객실정보</h5>
										<h5>기준${room.roomCapacity }인/최대${room.roomMaxCapacity }인</h5>

										<h6>남은객실: ?</h6>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="sectionline"></div>
			</div>
			<div id="section4">

				<c:if test="${acmDetail.acmDtlIntroduction != null }">
					<div class="content-roominfo-info">
						<div class="info-section">
							<div class="info-section-title">
								<h1>숙소 소개</h1>
								<div>
									<p class="nanum-myeongjo-regular">“</p>
									<p>${acmDetail.acmDtlIntroduction }</p>
									<p class="nanum-myeongjo-regular">”</p>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<div class="sectionline"></div>
				<div class="content-roominfo-text">
					<div class="info-sectiontext">
						<div class="info-section-text">
							<h1>숙소 이용 정보</h1>

							<c:if test="${acmDetail.acmDtlNotice != null}">
								<div class="notice infosection-bottom">
									<h3>공지사항</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlNotice}" escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlInfo != null }">
								<div class="notice infosection-bottom">
									<h3>기본정보</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlInfo }" escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlUsageGuide != null}">
								<div class="notice infosection-bottom">
									<h3>숙소 이용안내</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlUsageGuide}"
													escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlAddPersonnel != null}">
								<div class="notice infosection-bottom">
									<h3>인원 추가 정보</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlAddPersonnel }"
													escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlRoomInfo != null}">
								<div class="notice infosection-bottom">
									<h3>객실 정보</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlRoomInfo }"
													escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlFacilities != null }">
								<div class="notice infosection-bottom">
									<h3>부대시설 정보</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlFacilities }"
													escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlParking != null}">
								<div class="notice infosection-bottom">
									<h3>주차장 안내</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlParking }" escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlTransport != null}">
								<div class="notice infosection-bottom">
									<h3>대중교통 정보</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlTransport }"
													escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlBenefit != null }">
								<div class="notice infosection-bottom">
									<h3>투숙객 혜택</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlBenefit }" escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlSurroundingInfo != null }">
								<div class="notice infosection-bottom">
									<h3>주변 정보</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlSurroundingInfo }"
													escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlGuide != null }">
								<div class="notice infosection-bottom">
									<h3>추가 안내사항</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlGuide }" escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlPolicy != null }">
								<div class="notice infosection-bottom">
									<h3>취소 및 환불 규정</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlPolicy }" escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

							<c:if test="${acmDetail.acmDtlEtc }">
								<div class="notice infosection-bottom">
									<h3>확인사항 및 기타</h3>
									<ul>
										<li><p>
												<c:out value="${acmDetail.acmDtlEtc }" escapeXml="false" />
											</p></li>
									</ul>
								</div>
							</c:if>

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
							<c:if test="${reviewCount != 0}">
								<h3>평점 ${reviewRatingAverageStr }점(${reviewCount}개)</h3>
							</c:if>
						</div>

						<c:choose>
							<c:when test="${reviewList != null }">
								<c:forEach var="review" items="${reviewList}">
									<div class="review-section-main">
										<div class="review-section-left">
											<div class="review-section-left-userinfo">
												<div class="userinfo-nickname">
													<p>${review.userNickname }</p>
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
												<p>${review.reviewDate }</p>
											</div>
											<div class="review-right-photo">

												<div class="btn_reviewpage prev">
													<button class="prev">&lt;</button>
												</div>
												<div class="reviewsection-slides">
													<c:forEach var="reviewImg" items="${review.reviewImgList }">
														<div class="reviewsection-photo">
															<img
																src="${reviewImg.reviewImgUrl }/${reviewImg.reviewImgSaveName}${reviewImg.reviewImgExtension}">
														</div>
													</c:forEach>
												</div>
												<div class="btn_reviewpage next">
													<button class="next">&gt;</button>
												</div>
											</div>

											<div class="reviewsection-roominfo">
												<h4></h4>
											</div>

											<div class="reviewsection-msg">
												<p class="review-message" id="review-text">${review.reviewText }</p>
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
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h3 class="no-review">등록된 리뷰가 없습니다.</h3>
							</c:otherwise>
						</c:choose>

					</div>
					<div class="sectionline"></div>
				</div>

				<!--  폼 안보내짐 -->
				<form id="reservationForm" action="/roominfo2" method="post">
					<input type="hidden" name="acmCode" value="${acm.acmCode }">
					<input type="hidden" name="acmName" value="${acm.acmName }">
					<input type="hidden" name="rsvtChekInDate"
						value="${searchRoom.checkInDate }"> <input type="hidden"
						name="rsvtChekOutDate" value="${searchRoom.checkOutDate }">
					<input type="hidden" name="roomCode"> <input type="hidden"
						name="roomName"> <input type="hidden" name="roomType">
					<input type="hidden" name="rsvtChekInTime"> <input
						type="hidden" name="rsvtChekOutTime"> <input type="hidden"
						name="rsvtRoomAmount">
				</form>
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
		</div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e83285c350f38211a25bc3a79660dac3&libraries=services"></script>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e83285c350f38211a25bc3a79660dac3&libraries=services"></script>
		<script src="js/script.js"></script>
		<script src="js/kakaoMapApi.js"></script>
		<script src="js/customer/reservation_form_action.js"></script>
	</div>
</body>
</html>