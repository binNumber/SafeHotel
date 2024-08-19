//검색창 달력 라이브러리
$(document).ready(function() {
	// Date Range Picker 초기화
	$('#btn_date').daterangepicker({
		locale: {
			format: 'MM월 DD일', // 날짜 포맷 설정
			separator: ' ~ ',
			applyLabel: '적용',
			cancelLabel: '취소',
			fromLabel: '부터',
			toLabel: '까지',
			customRangeLabel: '사용자 지정',
			daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			firstDay: 0 // 일요일 시작
		},
		startDate: moment().startOf('day'), // 기본 시작 날짜
		endDate: moment().startOf('day').add(1, 'days'), // 기본 종료 날짜 (다음 날)
		minDate: moment().startOf('day'), // 최소 선택 날짜는 오늘부터
		maxDate: moment().add(1, 'years'), // 최대 선택 날짜는 1년 후까지
		autoApply: true // 날짜 선택 시 자동으로 적용
	}, function(start, end, label) {
		var days = end.diff(start, 'days'); // 선택된 일수 계산
		$('#btn_date span').html(start.format('MM월 DD일') + ' - ' + end.format('MM월 DD일') + ' (' + days + '박 ' + (days + 1) + '일)');
	});

	// Date Range Picker가 열릴 때마다 초기화
	$('#btn_date').on('apply.daterangepicker', function(ev, picker) {
		var days = picker.endDate.diff(picker.startDate, 'days');
		$('#btn_date span').html(picker.startDate.format('MM월 DD일') + ' - ' + picker.endDate.format('MM월 DD일') + ' (' + days + '박 ' + (days + 1) + '일)');
	});

	// 초기 설정값 표시
	var initialStart = moment().startOf('day');
	var initialEnd = moment().startOf('day').add(1, 'days');
	$('#btn_date span').html(initialStart.format('MM월 DD일') + ' - ' + initialEnd.format('MM월 DD일') + ' (1박 2일)');
});