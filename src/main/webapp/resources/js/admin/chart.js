function lineChart(canvasId, labelName, labelList, dataList){// canvas영역의 id값, 출력할 데이터의 이름, 항목, 값
	//line
	var ctxL = document.getElementById(canvasId).getContext('2d');
	var myLineChart = new Chart(ctxL, {
	type: 'line',
	data: {
	labels: labelList,	// 데이터 이름
	datasets: [{
	label: labelName,	// 데이터 항목
	data: dataList,		// 데이터 값
	backgroundColor: [
	'rgba(105, 0, 132, .2)',
	],
	borderColor: [
	'rgba(200, 99, 132, .7)',
	],
	borderWidth: 2
	}
	]
	},
	options: {
		elements: {
			line: {
				fill : false,
	// 			tension : 0 //곡선제거
			}
		},
		scales: {
            // X,Y축 옵션
            yAxes: [
                {
                    ticks: {
                        beginAtZero: true // Y축의 값이 0부터 시작
                    }
                }
            ]
        },
		responsive: true
	}
	});
}
function pieChart(canvasId, type, labelList, dataList, bgColorList, hbgColorList){// canvas영역의 id값, 항목, 값, 항목색상, 항목hover 색상
	//pie
	var ctxP = document.getElementById(canvasId).getContext('2d');
	var myPieChart = new Chart(ctxP, {
		type: type,
		data: {
			labels: labelList,
			datasets: [{
				data: dataList,
				backgroundColor: bgColorList,
				hoverBackgroundColor: hbgColorList
			}]
		},
		options: {
			responsive: true
		}
	});
}