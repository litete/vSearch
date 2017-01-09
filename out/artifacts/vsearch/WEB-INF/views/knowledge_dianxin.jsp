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
{category:0, name: '电信', value : 1, label: '电信'},
{category:1, name: '宽带', value : 0.9253639240672553},
{category:1, name: '营业厅', value : 0.9087553383403378},
{category:1, name: '小微', value : 0.8993120199536063},
{category:1, name: '商户', value : 0.8967164736135361},
{category:1, name: '联通', value : 0.8966925301759248},
{category:1, name: '微信端', value : 0.8963244543336808},
{category:1, name: '极速', value : 0.891627569260927},
{category:1, name: '我行', value : 0.8900027298501265},
{category:1, name: '商城', value : 0.889628167206448},
{category:1, name: '近种', value : 0.8862784083567898},
{category:2, name: '电信', value : 0.9253639240672553},
{category:2, name: '线下', value : 0.9164995411041252},
{category:2, name: '账单', value : 0.9021258406321018},
{category:2, name: '可选包', value : 0.8929199883129478},
{category:2, name: '营业厅', value : 0.8910132703754725},
{category:2, name: '办卡', value : 0.8871099269254629},
{category:2, name: '并于', value : 0.8851092148819583},
{category:2, name: '极速', value : 0.8802161983563903},
{category:2, name: '机票代理', value : 0.875375215269538},
{category:2, name: '小微', value : 0.874500779697676},
{category:2, name: '可选包', value : 0.9163444098627886},
{category:2, name: '账单', value : 0.9142716136867178},
{category:2, name: '电信', value : 0.9087553383403378},
{category:2, name: '手机号码', value : 0.9081724338555993},
{category:2, name: '一元', value : 0.9045569664335361},
{category:2, name: '宽带', value : 0.8910132703754725},
{category:2, name: '资费', value : 0.8881057750855259},
{category:2, name: '代金券', value : 0.8877719351788983},
{category:2, name: '我行', value : 0.8870213561893171},
{category:2, name: '实名制', value : 0.8846816870240718},
{category:2, name: '送元', value : 0.9438236029500614},
{category:2, name: '卡卡', value : 0.9157460415988309},
{category:2, name: '话费', value : 0.9142354416241032},
{category:2, name: '千元', value : 0.9091627875715267},
{category:2, name: '商户', value : 0.9029215322900273},
{category:2, name: '代金券', value : 0.9021557742106834},
{category:2, name: '电信', value : 0.8993120199536063},
{category:2, name: '绑定', value : 0.8985149098210911},
{category:2, name: '特价机票', value : 0.8957526222067173},
{category:2, name: '征信', value : 0.8933168230947734},
{category:2, name: '付款', value : 0.9477429750328307},
{category:2, name: '钱方', value : 0.9376783006486926},
{category:2, name: '扫码', value : 0.9273105175558783},
{category:2, name: '还款', value : 0.9239461082394932},
{category:2, name: '收款', value : 0.9218411654163926},
{category:2, name: '龙卡', value : 0.917074598531723},
{category:2, name: '卡券', value : 0.9131357680137239},
{category:2, name: '详情页', value : 0.9105233252382424},
{category:2, name: '提额', value : 0.9093004363832686},
{category:2, name: '宝网', value : 0.9087408474386508},
{category:2, name: '电信', value : 0.8966925301759248},
{category:2, name: '取票', value : 0.8937603209311076},
{category:2, name: '屈臣氏', value : 0.8937501265590931},
{category:2, name: '站点', value : 0.8913312913261869},
{category:2, name: '获奖者', value : 0.8856123302454163},
{category:2, name: '购机', value : 0.8819496278041323},
{category:2, name: '代金券', value : 0.8795318016344272},
{category:2, name: '过期作废', value : 0.8790366410007792},
{category:2, name: '抵用券', value : 0.8783229773078597},
{category:2, name: '版米', value : 0.8775043579277694},
{category:2, name: '时下', value : 0.9154463114633739},
{category:2, name: '付款', value : 0.9135758104847173},
{category:2, name: '绑定', value : 0.9042849359433527},
{category:2, name: '商户', value : 0.9037247514738737},
{category:2, name: '有份', value : 0.9036505948113133},
{category:2, name: '电信', value : 0.8963244543336808},
{category:2, name: '扫码', value : 0.8959765560842047},
{category:2, name: '客户端', value : 0.8931204248179648},
{category:2, name: '邮储', value : 0.8893316205768471},
{category:2, name: '售卖', value : 0.886890341195922},
{category:2, name: '详情页', value : 0.9084631198226915},
{category:2, name: '机票代理', value : 0.905703595954323},
{category:2, name: '电信', value : 0.891627569260927},
{category:2, name: '等额', value : 0.8915048218947093},
{category:2, name: '提额', value : 0.8901031289382093},
{category:2, name: '小微', value : 0.8829594893957414},
{category:2, name: '还款', value : 0.8825466562883592},
{category:2, name: '宽带', value : 0.8802161983563903},
{category:2, name: '真假', value : 0.8794800956448923},
{category:2, name: '指定', value : 0.8755060216863998},
{category:2, name: '理财产品', value : 0.9112464586735656},
{category:2, name: '守候', value : 0.8911115223008145},
{category:2, name: '电信', value : 0.8900027298501265},
{category:2, name: '邮储', value : 0.8887914637182349},
{category:2, name: '营业厅', value : 0.8870213561893171},
{category:2, name: '可选包', value : 0.886242611242573},
{category:2, name: '佣金', value : 0.8822582200568613},
{category:2, name: '商户', value : 0.8803984337801174},
{category:2, name: '卡卡', value : 0.8782037360620633},
{category:2, name: '宝网', value : 0.8777304231698899},
{category:2, name: '名中', value : 0.9100268756138866},
{category:2, name: '荣耀', value : 0.895091283367892},
{category:2, name: '售完', value : 0.8950773442725956},
{category:2, name: '电子礼品', value : 0.8924568021513383},
{category:2, name: '电信', value : 0.889628167206448},
{category:2, name: '促销', value : 0.8895887800348323},
{category:2, name: '礼品', value : 0.8895351290835899},
{category:2, name: '优衣库', value : 0.8882446971903577},
{category:2, name: '中奖', value : 0.8876100439355825},
{category:2, name: '优惠券', value : 0.8874206627628753},
{category:2, name: '随机', value : 0.937020092081747},
{category:2, name: '赢取', value : 0.9285562969565642},
{category:2, name: '专题', value : 0.9264896911257693},
{category:2, name: '代金券', value : 0.9207705469641458},
{category:2, name: '敬请期待', value : 0.916814526295688},
{category:2, name: '晒图', value : 0.9164276761781173},
{category:2, name: '大礼包', value : 0.9153235121659846},
{category:2, name: '送元', value : 0.9150092598027493},
{category:2, name: '礼品', value : 0.9143437025307111},
{category:2, name: '绑定', value : 0.912320606096541},

			
			],
			links:[
			
	 {source : '电信', target : '宽带', weight : 0.9253639240672553, name: '0.9253639240672553'},
 {source : '电信', target : '营业厅', weight : 0.9087553383403378, name: '0.9087553383403378'},
 {source : '电信', target : '小微', weight : 0.8993120199536063, name: '0.8993120199536063'},
 {source : '电信', target : '商户', weight : 0.8967164736135361, name: '0.8967164736135361'},
 {source : '电信', target : '联通', weight : 0.8966925301759248, name: '0.8966925301759248'},
 {source : '电信', target : '微信端', weight : 0.8963244543336808, name: '0.8963244543336808'},
 {source : '电信', target : '极速', weight : 0.891627569260927, name: '0.891627569260927'},
 {source : '电信', target : '我行', weight : 0.8900027298501265, name: '0.8900027298501265'},
 {source : '电信', target : '商城', weight : 0.889628167206448, name: '0.889628167206448'},
 {source : '电信', target : '近种', weight : 0.8862784083567898, name: '0.8862784083567898'},
 {source : '宽带', target : '电信', weight : 0.9253639240672553, name: '0.9253639240672553'},
 {source : '宽带', target : '线下', weight : 0.9164995411041252, name: '0.9253639240672553'},
 {source : '宽带', target : '账单', weight : 0.9021258406321018, name: '0.9253639240672553'},
 {source : '宽带', target : '可选包', weight : 0.8929199883129478, name: '0.9253639240672553'},
 {source : '宽带', target : '营业厅', weight : 0.8910132703754725, name: '0.9253639240672553'},
 {source : '宽带', target : '办卡', weight : 0.8871099269254629, name: '0.9253639240672553'},
 {source : '宽带', target : '并于', weight : 0.8851092148819583, name: '0.9253639240672553'},
 {source : '宽带', target : '极速', weight : 0.8802161983563903, name: '0.9253639240672553'},
 {source : '宽带', target : '机票代理', weight : 0.875375215269538, name: '0.9253639240672553'},
 {source : '宽带', target : '小微', weight : 0.874500779697676, name: '0.9253639240672553'},
 {source : '营业厅', target : '可选包', weight : 0.9163444098627886, name: '0.9087553383403378'},
 {source : '营业厅', target : '账单', weight : 0.9142716136867178, name: '0.9087553383403378'},
 {source : '营业厅', target : '电信', weight : 0.9087553383403378, name: '0.9087553383403378'},
 {source : '营业厅', target : '手机号码', weight : 0.9081724338555993, name: '0.9087553383403378'},
 {source : '营业厅', target : '一元', weight : 0.9045569664335361, name: '0.9087553383403378'},
 {source : '营业厅', target : '宽带', weight : 0.8910132703754725, name: '0.9087553383403378'},
 {source : '营业厅', target : '资费', weight : 0.8881057750855259, name: '0.9087553383403378'},
 {source : '营业厅', target : '代金券', weight : 0.8877719351788983, name: '0.9087553383403378'},
 {source : '营业厅', target : '我行', weight : 0.8870213561893171, name: '0.9087553383403378'},
 {source : '营业厅', target : '实名制', weight : 0.8846816870240718, name: '0.9087553383403378'},
 {source : '小微', target : '送元', weight : 0.9438236029500614, name: '0.8993120199536063'},
 {source : '小微', target : '卡卡', weight : 0.9157460415988309, name: '0.8993120199536063'},
 {source : '小微', target : '话费', weight : 0.9142354416241032, name: '0.8993120199536063'},
 {source : '小微', target : '千元', weight : 0.9091627875715267, name: '0.8993120199536063'},
 {source : '小微', target : '商户', weight : 0.9029215322900273, name: '0.8993120199536063'},
 {source : '小微', target : '代金券', weight : 0.9021557742106834, name: '0.8993120199536063'},
 {source : '小微', target : '电信', weight : 0.8993120199536063, name: '0.8993120199536063'},
 {source : '小微', target : '绑定', weight : 0.8985149098210911, name: '0.8993120199536063'},
 {source : '小微', target : '特价机票', weight : 0.8957526222067173, name: '0.8993120199536063'},
 {source : '小微', target : '征信', weight : 0.8933168230947734, name: '0.8993120199536063'},
 {source : '商户', target : '付款', weight : 0.9477429750328307, name: '0.8967164736135361'},
 {source : '商户', target : '钱方', weight : 0.9376783006486926, name: '0.8967164736135361'},
 {source : '商户', target : '扫码', weight : 0.9273105175558783, name: '0.8967164736135361'},
 {source : '商户', target : '还款', weight : 0.9239461082394932, name: '0.8967164736135361'},
 {source : '商户', target : '收款', weight : 0.9218411654163926, name: '0.8967164736135361'},
 {source : '商户', target : '龙卡', weight : 0.917074598531723, name: '0.8967164736135361'},
 {source : '商户', target : '卡券', weight : 0.9131357680137239, name: '0.8967164736135361'},
 {source : '商户', target : '详情页', weight : 0.9105233252382424, name: '0.8967164736135361'},
 {source : '商户', target : '提额', weight : 0.9093004363832686, name: '0.8967164736135361'},
 {source : '商户', target : '宝网', weight : 0.9087408474386508, name: '0.8967164736135361'},
 {source : '联通', target : '电信', weight : 0.8966925301759248, name: '0.8966925301759248'},
 {source : '联通', target : '取票', weight : 0.8937603209311076, name: '0.8966925301759248'},
 {source : '联通', target : '屈臣氏', weight : 0.8937501265590931, name: '0.8966925301759248'},
 {source : '联通', target : '站点', weight : 0.8913312913261869, name: '0.8966925301759248'},
 {source : '联通', target : '获奖者', weight : 0.8856123302454163, name: '0.8966925301759248'},
 {source : '联通', target : '购机', weight : 0.8819496278041323, name: '0.8966925301759248'},
 {source : '联通', target : '代金券', weight : 0.8795318016344272, name: '0.8966925301759248'},
 {source : '联通', target : '过期作废', weight : 0.8790366410007792, name: '0.8966925301759248'},
 {source : '联通', target : '抵用券', weight : 0.8783229773078597, name: '0.8966925301759248'},
 {source : '联通', target : '版米', weight : 0.8775043579277694, name: '0.8966925301759248'},
 {source : '微信端', target : '时下', weight : 0.9154463114633739, name: '0.8963244543336808'},
 {source : '微信端', target : '付款', weight : 0.9135758104847173, name: '0.8963244543336808'},
 {source : '微信端', target : '绑定', weight : 0.9042849359433527, name: '0.8963244543336808'},
 {source : '微信端', target : '商户', weight : 0.9037247514738737, name: '0.8963244543336808'},
 {source : '微信端', target : '有份', weight : 0.9036505948113133, name: '0.8963244543336808'},
 {source : '微信端', target : '电信', weight : 0.8963244543336808, name: '0.8963244543336808'},
 {source : '微信端', target : '扫码', weight : 0.8959765560842047, name: '0.8963244543336808'},
 {source : '微信端', target : '客户端', weight : 0.8931204248179648, name: '0.8963244543336808'},
 {source : '微信端', target : '邮储', weight : 0.8893316205768471, name: '0.8963244543336808'},
 {source : '微信端', target : '售卖', weight : 0.886890341195922, name: '0.8963244543336808'},
 {source : '极速', target : '详情页', weight : 0.9084631198226915, name: '0.891627569260927'},
 {source : '极速', target : '机票代理', weight : 0.905703595954323, name: '0.891627569260927'},
 {source : '极速', target : '电信', weight : 0.891627569260927, name: '0.891627569260927'},
 {source : '极速', target : '等额', weight : 0.8915048218947093, name: '0.891627569260927'},
 {source : '极速', target : '提额', weight : 0.8901031289382093, name: '0.891627569260927'},
 {source : '极速', target : '小微', weight : 0.8829594893957414, name: '0.891627569260927'},
 {source : '极速', target : '还款', weight : 0.8825466562883592, name: '0.891627569260927'},
 {source : '极速', target : '宽带', weight : 0.8802161983563903, name: '0.891627569260927'},
 {source : '极速', target : '真假', weight : 0.8794800956448923, name: '0.891627569260927'},
 {source : '极速', target : '指定', weight : 0.8755060216863998, name: '0.891627569260927'},
 {source : '我行', target : '理财产品', weight : 0.9112464586735656, name: '0.8900027298501265'},
 {source : '我行', target : '守候', weight : 0.8911115223008145, name: '0.8900027298501265'},
 {source : '我行', target : '电信', weight : 0.8900027298501265, name: '0.8900027298501265'},
 {source : '我行', target : '邮储', weight : 0.8887914637182349, name: '0.8900027298501265'},
 {source : '我行', target : '营业厅', weight : 0.8870213561893171, name: '0.8900027298501265'},
 {source : '我行', target : '可选包', weight : 0.886242611242573, name: '0.8900027298501265'},
 {source : '我行', target : '佣金', weight : 0.8822582200568613, name: '0.8900027298501265'},
 {source : '我行', target : '商户', weight : 0.8803984337801174, name: '0.8900027298501265'},
 {source : '我行', target : '卡卡', weight : 0.8782037360620633, name: '0.8900027298501265'},
 {source : '我行', target : '宝网', weight : 0.8777304231698899, name: '0.8900027298501265'},
 {source : '商城', target : '名中', weight : 0.9100268756138866, name: '0.889628167206448'},
 {source : '商城', target : '荣耀', weight : 0.895091283367892, name: '0.889628167206448'},
 {source : '商城', target : '售完', weight : 0.8950773442725956, name: '0.889628167206448'},
 {source : '商城', target : '电子礼品', weight : 0.8924568021513383, name: '0.889628167206448'},
 {source : '商城', target : '电信', weight : 0.889628167206448, name: '0.889628167206448'},
 {source : '商城', target : '促销', weight : 0.8895887800348323, name: '0.889628167206448'},
 {source : '商城', target : '礼品', weight : 0.8895351290835899, name: '0.889628167206448'},
 {source : '商城', target : '优衣库', weight : 0.8882446971903577, name: '0.889628167206448'},
 {source : '商城', target : '中奖', weight : 0.8876100439355825, name: '0.889628167206448'},
 {source : '商城', target : '优惠券', weight : 0.8874206627628753, name: '0.889628167206448'},
 {source : '近种', target : '随机', weight : 0.937020092081747, name: '0.8862784083567898'},
 {source : '近种', target : '赢取', weight : 0.9285562969565642, name: '0.8862784083567898'},
 {source : '近种', target : '专题', weight : 0.9264896911257693, name: '0.8862784083567898'},
 {source : '近种', target : '代金券', weight : 0.9207705469641458, name: '0.8862784083567898'},
 {source : '近种', target : '敬请期待', weight : 0.916814526295688, name: '0.8862784083567898'},
 {source : '近种', target : '晒图', weight : 0.9164276761781173, name: '0.8862784083567898'},
 {source : '近种', target : '大礼包', weight : 0.9153235121659846, name: '0.8862784083567898'},
 {source : '近种', target : '送元', weight : 0.9150092598027493, name: '0.8862784083567898'},
 {source : '近种', target : '礼品', weight : 0.9143437025307111, name: '0.8862784083567898'},
 {source : '近种', target : '绑定', weight : 0.912320606096541, name: '0.8862784083567898'},



			
			]
			}]};
			treeChart.setOption(option);
			
			treeChart.hideLoading();
        }
    </script>