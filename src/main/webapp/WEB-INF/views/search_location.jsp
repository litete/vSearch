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
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=zSmpaQashmu5iFucs5oOBMIPA8zSsn9S"></script>
</script>
<!-- 调用百度地图api -->

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
			<div>
				<div id="graph" style="height: 300px; width: 100%; margin-top: 10px;"></div>
				<!-- <div id="span_last" style="width:50%;">
			     	<p class="info_right"> 以下结果已根据您的位置优化：</p>
				    <p> 
		                <span class="op-mapdots-bold">A </span> 
		                <a href="http://map.baidu.com/detail?qt=ninf&uid=ebf1e6a34c89d1ce6f4760f6&detail=life" target="_blank"><em>未来科技城</em></a>
		                <i class="c-icon c-icon-streetMap c-gap-left"></i>
		                <a href="https://www.baidu.com/link?url=w41_8rCDtYArxL0vgY1zZgjwd_x8KZSVnVt0qqW8LVShrhQvdZcgvsd8OqrFAF3N2rG2zGyOalKqqpfL_GO9uiEgFDaZSxZMONFyEQE_-Vn2gYL0lljx3ZTiILx42H_CM4Jg4cQrpISms7t194-KLxvnkuLQ7QsrusVQW8ASKoPcyePP6WX18K0UicFDZo_im6qw86oLQTFhO-8wwrZWIEXaG9NxKHufa9Icn_squIS194dUJ_GJTA13bYeSVo8ulq-erVQNonvqkdCtpWXpV7C1fPVeQe-BwbJPGnaOjOFp92Sq8Fw2_gzGCJUY4os_L9DhiawmvtZ8m76su8RKjYmvraZKKcD9tDEpHR_YC7_&amp;wd=&amp;eqid=ddb5156b00029af70000000357bd1056" target="_blank" class="op-mapdots-jja">全景</a>
	            	</p>
	            	<p class="op_mapdots_left"> 地址:北京市昌平区X001(汇海路)</p> 
	            	<p> 
		                <span class="op-mapdots-bold">B </span> 
		                <a href="http://map.baidu.com/" target="_blank"><em>未来科技城</em>-公交车站</a>
	            	</p>
	            	<p class="op_mapdots_left"> 车次： 	昌27路 </p> 
	            	<p> 
		                <span class="op-mapdots-bold">C </span> 
		                <a href="http://map.baidu.com/" target="_blank"><em>未来科技城</em></a>
	            	</p>
	            	<p class="op_mapdots_left"> 地址： 	定泗路与科学城东路交汇处东北  <br />电话：	18612383080 </p> 
	            	<p> 
		                <span class="op-mapdots-bold">D </span> 
		                <a href="http://map.baidu.com/" target="_blank"><em>未来科技城</em>-公交车站</a>
	            	</p>
	            	<p class="op_mapdots_left"> 车次： 	机场大巴回龙观线  </p> 
	            	<p> 
		                <span class="op-mapdots-bold">E </span> 
		                <a href="http://map.baidu.com/" target="_blank"><em>未来科技城</em>会展中心</a>
	            	</p>
	            	<p class="op_mapdots_left"> 地址： 	北七家 </p> 
	            	<p class="op_mapdots_left">
	            		<a href="https://www.baidu.com/link?url=JY5uIV7UZKsKvRZvGXc4gcb4KkJLiz_qYejDbTdAPQzrYqOuIyHI8Rpnr0DUoKHf-fMPdD9VlvkLVmcNjo5QCOf2QrtXdm6yxv8Cso9AY6dcplT8BoUJf6tZLUR7kwxb7xJsO4bvkahnYdXZIZTmJ9BXaJw34SZA9_53GZ_p5-_uVfBm31i2vF-ZARauiacM&amp;wd=&amp;eqid=c1a259600005c7e90000000457bc5a06" target="_blank">查看全部59条结果&gt;&gt;</a>
	            	</p>
	            	<p class="op_mapdots_left">
	            		<span class="c-showurl">map.baidu.com </span>
				 </div> -->
			</div>
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



		<div class="cr-content col-lg-4" style="width: 32%; margin-top: 0%;">

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

	<script type="text/javascript">
		/* 此处使用百度地图api 2.0 */
		// 百度地图API功能
		var map = new BMap.Map("graph"); // 创建Map实例
		var keyword = "${keyword}";
		/* var mapStyle={  style : "mapbox" }  
		map.setMapStyle(mapStyle); */
		map.centerAndZoom(new BMap.Point(116.404, 39.915), 11); // 初始化地图,设置中心点坐标和地图级别
		map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
		//map.setCurrentCity("北京");          // 设置地图显示的城市,此项是必须设置的
		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map,
				autoViewport : true
			}
		});
		local.search(keyword);
		map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
		map.clearOverlays();
	</script>
</body>