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
			
			{category:0, name: '百度', value : 1, label: '百度'},
{category:1, name: '血友病', value : 0.9121474958537327},
{category:1, name: '李彦宏', value : 0.9007895369663672},
{category:1, name: '运营者', value : 0.8987562174031793},
{category:1, name: '竞价排名', value : 0.8786240061777942},
{category:1, name: '运营权', value : 0.8757806767615945},
{category:1, name: '莆田', value : 0.8753505918749714},
{category:1, name: '公敌', value : 0.8713237736649877},
{category:1, name: '血友', value : 0.8635501619749056},
{category:1, name: '快播', value : 0.8495737515318134},
{category:1, name: '制鞋业', value : 0.8484793603085964},
{category:2, name: '竞价排名', value : 0.9776929352460503},
{category:2, name: '莆田', value : 0.9724692015760514},
{category:2, name: '医疗广告', value : 0.9509482831847494},
{category:2, name: '制鞋业', value : 0.9501951871441623},
{category:2, name: '广告费', value : 0.935155189954058},
{category:2, name: '假鞋', value : 0.9338087318797812},
{category:2, name: '李彦宏', value : 0.9327102978734435},
{category:2, name: '运营权', value : 0.9272893746550295},
{category:2, name: '包好', value : 0.9240809846764413},
{category:2, name: '张建勇', value : 0.919253726660445},
{category:2, name: '公敌', value : 0.9639815138565971},
{category:2, name: '血友病', value : 0.9327102978734435},
{category:2, name: '作恶', value : 0.911882459011109},
{category:2, name: '商业模式', value : 0.9072887433591484},
{category:2, name: '竞价排名', value : 0.9025158326417058},
{category:2, name: '百度', value : 0.9007895369663672},
{category:2, name: '包好', value : 0.8971669270307079},
{category:2, name: '广告费', value : 0.8932924258744873},
{category:2, name: '王卫', value : 0.8932314309052822},
{category:2, name: '铝型材', value : 0.8920647341359058},
{category:2, name: '血友病', value : 0.919208126093494},
{category:2, name: '莆田', value : 0.9075916842469133},
{category:2, name: '百度', value : 0.8987562174031793},
{category:2, name: '医疗广告', value : 0.8859257232481841},
{category:2, name: '运营权', value : 0.8808398874660576},
{category:2, name: '竞价排名', value : 0.8772678846755102},
{category:2, name: '制鞋业', value : 0.8757170144074548},
{category:2, name: '李彦宏', value : 0.8660943533310013},
{category:2, name: '假鞋', value : 0.8618860234760167},
{category:2, name: '分辨真假', value : 0.8613499889791031},
{category:2, name: '血友病', value : 0.9776929352460503},
{category:2, name: '莆田', value : 0.9705788632787969},
{category:2, name: '制鞋业', value : 0.9634686131260302},
{category:2, name: '卖假', value : 0.942890741602585},
{category:2, name: '假鞋', value : 0.9388280749604816},
{category:2, name: '医疗广告', value : 0.9365800991364249},
{category:2, name: '疾病相关', value : 0.9353271594162811},
{category:2, name: '广告费', value : 0.9348141235946376},
{category:2, name: '包好', value : 0.9309554769501571},
{category:2, name: '分辨真假', value : 0.9244714295574873},
{category:2, name: '血友病', value : 0.9272893746550295},
{category:2, name: '之恶', value : 0.9151191844286038},
{category:2, name: '莆田', value : 0.9146147098378584},
{category:2, name: '竞价排名', value : 0.903274554894556},
{category:2, name: '运营者', value : 0.8808398874660576},
{category:2, name: '百度', value : 0.8757806767615945},
{category:2, name: '燕小冰', value : 0.8545224249179242},
{category:2, name: '李彦宏', value : 0.842045856167658},
{category:2, name: '医疗广告', value : 0.8418661134452762},
{category:2, name: '制鞋业', value : 0.8358221066436575},
{category:2, name: '血友病', value : 0.9724692015760514},
{category:2, name: '竞价排名', value : 0.9705788632787969},
{category:2, name: '制鞋业', value : 0.9661687412398564},
{category:2, name: '假鞋', value : 0.9586187598128602},
{category:2, name: '医疗广告', value : 0.9537409344013285},
{category:2, name: '分辨真假', value : 0.939121064048518},
{category:2, name: '广告费', value : 0.9272591001880007},
{category:2, name: '卖假', value : 0.9204591820139062},
{category:2, name: '赚黑心钱', value : 0.9182002478746023},
{category:2, name: '包好', value : 0.9151000185757112},
{category:2, name: '李彦宏', value : 0.9639815138565971},
{category:2, name: '血友病', value : 0.9010091064360586},
{category:2, name: '王卫', value : 0.8936374338140652},
{category:2, name: '商业模式', value : 0.8861799854731082},
{category:2, name: '竞价排名', value : 0.8855992280869376},
{category:2, name: '铝型材', value : 0.8736220122902459},
{category:2, name: '百度', value : 0.8713237736649877},
{category:2, name: '包好', value : 0.8683684453144955},
{category:2, name: '王卫恐', value : 0.8660207884439106},
{category:2, name: '卖假', value : 0.8659680304984794},
{category:2, name: '种类', value : 0.944283489370927},
{category:2, name: '血友病', value : 0.8833458356799749},
{category:2, name: '竞价排名', value : 0.8688600731855008},
{category:2, name: '百度', value : 0.8635501619749056},
{category:2, name: '之恶', value : 0.8494416003804669},
{category:2, name: '公敌', value : 0.8431860316061743},
{category:2, name: '莆田', value : 0.8408417903831481},
{category:2, name: '医美', value : 0.8202949471554275},
{category:2, name: '李彦宏', value : 0.8172126954755142},
{category:2, name: '制鞋业', value : 0.8146193384933046},
{category:2, name: '克东', value : 0.9544963229175246},
{category:2, name: '公诉人', value : 0.946970759618232},
{category:2, name: '王欣', value : 0.9342314835538839},
{category:2, name: '微软', value : 0.8974864403811567},
{category:2, name: '淫秽', value : 0.8890575239298184},
{category:2, name: '免费软件', value : 0.8758821541719117},
{category:2, name: '辩护人', value : 0.8680524204277758},
{category:2, name: '魅族', value : 0.8601352647133256},
{category:2, name: '播放器', value : 0.8558780236297544},
{category:2, name: '删帖', value : 0.851785253428784},
{category:2, name: '假鞋', value : 0.9768089707017656},
{category:2, name: '莆田', value : 0.9661687412398564},
{category:2, name: '卖假', value : 0.9654922668386112},
{category:2, name: '分辨真假', value : 0.9652633632286479},
{category:2, name: '竞价排名', value : 0.9634686131260302},
{category:2, name: '包好', value : 0.9507071163414921},
{category:2, name: '血友病', value : 0.9501951871441623},
{category:2, name: '广告费', value : 0.9492950168268364},
{category:2, name: '医疗广告', value : 0.9467641364793332},
{category:2, name: '三家', value : 0.943586714482768},



			
			],
			links:[
			
			 {source : '百度', target : '血友病', weight : 0.9121474958537327, name: '0.9121474958537327'},
 {source : '百度', target : '李彦宏', weight : 0.9007895369663672, name: '0.9007895369663672'},
 {source : '百度', target : '运营者', weight : 0.8987562174031793, name: '0.8987562174031793'},
 {source : '百度', target : '竞价排名', weight : 0.8786240061777942, name: '0.8786240061777942'},
 {source : '百度', target : '运营权', weight : 0.8757806767615945, name: '0.8757806767615945'},
 {source : '百度', target : '莆田', weight : 0.8753505918749714, name: '0.8753505918749714'},
 {source : '百度', target : '公敌', weight : 0.8713237736649877, name: '0.8713237736649877'},
 {source : '百度', target : '血友', weight : 0.8635501619749056, name: '0.8635501619749056'},
 {source : '百度', target : '快播', weight : 0.8495737515318134, name: '0.8495737515318134'},
 {source : '百度', target : '制鞋业', weight : 0.8484793603085964, name: '0.8484793603085964'},
 {source : '血友病', target : '竞价排名', weight : 0.9776929352460503, name: '0.9121474958537327'},
 {source : '血友病', target : '莆田', weight : 0.9724692015760514, name: '0.9121474958537327'},
 {source : '血友病', target : '医疗广告', weight : 0.9509482831847494, name: '0.9121474958537327'},
 {source : '血友病', target : '制鞋业', weight : 0.9501951871441623, name: '0.9121474958537327'},
 {source : '血友病', target : '广告费', weight : 0.935155189954058, name: '0.9121474958537327'},
 {source : '血友病', target : '假鞋', weight : 0.9338087318797812, name: '0.9121474958537327'},
 {source : '血友病', target : '李彦宏', weight : 0.9327102978734435, name: '0.9121474958537327'},
 {source : '血友病', target : '运营权', weight : 0.9272893746550295, name: '0.9121474958537327'},
 {source : '血友病', target : '包好', weight : 0.9240809846764413, name: '0.9121474958537327'},
 {source : '血友病', target : '张建勇', weight : 0.919253726660445, name: '0.9121474958537327'},
 {source : '李彦宏', target : '公敌', weight : 0.9639815138565971, name: '0.9007895369663672'},
 {source : '李彦宏', target : '血友病', weight : 0.9327102978734435, name: '0.9007895369663672'},
 {source : '李彦宏', target : '作恶', weight : 0.911882459011109, name: '0.9007895369663672'},
 {source : '李彦宏', target : '商业模式', weight : 0.9072887433591484, name: '0.9007895369663672'},
 {source : '李彦宏', target : '竞价排名', weight : 0.9025158326417058, name: '0.9007895369663672'},
 {source : '李彦宏', target : '百度', weight : 0.9007895369663672, name: '0.9007895369663672'},
 {source : '李彦宏', target : '包好', weight : 0.8971669270307079, name: '0.9007895369663672'},
 {source : '李彦宏', target : '广告费', weight : 0.8932924258744873, name: '0.9007895369663672'},
 {source : '李彦宏', target : '王卫', weight : 0.8932314309052822, name: '0.9007895369663672'},
 {source : '李彦宏', target : '铝型材', weight : 0.8920647341359058, name: '0.9007895369663672'},
 {source : '运营者', target : '血友病', weight : 0.919208126093494, name: '0.8987562174031793'},
 {source : '运营者', target : '莆田', weight : 0.9075916842469133, name: '0.8987562174031793'},
 {source : '运营者', target : '百度', weight : 0.8987562174031793, name: '0.8987562174031793'},
 {source : '运营者', target : '医疗广告', weight : 0.8859257232481841, name: '0.8987562174031793'},
 {source : '运营者', target : '运营权', weight : 0.8808398874660576, name: '0.8987562174031793'},
 {source : '运营者', target : '竞价排名', weight : 0.8772678846755102, name: '0.8987562174031793'},
 {source : '运营者', target : '制鞋业', weight : 0.8757170144074548, name: '0.8987562174031793'},
 {source : '运营者', target : '李彦宏', weight : 0.8660943533310013, name: '0.8987562174031793'},
 {source : '运营者', target : '假鞋', weight : 0.8618860234760167, name: '0.8987562174031793'},
 {source : '运营者', target : '分辨真假', weight : 0.8613499889791031, name: '0.8987562174031793'},
 {source : '竞价排名', target : '血友病', weight : 0.9776929352460503, name: '0.8786240061777942'},
 {source : '竞价排名', target : '莆田', weight : 0.9705788632787969, name: '0.8786240061777942'},
 {source : '竞价排名', target : '制鞋业', weight : 0.9634686131260302, name: '0.8786240061777942'},
 {source : '竞价排名', target : '卖假', weight : 0.942890741602585, name: '0.8786240061777942'},
 {source : '竞价排名', target : '假鞋', weight : 0.9388280749604816, name: '0.8786240061777942'},
 {source : '竞价排名', target : '医疗广告', weight : 0.9365800991364249, name: '0.8786240061777942'},
 {source : '竞价排名', target : '疾病相关', weight : 0.9353271594162811, name: '0.8786240061777942'},
 {source : '竞价排名', target : '广告费', weight : 0.9348141235946376, name: '0.8786240061777942'},
 {source : '竞价排名', target : '包好', weight : 0.9309554769501571, name: '0.8786240061777942'},
 {source : '竞价排名', target : '分辨真假', weight : 0.9244714295574873, name: '0.8786240061777942'},
 {source : '运营权', target : '血友病', weight : 0.9272893746550295, name: '0.8757806767615945'},
 {source : '运营权', target : '之恶', weight : 0.9151191844286038, name: '0.8757806767615945'},
 {source : '运营权', target : '莆田', weight : 0.9146147098378584, name: '0.8757806767615945'},
 {source : '运营权', target : '竞价排名', weight : 0.903274554894556, name: '0.8757806767615945'},
 {source : '运营权', target : '运营者', weight : 0.8808398874660576, name: '0.8757806767615945'},
 {source : '运营权', target : '百度', weight : 0.8757806767615945, name: '0.8757806767615945'},
 {source : '运营权', target : '燕小冰', weight : 0.8545224249179242, name: '0.8757806767615945'},
 {source : '运营权', target : '李彦宏', weight : 0.842045856167658, name: '0.8757806767615945'},
 {source : '运营权', target : '医疗广告', weight : 0.8418661134452762, name: '0.8757806767615945'},
 {source : '运营权', target : '制鞋业', weight : 0.8358221066436575, name: '0.8757806767615945'},
 {source : '莆田', target : '血友病', weight : 0.9724692015760514, name: '0.8753505918749714'},
 {source : '莆田', target : '竞价排名', weight : 0.9705788632787969, name: '0.8753505918749714'},
 {source : '莆田', target : '制鞋业', weight : 0.9661687412398564, name: '0.8753505918749714'},
 {source : '莆田', target : '假鞋', weight : 0.9586187598128602, name: '0.8753505918749714'},
 {source : '莆田', target : '医疗广告', weight : 0.9537409344013285, name: '0.8753505918749714'},
 {source : '莆田', target : '分辨真假', weight : 0.939121064048518, name: '0.8753505918749714'},
 {source : '莆田', target : '广告费', weight : 0.9272591001880007, name: '0.8753505918749714'},
 {source : '莆田', target : '卖假', weight : 0.9204591820139062, name: '0.8753505918749714'},
 {source : '莆田', target : '赚黑心钱', weight : 0.9182002478746023, name: '0.8753505918749714'},
 {source : '莆田', target : '包好', weight : 0.9151000185757112, name: '0.8753505918749714'},
 {source : '公敌', target : '李彦宏', weight : 0.9639815138565971, name: '0.8713237736649877'},
 {source : '公敌', target : '血友病', weight : 0.9010091064360586, name: '0.8713237736649877'},
 {source : '公敌', target : '王卫', weight : 0.8936374338140652, name: '0.8713237736649877'},
 {source : '公敌', target : '商业模式', weight : 0.8861799854731082, name: '0.8713237736649877'},
 {source : '公敌', target : '竞价排名', weight : 0.8855992280869376, name: '0.8713237736649877'},
 {source : '公敌', target : '铝型材', weight : 0.8736220122902459, name: '0.8713237736649877'},
 {source : '公敌', target : '百度', weight : 0.8713237736649877, name: '0.8713237736649877'},
 {source : '公敌', target : '包好', weight : 0.8683684453144955, name: '0.8713237736649877'},
 {source : '公敌', target : '王卫恐', weight : 0.8660207884439106, name: '0.8713237736649877'},
 {source : '公敌', target : '卖假', weight : 0.8659680304984794, name: '0.8713237736649877'},
 {source : '血友', target : '种类', weight : 0.944283489370927, name: '0.8635501619749056'},
 {source : '血友', target : '血友病', weight : 0.8833458356799749, name: '0.8635501619749056'},
 {source : '血友', target : '竞价排名', weight : 0.8688600731855008, name: '0.8635501619749056'},
 {source : '血友', target : '百度', weight : 0.8635501619749056, name: '0.8635501619749056'},
 {source : '血友', target : '之恶', weight : 0.8494416003804669, name: '0.8635501619749056'},
 {source : '血友', target : '公敌', weight : 0.8431860316061743, name: '0.8635501619749056'},
 {source : '血友', target : '莆田', weight : 0.8408417903831481, name: '0.8635501619749056'},
 {source : '血友', target : '医美', weight : 0.8202949471554275, name: '0.8635501619749056'},
 {source : '血友', target : '李彦宏', weight : 0.8172126954755142, name: '0.8635501619749056'},
 {source : '血友', target : '制鞋业', weight : 0.8146193384933046, name: '0.8635501619749056'},
 {source : '快播', target : '克东', weight : 0.9544963229175246, name: '0.8495737515318134'},
 {source : '快播', target : '公诉人', weight : 0.946970759618232, name: '0.8495737515318134'},
 {source : '快播', target : '王欣', weight : 0.9342314835538839, name: '0.8495737515318134'},
 {source : '快播', target : '微软', weight : 0.8974864403811567, name: '0.8495737515318134'},
 {source : '快播', target : '淫秽', weight : 0.8890575239298184, name: '0.8495737515318134'},
 {source : '快播', target : '免费软件', weight : 0.8758821541719117, name: '0.8495737515318134'},
 {source : '快播', target : '辩护人', weight : 0.8680524204277758, name: '0.8495737515318134'},
 {source : '快播', target : '魅族', weight : 0.8601352647133256, name: '0.8495737515318134'},
 {source : '快播', target : '播放器', weight : 0.8558780236297544, name: '0.8495737515318134'},
 {source : '快播', target : '删帖', weight : 0.851785253428784, name: '0.8495737515318134'},
 {source : '制鞋业', target : '假鞋', weight : 0.9768089707017656, name: '0.8484793603085964'},
 {source : '制鞋业', target : '莆田', weight : 0.9661687412398564, name: '0.8484793603085964'},
 {source : '制鞋业', target : '卖假', weight : 0.9654922668386112, name: '0.8484793603085964'},
 {source : '制鞋业', target : '分辨真假', weight : 0.9652633632286479, name: '0.8484793603085964'},
 {source : '制鞋业', target : '竞价排名', weight : 0.9634686131260302, name: '0.8484793603085964'},
 {source : '制鞋业', target : '包好', weight : 0.9507071163414921, name: '0.8484793603085964'},
 {source : '制鞋业', target : '血友病', weight : 0.9501951871441623, name: '0.8484793603085964'},
 {source : '制鞋业', target : '广告费', weight : 0.9492950168268364, name: '0.8484793603085964'},
 {source : '制鞋业', target : '医疗广告', weight : 0.9467641364793332, name: '0.8484793603085964'},
 {source : '制鞋业', target : '三家', weight : 0.943586714482768, name: '0.8484793603085964'},


			
			]
			}]};
			treeChart.setOption(option);
			
			treeChart.hideLoading();
        }
    </script>