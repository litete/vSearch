<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="css/sticky-footer-navbar.css" type="text/css" rel="stylesheet">    
	<title>微搜搜索</title>

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
            <a class="navbar-brand" href="#">微搜</a>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="vsearch.jsp">v搜索</a></li>
              <li><a href="#">v头条</a></li>
              <li><a href="marketing">v营销</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="#" style="color:#337ab7">消息</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </div>
    </div>
    <div class="container">
        <div id="img" style="margin-bottom:10px;margin-left:-10px;text-align: center;">
        	<img id="s_lg_img" src="img/logo2.gif" width=40% height=40%>
        </div>
	    <form class="form-inline" action="/vSearch/search">
		  <div class="form-group row" style="margin-left:10%;text-align: center;">
		    <div class="input-group col-lg-6">
		      <input type="text" class="form-control" style="width:500px" id="word" name = "word">
		    </div>
		  </div>
		  <input type="submit" class="btn btn-primary" style="width:100px"  value="搜索">
		</form>
    </div>
    
    <div id="footer">
      <div class="container">
        <p class="text-muted" style="float:right">数据合作 | 关于我们</p>
      </div>
    </div>
 <script src="js/bootstrap.min.js"></script>
</body>
<script>
	function showSearch(){
		window.location.href="vsearch.jsp";
	}
</script>
</html>