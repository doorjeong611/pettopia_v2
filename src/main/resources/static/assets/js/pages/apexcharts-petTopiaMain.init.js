/*
Template Name: Tailwick - Admin & Dashboard Template
Author: Themesdesign
Version: 1.1.0
Website: https://themesdesign.in/
Contact: Themesdesign@gmail.com
File: charts apex area init Js File
*/

// rgb to hex convert
function rgbToHex(rgb) {
    // Extract RGB values using regular expressions
    const rgbValues = rgb.match(/\d+/g);

    if (rgbValues.length === 3) {
        var [r, g, b] = rgbValues.map(Number);
    }
    // Ensure the values are within the valid range (0-255)
    r = Math.max(0, Math.min(255, r));
    g = Math.max(0, Math.min(255, g));
    b = Math.max(0, Math.min(255, b));

    // Convert each component to its hexadecimal representation
    const rHex = r.toString(16).padStart(2, '0');
    const gHex = g.toString(16).padStart(2, '0');
    const bHex = b.toString(16).padStart(2, '0');

    // Combine the hexadecimal values with the "#" prefix
    const hexColor = `#${rHex}${gHex}${bHex}`;

    return hexColor.toUpperCase(); // Convert to uppercase for consistency
}

// common function to get charts colors from class
function getChartColorsArray(chartId) {
    const chartElement = document.getElementById(chartId);
    if (chartElement) {
        const colors = chartElement.dataset.chartColors;
        if (colors) {
            const parsedColors = JSON.parse(colors);
            const mappedColors = parsedColors.map((value) => {
                const newValue = value.replace(/\s/g, "");
                if (!newValue.includes("#")) {
                    const element = document.querySelector(newValue);
                    if (element) {
                        const styles = window.getComputedStyle(element);
                        const backgroundColor = styles.backgroundColor;
                        return backgroundColor || newValue;
                    } else {
                        const divElement = document.createElement('div');
                        divElement.className = newValue;
                        document.body.appendChild(divElement);

                        const styles = window.getComputedStyle(divElement);
                        const backgroundColor = styles.backgroundColor.includes("#") ? styles.backgroundColor : rgbToHex(styles.backgroundColor);
                        return backgroundColor || newValue;
                    }
                } else {
                    return newValue;
                }
            });
            return mappedColors;
        } else {
            console.warn(`chart-colors attribute not found on: ${chartId}`);
        }
    }
}

// 연간 성별 가입 추이
let currentYearReservationsM = [];
let currentYearReservationsF = [];
let isDataLoadedM = false;
let isDataLoadedF = false;

let requestedYear;

// 현재 연도와 기본값으로 이전 연도 설정
const currentYear1 = new Date().getFullYear();
const defaultYear = currentYear1 - 1;

// 초기 데이터 로드 (기본값으로 이전 연도 사용)
loadGenderSignupData(defaultYear, 'M');
loadGenderSignupData(defaultYear, 'F');


// AJAX 호출 함수
function loadGenderSignupData(year, gender) {
	
	requestedYear = year;
	console.log(requestedYear);
	
    $.ajax({
        url: `/pettopia/genderSignupStatistics/${year}/${gender}`,
        method: 'GET',
        success: function(data) {
            console.log(`Response for year ${year}, gender ${gender}:`, data); // 응답 데이터 출력
            
            // 데이터가 배열인지 확인
            if (!Array.isArray(data)) {
                console.error(`Expected an array but got:`, data);
                return;
            }

            // population만 추출하여 배열에 저장
            const populationCounts = data.map(item => item.population);
            // console.log(`Extracted Population Counts:`, populationCounts); // 추출된 population 로그

            // M과 F에 따른 데이터 저장
            if (gender === 'M') {
                currentYearReservationsM = populationCounts; // M 데이터 저장
                isDataLoadedM = true; // M 데이터 로드 완료 플래그 설정
            } else if (gender === 'F') {
                currentYearReservationsF = populationCounts; // F 데이터 저장
                isDataLoadedF = true; // F 데이터 로드 완료 플래그 설정
            }

            // 모든 데이터가 로드된 후에 차트 렌더링
            if (isDataLoadedM && isDataLoadedF) {
                renderGenderChart(currentYear1); // 현재 연도에 맞춰 차트 렌더링
            }
        },
        error: function(error) {
            console.error(`Error fetching data for year ${year} and gender ${gender}:`, error);
        }
    });
}

let chart; // 전역에서 차트 변수 선언

// 차트 렌더링 함수
function renderGenderChart(year) {
    // 기존 차트가 있을 경우 파괴
    if (chart) {
        chart.destroy();
    }

    var genderSignupStatisticsOptions = {
        series: [
            {
                name: "남자 (" + requestedYear + "년)",
                data: currentYearReservationsM
            },
            {
                name: "여자 (" + requestedYear + "년)",
                data: currentYearReservationsF
            }
        ],
        chart: {
            height: 280,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            toolbar: {
                show: false
            }
        },
        colors: getChartColorsArray("genderSignupStatistics"),
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'smooth'
        },
        markers: {
            size: 1
        },
        xaxis: {
            categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 추가
        },
        yaxis: {
            min: 0,
			labels: {
				offsetX: -5,
                formatter: function (value) {
                    return value + ' 건';  // y축 값 옆에 '건' 추가
                }
            }
        },
        legend: {
            position: 'bottom',
        }
    };

    chart = new ApexCharts(document.querySelector("#genderSignupStatistics"), genderSignupStatisticsOptions);
    chart.render();
}

