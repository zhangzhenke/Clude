<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myCloud云网盘</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/nav.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<link rel="stylesheet" href="../static/css/typo.css"  th:href="@{/css/typo.css}">
	<link rel="stylesheet" href="../static/css/me.css" th:href="@{/css/me.css}">
</head>
<body>
<!--导航-->
	<div id="top-image">
		<div class="m-paddmax-little m-midding " style="margin-left: 95%;margin-top: 300px">
			<div class="ui vertical icon buttons ">
				<a class="ui toc teal button" href="${pageContext.request.contextPath}/login">
					<div>登陆</div>
				</a>
				<a class="ui teal button" href="${pageContext.request.contextPath}/login#toregister">
					<div>注冊</div>
				</a>
				<a class="ui wechat icon  button" href="${pageContext.request.contextPath}/searchUserfile">
					<div>主页</div>
				</a>
				<a class="ui teal button" href="${pageContext.request.contextPath}/help">
					<div>Help</div>
				</a>
			</div>
		</div>
		<div id="content" class="container center-block" style="margin-top: -420px">
			<div class="jumbotron">
				<div class="container">
					<h1>Ourcloud</h1>
					<p>这是一个兴趣使然的团队共享网盘。欢迎保存和分享。</p>
					<form action="${pageContext.request.contextPath}/searchFile"
						method="post">
						<div class="input-group input-group-lg">
							<span class="input-group-addon" id="sizing-addon1"><span
								class="glyphicon glyphicon-plus" aria-hidden="true"></span></span> <input
								type="text" name="searchcontent" class="form-control"
								placeholder="输入关键词" aria-describedby="sizing-addon1" /> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit">搜 索</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




    <script src="js/jquery.min.js"></script>
	<script src="js/ios-parallax.js"></script>
	<script src="js/nav.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#top-image').iosParallax({
				movementFactor : 50
			});
		});
	</script>

</body>
</html>