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
<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/echarts.js" charset="utf-8"></script>

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
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="index">
						<img src="img/deepSearch_logo_s.png" class="navbar-brand">
					</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li>
							<a href="search?word=${keyword}">搜索</a>
						</li>
						<li>
							<a href="knowledge?word=${keyword}">知识</a>
						</li>
						<li>
							<a href="toutiao?word=${keyword}">头条</a>
						</li>
						<li>
							<a href="marketing?word=${keyword}">营销</a>
						</li>

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
		<!-- 
    <div id="content_right" class="cr-content col-lg-4" >
	    
	    <div>
	        <div class="text-center">      
			     <div class="text-center" >
			        <h4 class="section-heading">相关公众号</h4>
			        <table class="table table-hover">
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			        </table>
			    </div>
	        </div>
        </div>	 	 
      </div>
       -->
		<!-- 左侧显示部分 -->


		<div id="result" class="col-lg-8">
			<c:forEach items="${items}" var="item">

				<div class="result c-container" style="margin-left: 5%;">
					<h3 class="t">
						<a href="${item.url}">${item.title}</a>
					</h3>
					<div class="c-abstract">${item.content}</div>
				</div>

			</c:forEach>
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
	<div id="footer" class="col-lg-12">
		<div class="container">
			<p class="text-muted" style="float: right">数据合作 | 关于我们</p>
		</div>
	</div>

</body>