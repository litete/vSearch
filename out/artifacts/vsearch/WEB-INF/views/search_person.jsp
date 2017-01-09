<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
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
					<a href="index.jsp"> <img src="img/deepSearch_logo_s.png"
						class="navbar-brand"></a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="search?word=${keyword}">搜索</a></li>
						<li><a href="knowledge?word=${keyword}">知识</a></li>
						<li><a href="toutiao?word=${keyword}">头条</a></li>
						<li><a href="marketing?word=${keyword}">营销</a></li>

					</ul>
					<form class="navbar-form" action="/vSearch/search">
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
	<div class="container">
		<div class="col-lg-8">
			<div id="person" style="height: 300px; width: 100%"></div>
			<div class="wx-topbox">以下内容来自微信公众号</div>
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



		<div id="content_right" class="cr-content col-lg-4"
			style="width: 32%; margin-top: 0%;">

			<div class="row" style="width: 100%" style="position:relative;">
				<div class="text-center">
					<div class="col-lg-9 text-center">
						<h4 class="section-heading">相关公众号</h4>
						<table class="table table-hover">
							<c:forEach items="${gzitems}" var="item">
								<tr>
									<td align="left">
										<a target="_blank" href="">${item.name}</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="container">
			<p class="text-muted" style="float: right">数据合作 | 关于我们</p>
		</div>
	</div>

	<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
	<script type="text/javascript">
		/* 此处使用的是echarts2.0 */
		// 路径配置
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
					}
				},
				tooltip : {
					trigger : 'item',
					formatter : '{a} : {b}'
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
					x : 'left',
					y : 'bottom',
					data : [ '人物', '组织机构', '地点' ],
					orient : 'vertical',
					textStyle:{
						fontFamily : '微软雅黑'
					}
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
					} ],
					itemStyle : {
						normal : {
							label : {
								show : true,
								textStyle : {
									color : '#54544E',
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
					links : ${links}
				} ]
			};
			// 为echarts对象加载数据 
			myChart.setOption(option);
		});
	</script>
</body>