<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="css/sticky-footer-navbar.css" type="text/css" rel="stylesheet"> 
    <link href="css/search.css" type="text/css" rel="stylesheet"> 
     <script src="js/bootstrap.min.js"></script>  
   <!--  <script type="text/javascript" src="js/echarts.min.js"></script>
    <script type="text/javascript" src="js/echarts.js" charset="utf-8"></script> -->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=zSmpaQashmu5iFucs5oOBMIPA8zSsn9S"></script></script>   <!-- 调用百度地图api -->
    <script src="js/jquery.js"></script>
	<title>深度搜索</title>
    
</head>
<body>
 <!-- Static navbar -->
  <div class="navbar navbar-default" role="navigation">
      <div class="container">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
           <a href="index.jsp"> <img src="img/deepSearch_logo_s.png"  class="navbar-brand"></a>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="search.jsp">搜索</a></li>
              <li><a href="knowledge.jsp">知识</a></li>
              <li><a href="topic.jsp">头条</a></li>
              <li><a href="marketing.jsp">营销</a></li>

            </ul>
        <form class="navbar-form" action="/vSearch/search">
		   <input type="text" class="form-control" style="width:420px" id="word" name="word" placeholder="${keyword}"> <button type="submit" class="btn btn-primary" style="width:100px" >搜索</button>
	 </form>
		 
          </div><!--/.nav-collapse -->
          <div>
         
          </div>
        </div><!--/.container-fluid -->
      </div>
    </div>
	<div class="container">
		<div class="col-lg-8" >
     	 <h3>分析结果</h3>
		 <div class="panel panel-default">
		 <!-- Table -->
		  <table class="table table-hover">
		     <tr>  
		        <th scope="col">序号</th>  
		        <th scope="col">关键字</th>  
		        <th scope="col">距离</th>  
		    </tr>
		     <tr>  
		        <td>1</td>
		        <td>sina.com.cn</td>  
		        <td>5</td>  
		     </tr> 
		      <tr>  
		   
		        <td>2</td>  
		        <td>sogou.com</td>  
		        <td>10</td>  
		     </tr> 
		     <tr>  
		        
		        <td>3</td>  
		        <td>tencent.com</td>  
		        <td>8</td>  
		     </tr> 
		  
		  </table>
		</div>
  	</div>
    
  
    <div class="cr-content col-lg-4" style="width:32%;margin-top:0%;" >
	    
	    <div class="row" style="width:100%"  style="position:relative;">
	        <div class="text-center">      
			     <div class="col-lg-9 text-center" >
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
	</div>
 	<div id="footer">
      <div class="container">
        <p class="text-muted" style="float:right">数据合作 | 关于我们</p>
      </div>
    </div>
    
    <script type="text/javascript">   /* 此处使用百度地图api 2.0 */
 		// 百度地图API功能
		var map = new BMap.Map("graph");    // 创建Map实例
		/* var mapStyle={  style : "mapbox" }  
		map.setMapStyle(mapStyle); */
		map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
		map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
		//map.setCurrentCity("北京");          // 设置地图显示的城市,此项是必须设置的
		var local = new BMap.LocalSearch(map, {
		    renderOptions:{map: map, autoViewport:true}
		});
		local.search("未来科技城");
		map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    </script>
 </body>

