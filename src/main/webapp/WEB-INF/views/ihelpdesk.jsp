<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn" style="height: 100%">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" href="img/f.ico" mce_href="img/f.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/f.ico" mce_href="img/f.ico" type="image/x-icon">
    <link rel="bookmark" href="img/f.ico" mce_href="img/f.ico" type="image/x-icon">      
<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="css/sticky-footer-navbar.css" type="text/css"
	rel="stylesheet">
	<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="css/search.css" type="text/css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--  <script type="text/javascript" src="js/echarts.min.js"></script>
    <script type="text/javascript" src="js/echarts.js" charset="utf-8"></script> -->

<title>ihelpdesk</title>

</head>
<body style="background-color: black">
		<div >
			<div id="person" style="height: 450px; width: 400px;"></div>
			<!-- <div class="wx-topbox">以下内容来自微信公众号</div> -->
			<div id="main" style="width: 100%; height: 10px;"></div>
			<div id="result" >
				<c:forEach items="${items}" var="item">

					<div class="result c-container" style="margin-left: 0%;">
						<h3 class="t">
							<a href="${item.url}">${item.title}</a>
						</h3>
						<div class="c-abstract">${item.content}</div>
					</div>

				</c:forEach>
			</div>
		</div>


	<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
	<script type="text/javascript">
		/* 此处使用的是echarts2.0 */
		// 路径配置
		// var new_width=300; //你要固定的浏览器宽度
	 //    var new_height=300; //你要固定的浏览器高度
	 //    function resizewindow(){
	 //      window.resizeTo(new_width,new_height);
	 //    }
  // 		resizewindow();
		//  window.open ('ihelpdesk1.html', 'newwindow', 'height=300, width=300, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')
		
		require.config({
			paths : {
				echarts : 'http://echarts.baidu.com/build/dist'
			}
		});

		// 使用
		require([ 'echarts', 'echarts/chart/force' ], function(ec) {
			// 基于准备好的dom，初始化echarts图表
			var myChart = ec.init(document.getElementById('person'));

			var option = {
				title : {
					text : "${title}",
					//subtext: '以下内容来自微信公众平台',
					x : 'left',
					y : 'top',
					textStyle:{
						fontFamily : '微软雅黑'
					},
					textAlign : 'center'
				},
				backgroundColor : 'black',
				tooltip : {
					trigger : 'item',
					formatter : '{a} : {b}',
					textAlign : 'center'
				},
				toolbox : {
					show : false,
					feature : {
						restore : {
							show : true
						},
						magicType : {
							show : true,
							type : [ 'force', 'chord' ]
						},
						saveAsImage : {
							show : true
						}
					}
				},
				legend : {
					x : 'center',
					y : 'top',
					data : [ '人物', '组织机构', '地点' , '技术名词'],
					orient : 'horizontal',
					textStyle:{
						fontFamily : '微软雅黑',
						color : 'white'
					}
				},
				noDataLoadingOption :{
    				text: ${tips},
    				effect:'spin',
    				// effectOption : {
	       //  			effect: {
	       //      			n: 0 //气泡个数为0
	       //  			}
    				// },
    				backgroundColor : 'black'
				},
				series : [ {
					type : 'force',
					name : "关联关系",
					center : [ '50%', '50%' ],
					ribbonType : false,
					categories : [  {
						name : '关键词',
						itemStyle : {
							normal : {
								color : 'rgb(79,183,247)'
							}
						}
					},{
						name : '人物',
						itemStyle : {
							normal : {
								color : 'rgb(79,183,247)'
							}
						}
					}, {
						name : '地点',
						itemStyle : {
							normal : {
								color : 'rgb(98,95,122)'
							}
						}
					}, {
						name : '组织机构',
						itemStyle : {
							normal : {
								color : 'rgb(142,160,168)'
							}
						}
					} ,
					{
						name : '技术名词',
						itemStyle : {
							normal : {
								color : '#ff7f50'
							}
						}
					} ],
					itemStyle : {
						normal : {
							label : {
								show : true,
								textStyle : {
									color : 'white',
									// color : '#54544E',
									fontsize : '1.5rem',
									fontFamily : '微软雅黑'
								},
								formatter : '{b}',
								position : 'left'
							},
							nodeStyle : {
								brushType : 'both',
								borderColor : '#FFFFFF',
								borderWidth : 3,
							},
						},
						emphasis : {
							label : {
								show : false
							// textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
							},
							nodeStyle : {
							// r: 30
							},
							linkStyle : {}
						}
					},
					useWorker : false,
					minRadius : 20,
					maxRadius : 50,
					gravity : 1.1,
					scaling : 1.1,
					roam : 'move',
					nodes : ${nodes},
					links : ${links},
					textColor : 'white'
				} ]
			};
			// 为echarts对象加载数据
			myChart.setOption(option);
		});
	</script>
</body>