<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="css/sticky-footer-navbar.css" type="text/css" rel="stylesheet">
    <link rel="icon" href="img/f.ico" mce_href="img/f.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/f.ico" mce_href="img/f.ico" type="image/x-icon">
    <link rel="bookmark" href="img/f.ico" mce_href="img/f.ico" type="image/x-icon">    
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
           <a href="index"> <img src="img/deepSearch_logo_s.png"  class="navbar-brand"></a>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="search?word=${keyword}">搜索</a></li>
              <li><a href="knowledge?word=${keyword}">知识</a></li>
              <li><a href="toutiao?word=${keyword}">头条</a></li>
              <li><a href="marketing?word=${keyword}">营销</a></li>

            </ul>
       <!--      <form class="navbar-form" action="/vSearch/search">
		   <input type="text" class="form-control" style="width:420px" id="word" name="word" placeholder="${keyword}"> <button type="submit" class="btn btn-primary" style="width:100px" >搜索</button>
	 </form>
          -->
		 
          </div><!--/.nav-collapse -->
          <div>
         
          </div>
        </div><!--/.container-fluid -->
      </div>
    </div>
    <div class="container">
        <div id="img" style="margin-bottom:10px;margin-left:-10px;text-align: center;">
        	<img id="s_lg_img" src="img/deepSearch_logo_index.png">
        </div>
	    <form class="form-inline" action="/vSearch/search"style=" margin:0 auto; text-align:center;">
		  <div class="form-group" >
		      <input type="text" class="form-control" style="width:450px" id="word" name = "word">
		    </div>
            <input type="submit" class="btn btn-primary " style="width:100px;"  value="搜索">
         
            </div>
		  </div>
		 
		</form>
		<div style="text-align:center">
<img src="img/kw_network.png" style="margin-top:50px;" >
</div>
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