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
                        //color:'rgb(54,143,255)',
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
            minRadius : 12,
            maxRadius : 45,
            gravity: 1,
            scaling: 1.4,
            roam: 'move',
			nodes:[
			
{category:0, name: '人工智能', value : 1, label: '人工智能'},
{category:1, name: '围棋', value : 0.9590398251511958},
{category:1, name: '棋手', value : 0.9445749095844389},
{category:1, name: '李世石', value : 0.9350281557958615},
{category:1, name: '对弈', value : 0.9244461860551962},
{category:1, name: '局面', value : 0.9228652397091874},
{category:1, name: '战胜', value : 0.9017173205179807},
{category:1, name: '棋局', value : 0.887094199101005},
{category:1, name: '落子', value : 0.8776185947947935},
{category:1, name: '阿尔法', value : 0.8758472965023899},
{category:1, name: '对局', value : 0.8714136062219681},
{category:2, name: '人工智能', value : 0.9590398251511958},
{category:2, name: '李世石', value : 0.9272785735057568},
{category:2, name: '棋手', value : 0.9237446414867976},
{category:2, name: '战胜', value : 0.9169378796630184},
{category:2, name: '局面', value : 0.9058757442621723},
{category:2, name: '对弈', value : 0.8980608513983072},
{category:2, name: '世界冠军', value : 0.8574398245286572},
{category:2, name: '对局', value : 0.8461167964147788},
{category:2, name: '阿尔法', value : 0.8319017165251585},
{category:2, name: '母星', value : 0.8238711645817803},
{category:2, name: '对弈', value : 0.9878731923342251},
{category:2, name: '李世石', value : 0.9662948918894712},
{category:2, name: '局面', value : 0.9659365346441444},
{category:2, name: '棋局', value : 0.9557669258225322},
{category:2, name: '下棋', value : 0.9503704864443322},
{category:2, name: '战胜', value : 0.9488453006774255},
{category:2, name: '人工智能', value : 0.9445749095844389},
{category:2, name: '阿尔法', value : 0.941983862641278},
{category:2, name: '落子', value : 0.9413131827738462},
{category:2, name: '棋盘', value : 0.9298398785107101},
{category:2, name: '棋手', value : 0.9662948918894712},
{category:2, name: '战胜', value : 0.9624201848959646},
{category:2, name: '对弈', value : 0.941609764154919},
{category:2, name: '人工智能', value : 0.9350281557958615},
{category:2, name: '围棋', value : 0.9272785735057568},
{category:2, name: '阿尔法', value : 0.9263181032069262},
{category:2, name: '强手', value : 0.9187101891554963},
{category:2, name: '局面', value : 0.9110106486388133},
{category:2, name: '获刑', value : 0.9061503382327566},
{category:2, name: '世界冠军', value : 0.9054740003250329},
{category:2, name: '棋手', value : 0.9878731923342251},
{category:2, name: '局面', value : 0.9710787323293351},
{category:2, name: '下棋', value : 0.9647941194274288},
{category:2, name: '棋局', value : 0.9639185441345963},
{category:2, name: '落子', value : 0.9540156974158496},
{category:2, name: '赢棋', value : 0.9423487673646463},
{category:2, name: '棋盘', value : 0.9420978870265062},
{category:2, name: '李世石', value : 0.941609764154919},
{category:2, name: '对局', value : 0.9407882738211689},
{category:2, name: '国粹', value : 0.939721083935993},
{category:2, name: '对弈', value : 0.9710787323293351},
{category:2, name: '棋手', value : 0.9659365346441444},
{category:2, name: '棋局', value : 0.9581985361100867},
{category:2, name: '落子', value : 0.9567937520201647},
{category:2, name: '下棋', value : 0.9524209589644124},
{category:2, name: '棋盘', value : 0.9353014996146137},
{category:2, name: '人工智能', value : 0.9228652397091874},
{category:2, name: '国粹', value : 0.9118441866567516},
{category:2, name: '李世石', value : 0.9110106486388133},
{category:2, name: '蒙特卡洛', value : 0.9088340638157835},
{category:2, name: '李世石', value : 0.9624201848959646},
{category:2, name: '棋手', value : 0.9488453006774255},
{category:2, name: '围棋', value : 0.9169378796630184},
{category:2, name: '对弈', value : 0.9158795310746122},
{category:2, name: '强手', value : 0.907784494184283},
{category:2, name: '人工智能', value : 0.9017173205179807},
{category:2, name: '局面', value : 0.8941263617935085},
{category:2, name: '被动', value : 0.8829768674757152},
{category:2, name: '校企', value : 0.8829244384995512},
{category:2, name: '崩坏', value : 0.8748197984479305},
{category:2, name: '落子', value : 0.9960597221101419},
{category:2, name: '下棋', value : 0.9924521899267752},
{category:2, name: '棋盘', value : 0.9798110988261473},
{category:2, name: '赢棋', value : 0.9689936494898398},
{category:2, name: '对弈', value : 0.9639185441345963},
{category:2, name: '蒙特卡洛', value : 0.9604658104147356},
{category:2, name: '局面', value : 0.9581985361100867},
{category:2, name: '棋手', value : 0.9557669258225322},
{category:2, name: '策略', value : 0.9472311103665013},
{category:2, name: '路径', value : 0.934178939773444},
{category:2, name: '棋局', value : 0.9960597221101419},
{category:2, name: '下棋', value : 0.9909194268332723},
{category:2, name: '棋盘', value : 0.9779079793608904},
{category:2, name: '蒙特卡洛', value : 0.9623876987286963},
{category:2, name: '赢棋', value : 0.9582202817657599},
{category:2, name: '局面', value : 0.9567937520201647},
{category:2, name: '策略', value : 0.956331594737406},
{category:2, name: '对弈', value : 0.9540156974158496},
{category:2, name: '棋手', value : 0.9413131827738462},
{category:2, name: '路径', value : 0.9394290459402768},
{category:2, name: '五局', value : 0.9791690253687421},
{category:2, name: '棋风', value : 0.9717328689879559},
{category:2, name: '对局', value : 0.9676289736358387},
{category:2, name: '桀骜不驯', value : 0.9451052705570291},
{category:2, name: '赢棋', value : 0.943048227310829},
{category:2, name: '棋手', value : 0.941983862641278},
{category:2, name: '对弈', value : 0.9385221291861188},
{category:2, name: '铜铁', value : 0.9379788726657052},
{category:2, name: '霍兹', value : 0.9373904811455419},
{category:2, name: '降妖', value : 0.934351153979285},
{category:2, name: '阿尔法', value : 0.9676289736358387},
{category:2, name: '对弈', value : 0.9407882738211689},
{category:2, name: '棋风', value : 0.9396780120673532},
{category:2, name: '五局', value : 0.935577725248223},
{category:2, name: '棋手', value : 0.9287522646284622},
{category:2, name: '会扣', value : 0.9221968310173803},
{category:2, name: '胜率', value : 0.9172804981285454},
{category:2, name: '重修', value : 0.9141183231239338},
{category:2, name: '邀请赛', value : 0.9139979438240687},
{category:2, name: '赢棋', value : 0.9111917549030315},




			
			],
			links:[
			
		 {source : '人工智能', target : '围棋', weight : 0.9590398251511958, name: '0.9590398251511958'},
 {source : '人工智能', target : '棋手', weight : 0.9445749095844389, name: '0.9445749095844389'},
 {source : '人工智能', target : '李世石', weight : 0.9350281557958615, name: '0.9350281557958615'},
 {source : '人工智能', target : '对弈', weight : 0.9244461860551962, name: '0.9244461860551962'},
 {source : '人工智能', target : '局面', weight : 0.9228652397091874, name: '0.9228652397091874'},
 {source : '人工智能', target : '战胜', weight : 0.9017173205179807, name: '0.9017173205179807'},
 {source : '人工智能', target : '棋局', weight : 0.887094199101005, name: '0.887094199101005'},
 {source : '人工智能', target : '落子', weight : 0.8776185947947935, name: '0.8776185947947935'},
 {source : '人工智能', target : '阿尔法', weight : 0.8758472965023899, name: '0.8758472965023899'},
 {source : '人工智能', target : '对局', weight : 0.8714136062219681, name: '0.8714136062219681'},
 {source : '围棋', target : '人工智能', weight : 0.9590398251511958, name: '0.9590398251511958'},
 {source : '围棋', target : '李世石', weight : 0.9272785735057568, name: '0.9590398251511958'},
 {source : '围棋', target : '棋手', weight : 0.9237446414867976, name: '0.9590398251511958'},
 {source : '围棋', target : '战胜', weight : 0.9169378796630184, name: '0.9590398251511958'},
 {source : '围棋', target : '局面', weight : 0.9058757442621723, name: '0.9590398251511958'},
 {source : '围棋', target : '对弈', weight : 0.8980608513983072, name: '0.9590398251511958'},
 {source : '围棋', target : '世界冠军', weight : 0.8574398245286572, name: '0.9590398251511958'},
 {source : '围棋', target : '对局', weight : 0.8461167964147788, name: '0.9590398251511958'},
 {source : '围棋', target : '阿尔法', weight : 0.8319017165251585, name: '0.9590398251511958'},
 {source : '围棋', target : '母星', weight : 0.8238711645817803, name: '0.9590398251511958'},
 {source : '棋手', target : '对弈', weight : 0.9878731923342251, name: '0.9445749095844389'},
 {source : '棋手', target : '李世石', weight : 0.9662948918894712, name: '0.9445749095844389'},
 {source : '棋手', target : '局面', weight : 0.9659365346441444, name: '0.9445749095844389'},
 {source : '棋手', target : '棋局', weight : 0.9557669258225322, name: '0.9445749095844389'},
 {source : '棋手', target : '下棋', weight : 0.9503704864443322, name: '0.9445749095844389'},
 {source : '棋手', target : '战胜', weight : 0.9488453006774255, name: '0.9445749095844389'},
 {source : '棋手', target : '人工智能', weight : 0.9445749095844389, name: '0.9445749095844389'},
 {source : '棋手', target : '阿尔法', weight : 0.941983862641278, name: '0.9445749095844389'},
 {source : '棋手', target : '落子', weight : 0.9413131827738462, name: '0.9445749095844389'},
 {source : '棋手', target : '棋盘', weight : 0.9298398785107101, name: '0.9445749095844389'},
 {source : '李世石', target : '棋手', weight : 0.9662948918894712, name: '0.9350281557958615'},
 {source : '李世石', target : '战胜', weight : 0.9624201848959646, name: '0.9350281557958615'},
 {source : '李世石', target : '对弈', weight : 0.941609764154919, name: '0.9350281557958615'},
 {source : '李世石', target : '人工智能', weight : 0.9350281557958615, name: '0.9350281557958615'},
 {source : '李世石', target : '围棋', weight : 0.9272785735057568, name: '0.9350281557958615'},
 {source : '李世石', target : '阿尔法', weight : 0.9263181032069262, name: '0.9350281557958615'},
 {source : '李世石', target : '强手', weight : 0.9187101891554963, name: '0.9350281557958615'},
 {source : '李世石', target : '局面', weight : 0.9110106486388133, name: '0.9350281557958615'},
 {source : '李世石', target : '获刑', weight : 0.9061503382327566, name: '0.9350281557958615'},
 {source : '李世石', target : '世界冠军', weight : 0.9054740003250329, name: '0.9350281557958615'},
 {source : '对弈', target : '棋手', weight : 0.9878731923342251, name: '0.9244461860551962'},
 {source : '对弈', target : '局面', weight : 0.9710787323293351, name: '0.9244461860551962'},
 {source : '对弈', target : '下棋', weight : 0.9647941194274288, name: '0.9244461860551962'},
 {source : '对弈', target : '棋局', weight : 0.9639185441345963, name: '0.9244461860551962'},
 {source : '对弈', target : '落子', weight : 0.9540156974158496, name: '0.9244461860551962'},
 {source : '对弈', target : '赢棋', weight : 0.9423487673646463, name: '0.9244461860551962'},
 {source : '对弈', target : '棋盘', weight : 0.9420978870265062, name: '0.9244461860551962'},
 {source : '对弈', target : '李世石', weight : 0.941609764154919, name: '0.9244461860551962'},
 {source : '对弈', target : '对局', weight : 0.9407882738211689, name: '0.9244461860551962'},
 {source : '对弈', target : '国粹', weight : 0.939721083935993, name: '0.9244461860551962'},
 {source : '局面', target : '对弈', weight : 0.9710787323293351, name: '0.9228652397091874'},
 {source : '局面', target : '棋手', weight : 0.9659365346441444, name: '0.9228652397091874'},
 {source : '局面', target : '棋局', weight : 0.9581985361100867, name: '0.9228652397091874'},
 {source : '局面', target : '落子', weight : 0.9567937520201647, name: '0.9228652397091874'},
 {source : '局面', target : '下棋', weight : 0.9524209589644124, name: '0.9228652397091874'},
 {source : '局面', target : '棋盘', weight : 0.9353014996146137, name: '0.9228652397091874'},
 {source : '局面', target : '人工智能', weight : 0.9228652397091874, name: '0.9228652397091874'},
 {source : '局面', target : '国粹', weight : 0.9118441866567516, name: '0.9228652397091874'},
 {source : '局面', target : '李世石', weight : 0.9110106486388133, name: '0.9228652397091874'},
 {source : '局面', target : '蒙特卡洛', weight : 0.9088340638157835, name: '0.9228652397091874'},
 {source : '战胜', target : '李世石', weight : 0.9624201848959646, name: '0.9017173205179807'},
 {source : '战胜', target : '棋手', weight : 0.9488453006774255, name: '0.9017173205179807'},
 {source : '战胜', target : '围棋', weight : 0.9169378796630184, name: '0.9017173205179807'},
 {source : '战胜', target : '对弈', weight : 0.9158795310746122, name: '0.9017173205179807'},
 {source : '战胜', target : '强手', weight : 0.907784494184283, name: '0.9017173205179807'},
 {source : '战胜', target : '人工智能', weight : 0.9017173205179807, name: '0.9017173205179807'},
 {source : '战胜', target : '局面', weight : 0.8941263617935085, name: '0.9017173205179807'},
 {source : '战胜', target : '被动', weight : 0.8829768674757152, name: '0.9017173205179807'},
 {source : '战胜', target : '校企', weight : 0.8829244384995512, name: '0.9017173205179807'},
 {source : '战胜', target : '崩坏', weight : 0.8748197984479305, name: '0.9017173205179807'},
 {source : '棋局', target : '落子', weight : 0.9960597221101419, name: '0.887094199101005'},
 {source : '棋局', target : '下棋', weight : 0.9924521899267752, name: '0.887094199101005'},
 {source : '棋局', target : '棋盘', weight : 0.9798110988261473, name: '0.887094199101005'},
 {source : '棋局', target : '赢棋', weight : 0.9689936494898398, name: '0.887094199101005'},
 {source : '棋局', target : '对弈', weight : 0.9639185441345963, name: '0.887094199101005'},
 {source : '棋局', target : '蒙特卡洛', weight : 0.9604658104147356, name: '0.887094199101005'},
 {source : '棋局', target : '局面', weight : 0.9581985361100867, name: '0.887094199101005'},
 {source : '棋局', target : '棋手', weight : 0.9557669258225322, name: '0.887094199101005'},
 {source : '棋局', target : '策略', weight : 0.9472311103665013, name: '0.887094199101005'},
 {source : '棋局', target : '路径', weight : 0.934178939773444, name: '0.887094199101005'},
 {source : '落子', target : '棋局', weight : 0.9960597221101419, name: '0.8776185947947935'},
 {source : '落子', target : '下棋', weight : 0.9909194268332723, name: '0.8776185947947935'},
 {source : '落子', target : '棋盘', weight : 0.9779079793608904, name: '0.8776185947947935'},
 {source : '落子', target : '蒙特卡洛', weight : 0.9623876987286963, name: '0.8776185947947935'},
 {source : '落子', target : '赢棋', weight : 0.9582202817657599, name: '0.8776185947947935'},
 {source : '落子', target : '局面', weight : 0.9567937520201647, name: '0.8776185947947935'},
 {source : '落子', target : '策略', weight : 0.956331594737406, name: '0.8776185947947935'},
 {source : '落子', target : '对弈', weight : 0.9540156974158496, name: '0.8776185947947935'},
 {source : '落子', target : '棋手', weight : 0.9413131827738462, name: '0.8776185947947935'},
 {source : '落子', target : '路径', weight : 0.9394290459402768, name: '0.8776185947947935'},
 {source : '阿尔法', target : '五局', weight : 0.9791690253687421, name: '0.8758472965023899'},
 {source : '阿尔法', target : '棋风', weight : 0.9717328689879559, name: '0.8758472965023899'},
 {source : '阿尔法', target : '对局', weight : 0.9676289736358387, name: '0.8758472965023899'},
 {source : '阿尔法', target : '桀骜不驯', weight : 0.9451052705570291, name: '0.8758472965023899'},
 {source : '阿尔法', target : '赢棋', weight : 0.943048227310829, name: '0.8758472965023899'},
 {source : '阿尔法', target : '棋手', weight : 0.941983862641278, name: '0.8758472965023899'},
 {source : '阿尔法', target : '对弈', weight : 0.9385221291861188, name: '0.8758472965023899'},
 {source : '阿尔法', target : '铜铁', weight : 0.9379788726657052, name: '0.8758472965023899'},
 {source : '阿尔法', target : '霍兹', weight : 0.9373904811455419, name: '0.8758472965023899'},
 {source : '阿尔法', target : '降妖', weight : 0.934351153979285, name: '0.8758472965023899'},
 {source : '对局', target : '阿尔法', weight : 0.9676289736358387, name: '0.8714136062219681'},
 {source : '对局', target : '对弈', weight : 0.9407882738211689, name: '0.8714136062219681'},
 {source : '对局', target : '棋风', weight : 0.9396780120673532, name: '0.8714136062219681'},
 {source : '对局', target : '五局', weight : 0.935577725248223, name: '0.8714136062219681'},
 {source : '对局', target : '棋手', weight : 0.9287522646284622, name: '0.8714136062219681'},
 {source : '对局', target : '会扣', weight : 0.9221968310173803, name: '0.8714136062219681'},
 {source : '对局', target : '胜率', weight : 0.9172804981285454, name: '0.8714136062219681'},
 {source : '对局', target : '重修', weight : 0.9141183231239338, name: '0.8714136062219681'},
 {source : '对局', target : '邀请赛', weight : 0.9139979438240687, name: '0.8714136062219681'},
 {source : '对局', target : '赢棋', weight : 0.9111917549030315, name: '0.8714136062219681'},



			
			]
			}]};
			treeChart.setOption(option);
			
			treeChart.hideLoading();
        }
    </script>