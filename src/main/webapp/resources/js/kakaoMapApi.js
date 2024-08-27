// 카카오 맵 API 적용
var mapContainer = document.querySelector('.roominfo-top-map'); // 지도를 담을 영역의 DOM 레퍼런스
var mapOption = { // 지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	level: 3 // 지도의 레벨(확대, 축소 정도)
};

// 지도를 생성
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합
var geocoder = new kakao.maps.services.Geocoder();
var addr = document.getElementById('acmAddrInput').value;
var acmName = document.getElementById('acmNameInput').value;

// 주소로 좌표를 검색합니다
geocoder.addressSearch(addr, function(result, status) {
	// 정상적으로 검색이 완료됐으면 
	if (status === kakao.maps.services.Status.OK) {
		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		// 결과값으로 받은 위치를 마커로 표시
		var marker = new kakao.maps.Marker({
			map: map,
			position: coords
		});

		// 인포윈도우로 장소에 대한 설명을 표시합니다
		var infowindow = new kakao.maps.InfoWindow({
			content: '<div style="width:150px;text-align:center;padding:6px 0;">' + acmName + '</div>'
		});
		infowindow.open(map, marker);

		// 지도의 중심을 결과값으로 받은 위치로 이동
		map.setCenter(coords);
	}
});

// 병원 및 경찰서 마커 관련 변수
var hospitalPositions = [];
var policePositions = [];
var hospitalMarkers = [];
var policeMarkers = [];
var hospitalMarkerImageSrc = 'img/hospitalMarker.png'; //병원 마커 이미지
var policeMarkerImageSrc = 'img/policeMarker.png';	//경찰서 마커 이미지


// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수
function createMarkerImage(src, size, options) {
	return new kakao.maps.MarkerImage(src, size, options);
}

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수
function createMarker(position, image) {
	return new kakao.maps.Marker({
		position: position,
		image: image
	});
}

// 병원 마커를 생성하고 병원 마커 배열에 추가하는 함수
function createHospitalMarkers() {
	var imageSize = new kakao.maps.Size(52, 56);
	var imageOptions = {
		spriteOrigin: new kakao.maps.Point(10, 0),
		spriteSize: new kakao.maps.Size(46, 36)
	};
	var markerImage = createMarkerImage(hospitalMarkerImageSrc, imageSize, imageOptions);

	hospitalPositions.forEach(function(position) {
		geocoder.addressSearch(position.address, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				var marker = createMarker(coords, markerImage);
				marker.setMap(null);  // 기본으로는 지도를 숨김
				hospitalMarkers.push(marker);
			}
		});
	});
}

// 경찰서 마커를 생성하고 경찰서 마커 배열에 추가하는 함수
function createPoliceMarkers() {
	var imageSize = new kakao.maps.Size(52, 56);
	var imageOptions = {
		spriteOrigin: new kakao.maps.Point(10, 0),
		spriteSize: new kakao.maps.Size(46, 36)
	};
	var markerImage = createMarkerImage(policeMarkerImageSrc, imageSize, imageOptions);

	policePositions.forEach(function(position) {
		geocoder.addressSearch(position.address, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				var marker = createMarker(coords, markerImage);
				marker.setMap(null);  // 기본으로는 지도를 숨김
				policeMarkers.push(marker);
			}
		});
	});
}

// 병원 마커들의 지도 표시 여부를 설정하는 함수
function setHospitalMarkers(mapInstance) {
	hospitalMarkers.forEach(function(marker) {
		marker.setMap(mapInstance);
	});
}

// 경찰서 마커들의 지도 표시 여부를 설정하는 함수
function setPoliceMarkers(mapInstance) {
	policeMarkers.forEach(function(marker) {
		marker.setMap(mapInstance);
	});
}

// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경
function changeMarker(type) {
	var hospitalMenu = document.getElementById('hospitalMenu');
	var policeMenu = document.getElementById('policeMenu');

	if (type === 'hospital') {
		hospitalMenu.className = 'menu_selected';
		policeMenu.className = '';
		setHospitalMarkers(map);
		setPoliceMarkers(null);
	} else if (type === 'police') {
		hospitalMenu.className = '';
		policeMenu.className = 'menu_selected';
		setHospitalMarkers(null);
		setPoliceMarkers(map);
	}
}


//Ajax로 병원이랑 경찰서 주소 정보 불러오는 함수
function fetchData() {
	var acmAddr = document.querySelector('input[name="acmAddr"]').value;

	fetch('/api/hospitals?acmAddr=' + encodeURIComponent(acmAddr))
		.then(response => response.json())
		.then(data => {
			hospitalPositions = data.map(h => ({ title: h.name, address: h.addr }));
			createHospitalMarkers();
		})
		.catch(error => console.error('Error fetching hospitals:', error));

	fetch('/api/police?acmAddr=' + encodeURIComponent(acmAddr))
		.then(response => response.json())
		.then(data => {
			policePositions = data.map(p => ({ title: p.name, address: p.addr }));
			createPoliceMarkers();
		})
		.catch(error => console.error('Error fetching police stations:', error));
}

// 페이지가 로드되면 데이터 요청
window.onload = function() {
	fetchData();
};

