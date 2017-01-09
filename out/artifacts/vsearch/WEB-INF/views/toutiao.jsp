<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link type='text/css' rel='stylesheet' href='css/style.css' />
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
h4.pos_abs {
	position: absolute;
	left: 20px;
	top: 100px
}
h4.pos_abs1 {
	position: absolute;
	right: 20px;
	top: 100px
}

.carousel {
	height: 330px;
	background-color: #000;
}

.carousel .item {
	height: 330px; //
	固定高度 background-color: #000;
}

.carousel img {
	width: 400%;
	//
	图片自适应
}

a {
   color: inherit;}


</style>
<title>头条</title>
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
						class="navbar-brand">
					</a>
				</div>
				<div class="navbar-collapse collapse">
					<!-- 加底部阴影 -->
					<ul class="nav navbar-nav">
						<li><a href="search?word=${keyword}">搜索</a>
						</li>
						<li><a href="knowledge?word=${keyword}">知识</a>
						</li>
						<li><a href="toutiao?word=${keyword}">头条</a>
						</li>
						<li><a href="marketing?word=${keyword}">营销</a>
						</li>
					</ul>
					<form class="navbar-form" action="/vSearch/search">
						<input type="text" class="form-control" style="width:420px"
							id="word" name="word" placeholder="${keyword}">
						<button type="submit" class="btn btn-primary" style="width:100px">搜索</button>
					</form>
				</div>
				<!--/.nav-collapse -->


			</div>
			<!--/.container-fluid -->
		</div>
	</div>
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">热门精选</a>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">实事</a>
				</li>
				<li><a href="#">社会</a>
				</li>
				<li><a href="#">科技</a>
				</li>
				<li><a href="#">财经</a>
				</li>
				<li><a href="#">体育</a>
				</li>
				<li><a href="#">健康</a>
				</li>
				<li><a href="#">教育</a>
				</li>
				<li><a href="#">娱乐</a>
				</li>
				<li><a href="#">情感</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="section0">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="container" id="slide">
						<div class=" col-lg-6">
							<div id="myCarousel" class="carousel slide">
								<!-- 轮播（Carousel）指标 -->
								<ol class="carousel-indicators">
									<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
									<li data-target="#myCarousel" data-slide-to="1"></li>
									<li data-target="#myCarousel" data-slide-to="2"></li>
									<li data-target="#myCarousel" data-slide-to="3"></li>
									<li data-target="#myCarousel" data-slide-to="4"></li>
								</ol>
								<!-- 轮播（Carousel）项目 -->
								<div class="carousel-inner">
									<div class="item active">
										<img src="img/A1.jpg" alt="First slide">
									</div>
									<div class="item">
										<img src="img/A22.png" alt="Second slide">
									</div>
									<div class="item">
										<img src="img/A3.png" alt="Third slide">
									</div>
									<div class="item">
										<img src="img/A4.png" alt="Fourth slide">
									</div>
									<!-- 轮播（Carousel）导航 -->
									<a class="carousel-control left" href="#myCarousel"
										data-slide="prev">&lsaquo;</a> <a
										class="carousel-control right" href="#myCarousel"
										data-slide="next">&rsaquo;</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class=" box col-md-6">
					<div style="width:580px;height:380px;overflow:hidden;">
					<ul class="character_list">
					  <li><h3><a href="#">奥运火炬塔居然这样被点燃！开幕式这些精彩瞬间你错过没？</a></h3></a></li>
				      <li><h3><a href="#">这届奥运观众，很行！</a></h3></li>
				      <li><h3><a href="#">北漂看过来！北京积分落户政策定了！最新细则在这里</a></h3></li>
				       <li><h3><a href="#">为何世界都在关注G20杭州峰会？读完这篇文章就都懂了</a></h3></li>
				   </ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section1">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section11">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b1.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">英国脱欧太容易，背后恐怕不简单</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">来源公众号</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="section12">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b3.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">这个国家说没就没了！</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">来源公众号</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="section2">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section21">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b4.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">关注丨我国再添“天眼”神探 全天候监控南海就靠它了！</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">来源公众号</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="section22">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/B5.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">广西发生1970年以来陆地最强地震 多地有较强震感</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">来源公众号</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="section3">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section31">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b31.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">真相！7成企业社保缴费基数不合规！上班族速看</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">央视财经</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="section32">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b32.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">习近平视察驻黑龙江基层部队:推动基层建设全面进步全面过硬</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">人民网黑龙江频道</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> 
    <div class="section4">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section41">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b41.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">王健林小目标走红 网友:一个亿也叫小目标吗?</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">天天赢微投</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="section42">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b42.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">北上广深人口调控：困局与突围</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">城市生活广场</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="section5">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section51">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b51.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">菲警察雇女杀手暗杀毒贩</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">迎金门业</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="section52">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b52.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">防止干部“带病提拔”，中央再提六点意见！</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">景县县委组织部 景州先锋</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="section6">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section61">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b61.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">杨振宁携40岁夫人捐赠雕塑作品现场</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">大洛阳攻略</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="section62">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b62.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">百元大钞堆＂钱山＂:村支书千万现金分红村民</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">沾化大众网</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section7">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section71">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b71.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">曝黄海波低调复出 搭戏张静初郭品超</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">你好上饶</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="section72">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b72.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">王蓉砸伤主持人:我的洪荒之力这么大?</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">爱看娱乐圈</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section8">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section81">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b81.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">毕业生烧炭自杀,对我们有什么启示,我们要怎样面对生活</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs"> 雨帆小屋</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="section82">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b82.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">这件短一截喇叭裤已经占据了大家的秋季衣橱，你居然还没有？！</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">Madam 全球时尚</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section9">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section91">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b91.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">G20峰会之际突然传出一组照片，惊艳全世界!</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">国际要闻</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="section92">
						<div class="container">
							<div class="row">
								<div class="col-lg-2">
									<img src="img/b92.png" class="img-responsive" width="180"
										height="180">
								</div>
								<div class="col-lg-4">
									<div class="box-header">
										<h3>
											<a herf="#">8万元买国际大品牌，这三款性价比还不错</a>
										</h3>
										<div class="box-footer">
											<h4 class="pos_abs">番茄哥 有车以后</h4>
											<h4 class="pos_abs1">
												2016-8-24
												</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="container">
			<p class="text-muted" style="float:right">数据合作 | 关于我们</p>
		</div>
	</div>
</body>