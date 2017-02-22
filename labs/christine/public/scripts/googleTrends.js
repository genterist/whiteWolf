var REST_DATA = '/';

function executeSearchTrends() {
	var node = document.getElementById('displayAns');

	var data = {
            keyword: document.getElementById('inputQuery').value
        };

 	xhrPost(REST_DATA, data, function(item) {
            renderTrendsChart(item);
        }, function(err) {
            console.error(err);
        });
}

function renderTrendsChart(item) {
    var data = JSON.parse(item).default.timelineData;
    var categoryData = [];
    var valueData = [];
    
    for(var attributename in data){
        categoryData.push({"label": data[attributename].formattedTime});
        valueData.push({"value": data[attributename].formattedValue});
    }

    var lineChart = new FusionCharts({
        type: 'scrollline2d',
        dataFormat: 'json',
        renderAt: 'chart-container',
        width: '550',
        height: '350',
        dataSource: {
            "chart": {
                "caption": "Google Trends",
                "subCaption": "(In 3 years)",
                "xAxisName": "Time",
                "yAxisName": "Search Interest",
                "showValues": "0",
                "numberPrefix": "",
                "showBorder": "0",
                "showShadow": "0",
                "bgColor": "#ffffff",
                "paletteColors": "#008ee4",
                "showCanvasBorder": "0",
                "showAxisLines": "0",
                "showAlternateHGridColor": "0",
                "divlineAlpha": "100",
                "divlineThickness": "1",
                "divLineIsDashed": "1",
                "divLineDashLen": "1",
                "divLineGapLen": "1",
                "lineThickness": "3",  
                "flatScrollBars": "1",
                "scrollheight": "10",
                "numVisiblePlot": "12",
                "showHoverEffect":"1"
            },
            "categories" : [
            	{
                  "category" : categoryData
            	}
            ],
            "dataset" : [
            	{
                  "data" : valueData
            	}
            ]
        }
    }).render();
}