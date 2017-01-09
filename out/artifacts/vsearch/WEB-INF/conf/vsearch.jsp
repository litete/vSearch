<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>v搜索-微搜</title>
<!-- es search -->
<link rel="stylesheet" type="text/css" href="css/index.css" /> 
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
        queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file://
        -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
<script src="js/bootstrap.js"></script>
<script src="js/jquery.js"></script>
<script src="js/echarts.min.js"></script>
<script src="js/dist/theme/blue.js"></script>
<script src="js/macarons.js"></script>
</head>

<body>
<!-- 搜索框 -->
<div class="navbar navbar-default navbar-fixed-top"  role="navigation" style="max-width:759px;">
	<div class="container" style="margin-top:1%;" style="width:100%">
	 <form class="form-inline" action="/vSearch/search">
		  <div class="form-group row" style="padding-left:50px;margin-left:30px">
		    <img src="img/logo2.gif" class="vsearch_logo">
		    <div class="input-group col-lg-10">
		      <input type="text" class="form-control" style="width:450px" id="word" name="word" placeholder="${keyword}">
		    </div>
		  </div>
		  <button type="submit" class="btn btn-primary" style="width:100px" >搜索</button>
	 </form>
    </div>
</div>

<!--  右侧显示部分 -->
<div id="content_right" class="cr-content" style="width:32%;margin-top:9%;" >
	    <div class="col-lg-12 text-center">
		      <div id="tree" style="height:450px;width:100%;"></div> 
		 </div>
	    <div class="row" style="width:100%"  style="position:relative;">
	        <div class="col-lg-12 text-center">      
			     <div class="col-lg-9 text-center" >
			        <h4 class="section-heading">热门文章</h4>
			        <table class="table table-hover">
			          <tr>
			            <td align="left"><a target="_blank" href="">【转载】中国电信见闻：一个生活在“天堂”中的民族</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">残酷的真相！中国80后女孩中国电信5日见闻</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信金正恩摊上大事，王毅罕见出手警告</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">这就是“中国电信国货”的真相 中国人看完心都凉了</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">习总宣布中国对中国电信红线：连用了两个不令韩国放心</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">绝密内幕：曝光中国拒绝严厉制裁中国电信的原因</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信你让中国过不好年，中国让你饿一年</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">越南黄文欢与中国电信黄长烨的“叛逃”与中国</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">【史】中国4万官兵归属中国电信后</a></td>
			          </tr>
			        </table>
			    </div>
	        </div>
        </div>	 	 
      </div>

<!-- 左侧显示部分 -->
<div id="content_left" style="width:68%;margin-top:5%" >
	<div class="col-lg-12 text-center" >
	     <div id="main" style="width: 100%;height:300px;"></div>       
	</div>
	<div id="result" class="col-lg-12" >
		<c:forEach items="${items}" var="item">
		
		<div class="result c-container" style="margin-left:5%;">
		    <h3 class="t">
		        <a href="${item.url}" >${item.title}</a>
		    </h3>
			<div class="c-abstract">${item.content}</div>
		</div>
		</c:forEach>
    </div>
</div>

<!-- <div class="result c-container">
		    <h3 class="t">
		        <a href="#">中国<strong>电信</strong>集团公司 CHINA TELECOM</a>
		    </h3>
			<div class="c-abstract">中国电信集团公司官方网站,中国电信互联网门户,发布中国电信官方权威信息;为电信客户提供充值交费、费用查询、业务办理、在线客服、故障申告、投诉咨询及品牌专区等全...</div>
			<p>
		        <a class="c-gap-right-small op-se-listen-recommend" href="http://www.baidu.com" target="_blank" title="服务品牌">服务品牌</a>
		        <a class="c-gap-right-small op-se-listen-recommend" href="http://www.baidu.com" target="_blank" title="企业文化">企业文化</a>
		        <a class="c-gap-right-small op-se-listen-recommend" href="http://www.baidu.com" target="_blank" title="业务发展">业务发展</a>
		        <a class="c-gap-right-small op-se-listen-recommend" href="http://www.baidu.com" target="_blank" title="企业规模">企业规模</a> 
		        <a class="op-se-listen-recommend" href="http://www.baidu.com" target="_blank">更多&gt;&gt;</a>
		    </p>
		</div>
		<div class="result c-container" >
		    <h3 class="t">
		        <a href="#">中国<strong>电信</strong>集团公司 CHINA TELECOM</a>
		    </h3>
			<div class="c-abstract">中国电信集团公司官方网站,中国电信互联网门户,发布中国电信官方权威信息;为电信客户提供充值交费、费用查询、业务办理、在线客服、故障申告、投诉咨询及品牌专区等全...</div>
			<div class="f13">
			    <a target="_blank" href="https://www.baidu.com/link?url=0GPNK1PHjixGldmhefSYC_4aRlGWaSMzwR83_W7V4CVeBSbjdzUDkS3amB_2uQ3Zyd1DE2JetNqBnoUCzqbsyq&amp;wd=&amp;eqid=cfe92b86000d160e000000035784d969" class="c-showurl" style="text-decoration:none;">www.chinatelecom.com.c...&nbsp;</a>	    
			    <span class="c-pingjia">&nbsp;-&nbsp;<a href="#" target="_blank" class="m">公众号</a></span>
			    <span class="c-pingjia">&nbsp;-&nbsp;<a href="#" target="_blank" class="m">关注度</a></span>
			</div>
			
		</div>
		<div class="result c-container">
		    <h3 class="t">
		        <a href="#">中国<strong>电信</strong>集团公司 CHINA TELECOM</a>
		    </h3>
			<div class="c-abstract">中国电信集团公司官方网站,中国电信互联网门户,发布中国电信官方权威信息;为电信客户提供充值交费、费用查询、业务办理、在线客服、故障申告、投诉咨询及品牌专区等全...</div>
		</div> -->
