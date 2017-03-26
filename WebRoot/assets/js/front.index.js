$(document).ready(function() {
	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('tags-cloud'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '关键词云'
        },
        tooltip: {
        	show:true
        },
        series: [{
            name: '关键词',
            type: 'wordCloud',
            sizeRange: [6, 66],
            //textRotation: [0, 45, 90, -45],
            rotationRange: [-45, 90],
            //shape: 'circle',
            textPadding: 0,
            autoSize: {
                enable: true,
                minSize: 6
            },
            textStyle: {
                normal: {
                    color: function() {
                        return 'rgb(' + [
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160)
                        ].join(',') + ')';
                    }
                },
                emphasis: {
                    shadowBlur: 10,
                    shadowColor: '#333'
                }
            },
            data: []
        }]
    };
    $.get("topTags/20").done(function(data){
    		option.series[0].data = data;
    		myChart.setOption(option);
    });
    
    
});


