<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="css/sticky-footer-navbar.css" type="text/css"
	rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/echarts.js" charset="utf-8"></script>
<script src="js/macarons.js"></script>
<script src="js/dist/theme/blue.js"></script>
<title>深度搜索</title>

</head>
<body>
	<!-- Static navbar -->
	<div class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a href="index"> <img src="img/deepSearch_logo_s.png"
						class="navbar-brand"></a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="search?word=${keyword}">搜索</a></li>
						<li><a href="knowledge?word=${keyword}">知识</a></li>
						<li><a href="#">头条</a></li>
						<li><a href="marketing">营销</a></li>

					</ul>
					<form class="navbar-form" action="/vSearch/knowledge">
						<input type="text" class="form-control" style="width: 420px"
							id="word" name="word" placeholder="${keyword}">
						<button type="submit" class="btn btn-primary" style="width: 100px">搜索</button>
					</form>

				</div>
				<!--/.nav-collapse -->
				<div></div>
			</div>
			<!--/.container-fluid -->
		</div>
	</div>
	<session id="KwTrend">
	<div class="container">
		<h3>指数趋势</h3>
		<h5>
			指数:
			<div id="searchindex"></div>
		</h5>
		<div id="trend" style="height: 320px; width: 100%"></div>
	</div>
	</session>

	</session>
	<session id="relatedKW">
	<div class="container">
		<h3>关系图谱</h3>
		<div id="tree" style="height: 600px; width: 100%;"></div>
	</div>
	</session>

	<session id="relatedSite">
	<div class="container">
		<h3>人群流向</h3>

		<div class="panel panel-default">
			<!-- Table -->
			<table class="table table-hover">
				<tr>
					<th scope="col">序号</th>
					<th scope="col">网站</th>
					<th scope="col">类别</th>
				</tr>
				<tr>
					<td>1.</td>
					<td>taobao.com</td>
					<td>电子商务</td>
				</tr>
				<tr>

					<td>2</td>
					<td>360.cn</td>
					<td>网址导航</td>
				</tr>
				<tr>
					<td>3</td>
					<td>163.com</td>
					<td>新闻媒体</td>
				</tr>
								<tr>
					<td>4</td>
					<td>sina.com.cn</td>
					<td>新闻媒体</td>
				</tr>
								<tr>
					<td>5</td>
					<td>youku.com</td>
					<td>在线视频</td>
				</tr>
								<tr>
					<td>6</td>
					<td>tmall.com</td>
					<td>电子商务</td>
				</tr>
								<tr>
					<td>7</td>
					<td>qq.com</td>
					<td>社交网络和在线社区</td>
				</tr>
								<tr>
					<td>8</td>
					<td>sogou.com</td>
					<td>搜索服务</td>
				</tr>
								<tr>
					<td>9</td>
					<td>58.com</td>
					<td>生活服务</td>
				</tr>
								<tr>
					<td>10</td>
					<td>jd.com</td>
					<td>电子商务</td>
				</tr>

			</table>
		</div>
	</div>


	<div id="footer">
		<div class="container">
			<p class="text-muted" style="float: right">数据合作 | 关于我们</p>
		</div>
	</div>
	
