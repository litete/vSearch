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
			
			{category:0, name: '马云', value : 1, label: '马云'},
{category:1, name: '躲雨', value : 0.8686449344807319},
{category:1, name: '亿天', value : 0.8203019086943967},
{category:1, name: '流出', value : 0.8195408349668011},
{category:1, name: '绩效', value : 0.8182398266858965},
{category:1, name: '阿里', value : 0.8116046935877536},
{category:1, name: '务虚', value : 0.8003453222118746},
{category:1, name: '支付宝', value : 0.799451172832355},
{category:1, name: '组织变革', value : 0.7927770816005555},
{category:1, name: '涨价', value : 0.7861767033281557},
{category:1, name: '讨薪', value : 0.7849729962714193},
{category:2, name: '组织变革', value : 0.9206881778924254},
{category:2, name: '务虚', value : 0.9125613353823253},
{category:2, name: '形势', value : 0.888586207413046},
{category:2, name: '实体', value : 0.8725536018043313},
{category:2, name: '兼并', value : 0.8705369085328436},
{category:2, name: '重组', value : 0.8686634855236269},
{category:2, name: '马云', value : 0.8686449344807319},
{category:2, name: '流出', value : 0.8633364944306704},
{category:2, name: '明斯基', value : 0.8564068969544656},
{category:2, name: '供给', value : 0.8374904021081562},
{category:2, name: '李彦宏', value : 0.8791615032417498},
{category:2, name: '已达家', value : 0.8638639653762483},
{category:2, name: '存管', value : 0.8559744225968151},
{category:2, name: '公敌', value : 0.8558136252984396},
{category:2, name: '马化腾', value : 0.8480446318660037},
{category:2, name: '麻袋', value : 0.8448565014728399},
{category:2, name: '希冀', value : 0.8423229074746552},
{category:2, name: '血友病', value : 0.8336505723463032},
{category:2, name: '银联', value : 0.8285138148949405},
{category:2, name: '广告主', value : 0.8274108595411126},
{category:2, name: '多交', value : 0.9514161249030834},
{category:2, name: '利润', value : 0.8927614188956813},
{category:2, name: '兼并', value : 0.8825638411094896},
{category:2, name: '形势', value : 0.878120278997614},
{category:2, name: '重组', value : 0.8761331914097461},
{category:2, name: '务虚', value : 0.8760852675054897},
{category:2, name: '组织变革', value : 0.8662838179979121},
{category:2, name: '躲雨', value : 0.8633364944306704},
{category:2, name: '利润表', value : 0.8627587213378365},
{category:2, name: '价外', value : 0.8619690811048324},
{category:2, name: '希冀', value : 0.8776588428187786},
{category:2, name: '黄页', value : 0.8775417433736572},
{category:2, name: '李传章', value : 0.8730293739458328},
{category:2, name: '讨薪', value : 0.8650685662639003},
{category:2, name: '创业者', value : 0.8533777362541957},
{category:2, name: '精简', value : 0.8531350006692765},
{category:2, name: '企业', value : 0.8499393456713614},
{category:2, name: '孵化器', value : 0.8487263927476586},
{category:2, name: '批量生产', value : 0.8485522266518496},
{category:2, name: '马靖昊', value : 0.8466663605342925},
{category:2, name: '电商', value : 0.8331384982635412},
{category:2, name: '程序员', value : 0.8211221486845734},
{category:2, name: '马云', value : 0.8116046935877536},
{category:2, name: '载体', value : 0.8107228708685651},
{category:2, name: '薪资', value : 0.8091296210362379},
{category:2, name: '环时', value : 0.7993662868390199},
{category:2, name: '绩效', value : 0.7951778884249581},
{category:2, name: '张小龙', value : 0.7872605304808641},
{category:2, name: '冰玉', value : 0.7842844034003226},
{category:2, name: '代理', value : 0.7796743373980991},
{category:2, name: '组织变革', value : 0.9790607821878143},
{category:2, name: '形势', value : 0.9402881689894855},
{category:2, name: '一个亿', value : 0.9206602006972684},
{category:2, name: '效率', value : 0.9173859643796508},
{category:2, name: '庞氏', value : 0.9127271744283564},
{category:2, name: '躲雨', value : 0.9125613353823253},
{category:2, name: '趋势', value : 0.9102535174225598},
{category:2, name: '重组', value : 0.9091549050310617},
{category:2, name: '连锁反应', value : 0.8987566060371437},
{category:2, name: '兼并', value : 0.8971064265984083},
{category:2, name: '放出', value : 0.9190327209213497},
{category:2, name: '敬业', value : 0.9178199684296597},
{category:2, name: '福卡', value : 0.9041362575256582},
{category:2, name: '钱方', value : 0.8868845291868831},
{category:2, name: '银联', value : 0.8764614327582867},
{category:2, name: '平分', value : 0.8757883305951157},
{category:2, name: '新加位', value : 0.8749882454969886},
{category:2, name: '集齐', value : 0.8591638265441145},
{category:2, name: '五福', value : 0.858450131134446},
{category:2, name: '福保', value : 0.8566737145853829},
{category:2, name: '务虚', value : 0.9790607821878143},
{category:2, name: '重组', value : 0.9311207905546575},
{category:2, name: '形势', value : 0.9302175598450286},
{category:2, name: '效率', value : 0.925790276009546},
{category:2, name: '兼并', value : 0.9251177006278525},
{category:2, name: '一个亿', value : 0.9239407254179705},
{category:2, name: '躲雨', value : 0.9206881778924254},
{category:2, name: '连锁反应', value : 0.9168601254278615},
{category:2, name: '工资福利', value : 0.91625298001721},
{category:2, name: '趋势', value : 0.913447271142655},
{category:2, name: '万亿', value : 0.9054569107322804},
{category:2, name: '现金流', value : 0.8910170331918018},
{category:2, name: '刚需', value : 0.8904916925493932},
{category:2, name: '信贷', value : 0.8855898727067681},
{category:2, name: '吴恩福', value : 0.8779095483777445},
{category:2, name: '供求', value : 0.8769829579746539},
{category:2, name: '股息', value : 0.8744046999998446},
{category:2, name: '需求', value : 0.8723384940242505},
{category:2, name: '组织变革', value : 0.8721194691699982},
{category:2, name: '供给', value : 0.8713441977148357},
{category:2, name: '讨要', value : 0.9565431719977707},
{category:2, name: '工资总额', value : 0.9546090366426797},
{category:2, name: '包工头', value : 0.9456365568683446},
{category:2, name: '六成', value : 0.9449064219431793},
{category:2, name: '欠薪', value : 0.9419390808631931},
{category:2, name: '拖欠', value : 0.9326575563246963},
{category:2, name: '偏高五险', value : 0.9286820006492117},
{category:2, name: '农民工', value : 0.9286189261338688},
{category:2, name: '马凯', value : 0.9268474590119998},
{category:2, name: '工头', value : 0.9229370612401763},


			
			],
			links:[
			
			 {source : '马云', target : '躲雨', weight : 0.8686449344807319, name: '0.8686449344807319'},
 {source : '马云', target : '亿天', weight : 0.8203019086943967, name: '0.8203019086943967'},
 {source : '马云', target : '流出', weight : 0.8195408349668011, name: '0.8195408349668011'},
 {source : '马云', target : '绩效', weight : 0.8182398266858965, name: '0.8182398266858965'},
 {source : '马云', target : '阿里', weight : 0.8116046935877536, name: '0.8116046935877536'},
 {source : '马云', target : '务虚', weight : 0.8003453222118746, name: '0.8003453222118746'},
 {source : '马云', target : '支付宝', weight : 0.799451172832355, name: '0.799451172832355'},
 {source : '马云', target : '组织变革', weight : 0.7927770816005555, name: '0.7927770816005555'},
 {source : '马云', target : '涨价', weight : 0.7861767033281557, name: '0.7861767033281557'},
 {source : '马云', target : '讨薪', weight : 0.7849729962714193, name: '0.7849729962714193'},
 {source : '躲雨', target : '组织变革', weight : 0.9206881778924254, name: '0.8686449344807319'},
 {source : '躲雨', target : '务虚', weight : 0.9125613353823253, name: '0.8686449344807319'},
 {source : '躲雨', target : '形势', weight : 0.888586207413046, name: '0.8686449344807319'},
 {source : '躲雨', target : '实体', weight : 0.8725536018043313, name: '0.8686449344807319'},
 {source : '躲雨', target : '兼并', weight : 0.8705369085328436, name: '0.8686449344807319'},
 {source : '躲雨', target : '重组', weight : 0.8686634855236269, name: '0.8686449344807319'},
 {source : '躲雨', target : '马云', weight : 0.8686449344807319, name: '0.8686449344807319'},
 {source : '躲雨', target : '流出', weight : 0.8633364944306704, name: '0.8686449344807319'},
 {source : '躲雨', target : '明斯基', weight : 0.8564068969544656, name: '0.8686449344807319'},
 {source : '躲雨', target : '供给', weight : 0.8374904021081562, name: '0.8686449344807319'},
 {source : '亿天', target : '李彦宏', weight : 0.8791615032417498, name: '0.8203019086943967'},
 {source : '亿天', target : '已达家', weight : 0.8638639653762483, name: '0.8203019086943967'},
 {source : '亿天', target : '存管', weight : 0.8559744225968151, name: '0.8203019086943967'},
 {source : '亿天', target : '公敌', weight : 0.8558136252984396, name: '0.8203019086943967'},
 {source : '亿天', target : '马化腾', weight : 0.8480446318660037, name: '0.8203019086943967'},
 {source : '亿天', target : '麻袋', weight : 0.8448565014728399, name: '0.8203019086943967'},
 {source : '亿天', target : '希冀', weight : 0.8423229074746552, name: '0.8203019086943967'},
 {source : '亿天', target : '血友病', weight : 0.8336505723463032, name: '0.8203019086943967'},
 {source : '亿天', target : '银联', weight : 0.8285138148949405, name: '0.8203019086943967'},
 {source : '亿天', target : '广告主', weight : 0.8274108595411126, name: '0.8203019086943967'},
 {source : '流出', target : '多交', weight : 0.9514161249030834, name: '0.8195408349668011'},
 {source : '流出', target : '利润', weight : 0.8927614188956813, name: '0.8195408349668011'},
 {source : '流出', target : '兼并', weight : 0.8825638411094896, name: '0.8195408349668011'},
 {source : '流出', target : '形势', weight : 0.878120278997614, name: '0.8195408349668011'},
 {source : '流出', target : '重组', weight : 0.8761331914097461, name: '0.8195408349668011'},
 {source : '流出', target : '务虚', weight : 0.8760852675054897, name: '0.8195408349668011'},
 {source : '流出', target : '组织变革', weight : 0.8662838179979121, name: '0.8195408349668011'},
 {source : '流出', target : '躲雨', weight : 0.8633364944306704, name: '0.8195408349668011'},
 {source : '流出', target : '利润表', weight : 0.8627587213378365, name: '0.8195408349668011'},
 {source : '流出', target : '价外', weight : 0.8619690811048324, name: '0.8195408349668011'},
 {source : '绩效', target : '希冀', weight : 0.8776588428187786, name: '0.8182398266858965'},
 {source : '绩效', target : '黄页', weight : 0.8775417433736572, name: '0.8182398266858965'},
 {source : '绩效', target : '李传章', weight : 0.8730293739458328, name: '0.8182398266858965'},
 {source : '绩效', target : '讨薪', weight : 0.8650685662639003, name: '0.8182398266858965'},
 {source : '绩效', target : '创业者', weight : 0.8533777362541957, name: '0.8182398266858965'},
 {source : '绩效', target : '精简', weight : 0.8531350006692765, name: '0.8182398266858965'},
 {source : '绩效', target : '企业', weight : 0.8499393456713614, name: '0.8182398266858965'},
 {source : '绩效', target : '孵化器', weight : 0.8487263927476586, name: '0.8182398266858965'},
 {source : '绩效', target : '批量生产', weight : 0.8485522266518496, name: '0.8182398266858965'},
 {source : '绩效', target : '马靖昊', weight : 0.8466663605342925, name: '0.8182398266858965'},
 {source : '阿里', target : '电商', weight : 0.8331384982635412, name: '0.8116046935877536'},
 {source : '阿里', target : '程序员', weight : 0.8211221486845734, name: '0.8116046935877536'},
 {source : '阿里', target : '马云', weight : 0.8116046935877536, name: '0.8116046935877536'},
 {source : '阿里', target : '载体', weight : 0.8107228708685651, name: '0.8116046935877536'},
 {source : '阿里', target : '薪资', weight : 0.8091296210362379, name: '0.8116046935877536'},
 {source : '阿里', target : '环时', weight : 0.7993662868390199, name: '0.8116046935877536'},
 {source : '阿里', target : '绩效', weight : 0.7951778884249581, name: '0.8116046935877536'},
 {source : '阿里', target : '张小龙', weight : 0.7872605304808641, name: '0.8116046935877536'},
 {source : '阿里', target : '冰玉', weight : 0.7842844034003226, name: '0.8116046935877536'},
 {source : '阿里', target : '代理', weight : 0.7796743373980991, name: '0.8116046935877536'},
 {source : '务虚', target : '组织变革', weight : 0.9790607821878143, name: '0.8003453222118746'},
 {source : '务虚', target : '形势', weight : 0.9402881689894855, name: '0.8003453222118746'},
 {source : '务虚', target : '一个亿', weight : 0.9206602006972684, name: '0.8003453222118746'},
 {source : '务虚', target : '效率', weight : 0.9173859643796508, name: '0.8003453222118746'},
 {source : '务虚', target : '庞氏', weight : 0.9127271744283564, name: '0.8003453222118746'},
 {source : '务虚', target : '躲雨', weight : 0.9125613353823253, name: '0.8003453222118746'},
 {source : '务虚', target : '趋势', weight : 0.9102535174225598, name: '0.8003453222118746'},
 {source : '务虚', target : '重组', weight : 0.9091549050310617, name: '0.8003453222118746'},
 {source : '务虚', target : '连锁反应', weight : 0.8987566060371437, name: '0.8003453222118746'},
 {source : '务虚', target : '兼并', weight : 0.8971064265984083, name: '0.8003453222118746'},
 {source : '支付宝', target : '放出', weight : 0.9190327209213497, name: '0.799451172832355'},
 {source : '支付宝', target : '敬业', weight : 0.9178199684296597, name: '0.799451172832355'},
 {source : '支付宝', target : '福卡', weight : 0.9041362575256582, name: '0.799451172832355'},
 {source : '支付宝', target : '钱方', weight : 0.8868845291868831, name: '0.799451172832355'},
 {source : '支付宝', target : '银联', weight : 0.8764614327582867, name: '0.799451172832355'},
 {source : '支付宝', target : '平分', weight : 0.8757883305951157, name: '0.799451172832355'},
 {source : '支付宝', target : '新加位', weight : 0.8749882454969886, name: '0.799451172832355'},
 {source : '支付宝', target : '集齐', weight : 0.8591638265441145, name: '0.799451172832355'},
 {source : '支付宝', target : '五福', weight : 0.858450131134446, name: '0.799451172832355'},
 {source : '支付宝', target : '福保', weight : 0.8566737145853829, name: '0.799451172832355'},
 {source : '组织变革', target : '务虚', weight : 0.9790607821878143, name: '0.7927770816005555'},
 {source : '组织变革', target : '重组', weight : 0.9311207905546575, name: '0.7927770816005555'},
 {source : '组织变革', target : '形势', weight : 0.9302175598450286, name: '0.7927770816005555'},
 {source : '组织变革', target : '效率', weight : 0.925790276009546, name: '0.7927770816005555'},
 {source : '组织变革', target : '兼并', weight : 0.9251177006278525, name: '0.7927770816005555'},
 {source : '组织变革', target : '一个亿', weight : 0.9239407254179705, name: '0.7927770816005555'},
 {source : '组织变革', target : '躲雨', weight : 0.9206881778924254, name: '0.7927770816005555'},
 {source : '组织变革', target : '连锁反应', weight : 0.9168601254278615, name: '0.7927770816005555'},
 {source : '组织变革', target : '工资福利', weight : 0.91625298001721, name: '0.7927770816005555'},
 {source : '组织变革', target : '趋势', weight : 0.913447271142655, name: '0.7927770816005555'},
 {source : '涨价', target : '万亿', weight : 0.9054569107322804, name: '0.7861767033281557'},
 {source : '涨价', target : '现金流', weight : 0.8910170331918018, name: '0.7861767033281557'},
 {source : '涨价', target : '刚需', weight : 0.8904916925493932, name: '0.7861767033281557'},
 {source : '涨价', target : '信贷', weight : 0.8855898727067681, name: '0.7861767033281557'},
 {source : '涨价', target : '吴恩福', weight : 0.8779095483777445, name: '0.7861767033281557'},
 {source : '涨价', target : '供求', weight : 0.8769829579746539, name: '0.7861767033281557'},
 {source : '涨价', target : '股息', weight : 0.8744046999998446, name: '0.7861767033281557'},
 {source : '涨价', target : '需求', weight : 0.8723384940242505, name: '0.7861767033281557'},
 {source : '涨价', target : '组织变革', weight : 0.8721194691699982, name: '0.7861767033281557'},
 {source : '涨价', target : '供给', weight : 0.8713441977148357, name: '0.7861767033281557'},
 {source : '讨薪', target : '讨要', weight : 0.9565431719977707, name: '0.7849729962714193'},
 {source : '讨薪', target : '工资总额', weight : 0.9546090366426797, name: '0.7849729962714193'},
 {source : '讨薪', target : '包工头', weight : 0.9456365568683446, name: '0.7849729962714193'},
 {source : '讨薪', target : '六成', weight : 0.9449064219431793, name: '0.7849729962714193'},
 {source : '讨薪', target : '欠薪', weight : 0.9419390808631931, name: '0.7849729962714193'},
 {source : '讨薪', target : '拖欠', weight : 0.9326575563246963, name: '0.7849729962714193'},
 {source : '讨薪', target : '偏高五险', weight : 0.9286820006492117, name: '0.7849729962714193'},
 {source : '讨薪', target : '农民工', weight : 0.9286189261338688, name: '0.7849729962714193'},
 {source : '讨薪', target : '马凯', weight : 0.9268474590119998, name: '0.7849729962714193'},
 {source : '讨薪', target : '工头', weight : 0.9229370612401763, name: '0.7849729962714193'},


			
			]
			}]};
			treeChart.setOption(option);
			
			treeChart.hideLoading();
        }
    </script>