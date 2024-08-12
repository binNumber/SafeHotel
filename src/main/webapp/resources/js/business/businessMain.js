window.onload = function () {
    pieChartDraw();
}

let pieChartData = {
    labels: ['사업장1', '사업장2', '사업장3'],
    datasets: [{
        data: [95, 12, 13],
        backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)']
    }] 
};

let pieChartDraw = function () {
    let ctx = document.getElementById('pieChartCanvas').getContext('2d');
    
    window.pieChart = new Chart(ctx, {
        type: 'line',
        data: pieChartData,
        options: {
            responsive: false
        }
    });
};