</body>
<script type="text/javascript">
  var myChart = echarts.init(document.getElementById('trend'));
  var title="${title}";
  var legend=${legend};
  var period=${period};
  var word1Count=${word1Count};
  var word2Count=${word2Count};
  var word1="${word1}";
  var word2="${word2}";
  var option = {
	      tooltip: {
	          trigger: 'axis',
	          position: function (pt) {
	              return [pt[0], '10%'];
	          }
	      },
	      title: {
	    	  show:true,
	          left:'40%',
	          text:'left',
	          text:title,
	      },
	   // 图例
	      legend: {
	      		 show:true,
	               data:legend,
	               selectedMode:true,
	               right: 150,
	               top: 20
	               },
	      toolbox: {
	          feature: {
	              dataZoom: {
	                  yAxisIndex: 'none'
	              },
	              restore: {},
	              saveAsImage: {}
	          }
	      },
	      xAxis: {
	          type: 'category',
	          boundaryGap: false,
	          data: period,
	      },
	      yAxis: {
	    	  name : '关键词热度',
	          nameLocation :'end',
	          type : 'value',
	      },
	      dataZoom: [{
	          type: 'inside',
	          start: 0,
	          end: 10
	      }, {
	          start: 0,
	          end: 10,
	          handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
	          handleSize: '80%',
	          handleStyle: {
	              color: '#fff',
	              shadowBlur: 3,
	              shadowColor: 'rgba(0, 0, 0, 0.6)',
	              shadowOffsetX: 2,
	              shadowOffsetY: 2
	          }
	      }],
	      series: [
			                {
	                            "name":word1,
	                            "type":"line",
	                            "color":'red',
	                            "itemStyle":{
                            	"normal":{
                            		"color":'rgb(44,129,206)',
                            	}
                            },
	                            "data":word1Count,
	                        },
	                    
	                    
	                        {
	                            "name":word2,
	                            "type":"line",
	                            "color":'blue',
	                            "itemStyle":{
	                            	"normal":{
	                            		"color":'rgb(59,199,255)',
	                            	}
	                            },

	                            "data":word2Count,
	                        }
			            ]
	          
	  };
             
                 // 为echarts对象加载数据
                 myChart.setOption(option); 
    </script>
<script type="text/javascript">

        var chartTheme = null;
        var sumChart = null;
        var treeChart = null;
		var ech = null;
        require(['js/dist/theme/blue'],function(tarTheme){
			
			chartTheme = tarTheme;
            // 路径配置
            require.config({
				paths: {
					echarts: 'js/dist'
				}
			});
			// 使用
			require(
				[
					'echarts',
					'echarts/chart/bar',
					'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
					'echarts/chart/force',
					'echarts/chart/chord'
				],
				//将画多个图表的进行函数封装
				function drawCharts(ec) {
					ech=ec;
					//drawSumChart(ec);
					drawTreeChart(ec);
				}
			);
        })

       function drawTreeChart(ec){
            // 基于准备好的dom，初始化echarts图表
            
            treeChart = ec.init(document.getElementById('tree'),'macarons');
            var nodes=${nodes};
			var links=${links};
            var option = {
                title : {
	                text: '',
	                subtext: '',
	                x:'right',
	                y:'bottom'
	            },
                tooltip : {
                    trigger: 'item',
                    formatter: '{a} : {b}'
                },
                toolbox: {
                    show : true,
                    feature : {
	                    restore : {show: true},
	                    magicType: {show: true, type: ['force', 'chord']},
	                    saveAsImage : {show: true}
	                }
            	},
	            legend: {
	                x: 'left',
	                data:['直接关联','间接关联']
	            },
            series : [
            {
                type:'force',
                name : "关联关系",
                ribbonType: false,
                categories : [
	                {
	                    name: '关键词'
	                },
	                {
	                    name: '直接关联'
	                },
	                {
	                    name:'间接关联'
	                }
	            ],
            
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        textStyle: {
                            color: '#eee'
                        }
                    },
                    nodeStyle : {
                        color:'rgb(54,143,255)',
                        brushType : 'both',
                        borderColor : 'rgba(0,0,0,0)',
                        borderWidth : 1
                    },
                    linkStyle: {
                        type: 'curve',
                        color:'rgb(54,143,255)',
                        borderColor: '#c4dfee'
                    }
                },
                emphasis: {
                    label: {
                        show: false
                        // textStyle: null      // 默认使用全局文本样式
                    },
                    nodeStyle : {
                        //r: 30
                    },
                    linkStyle : {}
                }
            },
            useWorker: false,
            minRadius : 25,
            maxRadius : 50,
            gravity: 1,
            scaling: 1.3,
            roam: 'move',
			nodes:${nodes},
			links:${links}
			}]};
			treeChart.setOption(option);
			
			treeChart.hideLoading();
        }
    </script>