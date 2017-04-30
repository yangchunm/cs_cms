$(document).ready(function() {
	//显示TreeGrid
	$(".tree").treegrid({
        initialState:"collapsed",
        saveState: true
    });
	loadTopGraph();
	
	
    
});

//查找词条图
function loadTopGraph(){
	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('knGraph'));
    myChart.showLoading();
    $.getJSON('kn/graph/loadTopGraph',{topN:10}, function (json) {
        myChart.hideLoading();
        myChart.setOption(option = {
            title: {
                text: '含能材料知识关系图'
            },
            animationDurationUpdate: 1500,
            animationEasingUpdate: 'quinticInOut',
            series : [
                {
                    type: 'graph',
                    layout: 'force',
                    // progressiveThreshold: 700,
                    data: json.nodes.map(function (node) {
                        return {
                            //x: node.x,
                            //y: node.y,
                            id: node.id,
                            name: node.label,
                            symbolSize: node.size
                            /*itemStyle: {
                                normal: {
                                    color: node.color
                                }
                            }*/
                        };
                    }),
                    edges: json.edges.map(function (edge) {
                        return {
                            source: edge.source,
                            target: edge.target
                        };
                    }),
                    label: {
                        emphasis: {
                            position: 'right',
                            show: true
                        }
                    },
                    roam: true,
                    focusNodeAdjacency: true,
                    lineStyle: {
                        normal: {
                            width: 0.5,
                            curveness: 0.3,
                            opacity: 0.7
                        }
                    }
                }
            ]
        }, true);
    });
}