<!-- footer -->    
<!-- <footer class="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-12"> <span class="copyright">中国电信股份有限公司北京研究院</span> </div>
    </div>
  </div>
</footer> -->

<!-- Portfolio Modals -->
<!-- Use the modals below to showcase details about your portfolio projects!
        -->
<!-- Portfolio Modal 1 -->
<!-- jQuery -->
<script src="js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- Plugin JavaScript -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/classie.js"></script>
<script src="js/cbpAnimatedHeader.js"></script>
<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>
<!-- Custom Theme JavaScript -->
<script src="js/agency.js"></script>
<script type="text/javascript" src="js/echarts.js" charset="utf-8"></script>
<script src="js/dist/theme/blue.js"></script>
<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'), 'macarons');

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: ''
            },
            tooltip: {},
            legend: {
                data:['次']
            },
            xAxis: {
                data: [ "2015/8/10",
					 "2015/11/19", "2016/1/10", "2016/1/11", "2016/1/12", "2016/1/13", "2016/1/14", "2016/1/19", "2016/1/20",
					 "2016/1/21", "2016/1/22", "2016/1/24", "2016/1/26", "2016/1/27", "2016/1/29", "2016/1/31", "2016/6/1", "2016/6/2",
					 "2016/6/3", "2016/6/4", "2016/6/5", "2016/6/6", "2016/6/7", "2016/6/8", "2016/6/9", "2016/6/10", "2016/6/11", "2016/6/12",
					 "2016/6/13", "2016/6/14", "2016/6/15", "2016/6/17", "2016/6/18", "2016/6/19", "2016/6/20", "2016/6/21", "2016/6/22",
					 "2016/6/23", "2016/6/24", "2016/6/25", "2016/6/26", "2016/6/27", "2016/6/28"]
            },
            yAxis: {},
            series: [{
                name: '提及次数',
                type: 'bar',
                data: [1,2,3,4,2,3,1,2,3,3,2,1,3,2,3,3,6,4,1,5,2,2,1,2,1,3,1,2,1]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
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
                        color:'#79cce0',
                        brushType : 'both',
                        borderColor : 'rgba(0,0,0,0)',
                        borderWidth : 1
                    },
                    linkStyle: {
                        type: 'curve',
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
			nodes:[
                {"category":0,"name":"关键词-中国电信","value":60}
				,{"category":1,"name":"通信","value":49.07243461}
				,{"category":1,"name":"4G","value":4.424778761}
				,{"category":1,"name":"真实","value":1.981651376}
				,{"category":1,"name":"杨杰","value":1.315789474}
				,{"category":1,"name":"CTNET2025","value":0.695652174}
				,{"category":1,"name":"网络","value":0.621359223}
				,{"category":1,"name":"去了","value":0.592592593}
				,{"category":1,"name":"真实情况","value":0.303370787}
				,{"category":1,"name":"王牌","value":0.3}
				,{"category":1,"name":"这就是","value":0.278350515}
				,{"category":1,"name":"致命","value":0.278350515}
				,{"category":1,"name":"北京","value":0.171974522}
				,{"category":1,"name":"看完","value":0.133004926}
				,{"category":1,"name":"军事打击","value":0.08988764}
				,{"category":1,"name":"稀罕","value":0.08988764}
				,{"category":1,"name":"亲历记","value":0.08988764}
				,{"category":1,"name":"去电信化","value":0.08988764}
				,{"category":1,"name":"研发","value":0.08988764}
				,{"category":1,"name":"ctbri","value":0.08988764}
				,{"category":1,"name":"而来","value":0.088888889}
            ],
			links:[
                {"source":"关键词-中国电信","target":"通信","weight":1,"f":49.07243461},
				{"source":"关键词-中国电信","target":"4G","weight":1,"f":4.424778761},
				{"source":"关键词-中国电信","target":"真实","weight":1,"f":1.981651376},
				{"source":"关键词-中国电信","target":"杨杰","weight":1,"f":1.315789474},
				{"source":"关键词-中国电信","target":"CTNET2025","weight":1,"f":0.695652174},
				{"source":"关键词-中国电信","target":"网络","weight":1,"f":0.621359223},
				{"source":"关键词-中国电信","target":"去了","weight":1,"f":0.592592593},
				{"source":"关键词-中国电信","target":"真实情况","weight":1,"f":0.303370787},
				{"source":"关键词-中国电信","target":"王牌","weight":1,"f":0.3},
				{"source":"关键词-中国电信","target":"这就是","weight":1,"f":0.278350515},
				{"source":"关键词-中国电信","target":"致命","weight":1,"f":0.278350515},
				{"source":"关键词-中国电信","target":"北京","weight":1,"f":0.171974522},
				{"source":"关键词-中国电信","target":"看完","weight":1,"f":0.133004926},
				{"source":"关键词-中国电信","target":"军事打击","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"稀罕","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"亲历记","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"去电信化","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"研发","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"ctbri","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"而来","weight":1,"f":0.088888889}]
            }]};
			treeChart.setOption(option);
        }
    </script>

</body>
</html>