function submitSearchForm() {
    // 폼 필드 값 설정
    document.getElementById("formSearchText").value = document.getElementById("search_term").value;
    document.getElementById("formCheckIn").value = document.getElementById("checkInDate").value;
    document.getElementById("formCheckOut").value = document.getElementById("checkOutDate").value;
    document.getElementById("formPeople").value = document.getElementById("peopleCount").innerText.trim();

    // 폼 전송
    document.getElementById("searchForm").submit();
}

document.addEventListener("DOMContentLoaded", function() {
    const decreaseButton = document.querySelector('.decrease');
    const increaseButton = document.querySelector('.increase');

    // 현재 이벤트 리스너를 모두 제거하고 다시 추가합니다.
    decreaseButton.replaceWith(decreaseButton.cloneNode(true));
    increaseButton.replaceWith(increaseButton.cloneNode(true));

    const newDecreaseButton = document.querySelector('.decrease');
    const newIncreaseButton = document.querySelector('.increase');

    // 이벤트 리스너를 등록합니다.
    newDecreaseButton.addEventListener('click', function() {
        let count = parseInt(document.getElementById("peopleCount").innerText.trim());
        if (count > 1) {
            document.getElementById("peopleCount").innerText = count - 1;
            document.getElementById("peopleNum").innerText = "인원 " + (count - 1);
        }
    });

    newIncreaseButton.addEventListener('click', function() {
        let count = parseInt(document.getElementById("peopleCount").innerText.trim());
        document.getElementById("peopleCount").innerText = count + 1;
        document.getElementById("peopleNum").innerText = "인원 " + (count + 1);
    });
});