// 특정 연도의 데이터 업데이트 함수
function updateGenderStatistics(year) {
    // 이전 데이터 초기화
    currentYearReservationsM = [];
    currentYearReservationsF = [];
    isDataLoadedM = false; 
    isDataLoadedF = false; 

    // AJAX 호출
    loadGenderSignupData(year, 'M');
    loadGenderSignupData(year, 'F');
}

// 연도 선택 드롭다운에서 변경 이벤트
document.getElementById("yearSelect").addEventListener("change", function() {
    updateGenderStatistics(this.value);
});



// 월 별 객실 예약 현황

// 현재 연도와 작년 연도 가져오기
const currentYear = new Date().getFullYear();
const lastYear = currentYear - 1;

// 예약 카운트를 저장할 배열
let currentYearReservations = [];
let lastYearReservations = [];

// 데이터 로드 완료 여부
let isCurrentYearDataLoaded = false;
let isLastYearDataLoaded = false;

// AJAX 호출 함수
function fetchMonthlyReservationStatistics(year) {
    $.ajax({
        url: `/pettopia/monthlyReservationStatistics/${year}`,
        method: 'GET',
        success: function(data) {
            const reservationCounts = data.map(item => item.reservationCount);
            if (year === currentYear) {
                currentYearReservations = reservationCounts;
                isCurrentYearDataLoaded = true; // 데이터 로드 완료 플래그 설정
            } else if (year === lastYear) {
                lastYearReservations = reservationCounts;
                isLastYearDataLoaded = true; // 데이터 로드 완료 플래그 설정
            }
            // console.log(`Year: ${year}, Reservation Counts: ${reservationCounts}`);

            // 모든 데이터가 로드된 후에 차트 렌더링
            if (isCurrentYearDataLoaded && isLastYearDataLoaded) {
                renderChart();
            }
        },
        error: function(error) {
            console.error(`Error fetching data for year ${year}:`, error);
        }
    });
}

// 차트 렌더링 함수
function renderChart() {
    var monthlyReservationStatisticsOptions = {
        series: [{
            name: '작년 객실 예약 현황 (' + lastYear + '년)',
            data: lastYearReservations
        }, {
            name: '올해 객실 예약 현황 (' + currentYear + '년)',
            data: currentYearReservations
        }],
        chart: {
            type: 'line',
            height: 380,
            toolbar: {
                show: false,
            },
        },
        stroke: {
            curve: 'smooth',
            width: 2,
        },
        colors: getChartColorsArray("monthlyReservationStatistics"),
        dataLabels: {
            enabled: false
        },
        grid: {
            show: true,
            padding: {
                top: -20,
                right: 0,
            }
        },
        markers: {
            hover: {
                sizeOffset: 4
            }
		},
        xaxis: {
            categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 추가
        },
        yaxis: {
			labels: {
                formatter: function (value) {
                    return value + ' 건';  // y축 값 옆에 '건' 추가
                }
            }
        }
    };

    var chart = new ApexCharts(document.querySelector("#monthlyReservationStatistics"), monthlyReservationStatisticsOptions);
    chart.render();
}

// 현재 연도와 작년 연도에 대해 호출
fetchMonthlyReservationStatistics(currentYear);
fetchMonthlyReservationStatistics(lastYear);

//월 별 펫 서비스 매출 현황
var petServiceSalesStatisticsOptions = {
    series: [{
        name: 'Total Sales',
        data: [44, 55, 41, 67, 22, 43, 21, 49, 20, 41, 67, 22,]
    }, {
        name: 'Total Profit',
        data: [11, 17, 15, 15, 21, 14, 15, 13, 5, 15, 15, 21,]
    }],
    chart: {
        type: 'bar',
        height: 400,
        stacked: true,
        stackType: '100%',
        toolbar: {
            show: false,
        },
    },
    xaxis: {
        categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    },
    tooltip: {
        y: {
            formatter: function (val) {
                return "$" + val + "k"
            }
        }
    },
    grid: {
        show: true,
        padding: {
            top: -20,
            right: -10,
        }
    },
    plotOptions: {
        bar: {
            horizontal: false,
            columnWidth: '50%',
        },
    },
    colors: getChartColorsArray("petServiceSalesStatistics"),
    fill: {
        opacity: 1
    },
    legend: {
        position: 'bottom',
    },
};

document.addEventListener('DOMContentLoaded', function () {
    var chart = new ApexCharts(document.querySelector("#petServiceSalesStatistics"), petServiceSalesStatisticsOptions);
    chart.render();
});
