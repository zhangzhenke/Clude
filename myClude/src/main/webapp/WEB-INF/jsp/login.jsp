<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xpu云盘登录</title>
	<link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	<link rel="stylesheet" href="../static/lib/tocbot/tocbot.css" th:href="@{/lib/tocbot/tocbot.css}">
	<link rel="stylesheet" href="../static/lib/prism/prism.css" th:href="@{/lib/prism/prism.css}"><!--代码高亮-->
	<link rel="stylesheet" href="../static/css/typo.css"  th:href="@{/css/typo.css}">
	<link rel="stylesheet" href="../static/css/me.css" th:href="@{/css/me.css}">

<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/style4.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
</head>
<body>

<!--导航-->
<nav class="ui inverted  segment m-padded-tb-mini m-shadow-smail" >
	<div class="m-mobile-show m-right-top ">
		<a href="#" class="ui menu toggle black button icon " >
			<i class="sidebar icon ">

			</i>
		</a>
	</div>
	<div class="ui container">
		<div class="ui  inverted secondary stackable menu">
			<h2 class="ui teal header item">Ourcloud</h2>
			<a href="index.html" th:href="@{/}"  class="m-item item m-moblie-hide"><i class="home icon"></i>关于网盘</a>
			<a href="class.html" th:href="@{/admin}" class="m-item item m-moblie-hide"><i class="idea icon"></i>帮助文档</a>
	</div>
	</div>
</nav>
<!--登录-->
<div id="container_demo" >
	<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
	<a class="hiddenanchor" id="toregister"></a>
	<a class="hiddenanchor" id="tologin"></a>
	<div id="wrapper">
		<div id="login" class="animate form">
			<form  action="${pageContext.request.contextPath}/login"
			method="POST" autocomplete="on"> 
				<h1>登录</h1> 
				<p> 
					<label for="username" class="uname" data-icon="u" >您的邮箱或用户名</label>
					<input id="username" name="username" required="required" type="text" placeholder="用户名或邮箱"/>
				</p>
				<p> 
					<label for="password" class="youpasswd" data-icon="p">你的密码</label>
					<input id="password" name="password" required="required" type="password" placeholder="密码" />
				</p>
				<p class="keeplogin"> 
					<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
					<label for="loginkeeping">保持登录状态</label>
				</p>
				<p class="login button"> 
					<input type="submit" value="登录" /> 
				</p>
				<p class="change_link">
					想要开始?<a href="#toregister" class="to_register">注册</a>
				</p>
			</form>
		</div>

		<div id="register" class="animate form">
			<form  form action="${pageContext.request.contextPath}/register" method="post"  autocomplete="on">
				<h1>注册</h1> 
				<p> 
					<label for="usernamesignup" class="uname" data-icon="u">用户名</label>
					<input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="mysuperusername690" />
				</p>
				<p> 
					<label for="emailsignup" class="youmail" data-icon="e" >邮箱</label>
					<input id="emailsignup" name="emailsignup" required="required" type="email" placeholder="mysupermail@mail.com"/> 
				</p>
				<p> 
					<label for="passwordsignup" class="youpasswd" data-icon="p">密码</label>
					<input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="eg. X8df!90EO"/>
				</p>
				<p> 
					<label for="passwordsignup_confirm" class="youpasswd" data-icon="p">确认密码</label>
					<input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
				</p>
				<p class="signin button"> 
					<input type="submit" value="注册"/> 
				</p>
				<p class="change_link">  
					已经是成员?<a href="#tologin" class="to_register"> 去登录 </a>
				</p>
			</form>
		</div>
		
	</div>
	
</div>

</body>
</html>