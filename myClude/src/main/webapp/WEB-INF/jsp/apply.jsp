<%--
Created by IntelliJ IDEA.
User: 28571
Date: 2021/9/7
Time: 1:13
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>权限申请</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="../../static/css/box.css" th:href="@{/css/me.css}">
</head>
<body>
<!--导航-->
<nav class="ui inverted segment m-padded-tb-mini m-shadow-smailwithe " >
    <div class="m-mobile-show m-right-top ">
        <a href="#" class="ui menu toggle black button icon " >
            <i class="sidebar icon ">

            </i>
        </a>
    </div>
    <div class="ui container">
        <div class="ui  inverted secondary stackable menu">
            <h2 class="ui teal header item">协同，让工作更轻松</h2>
            <a href="${pageContext.request.contextPath}/searchUserfile" th:href="${pageContext.request.contextPath}/searchUserfile"  class="active m-item item m-moblie-hide"><i class="home icon"></i>返回主页</a>
        </div>
    </div>
</nav>


<!--后台消息提示-->
<c:if test="${message!=null}">
    <div class="ui success  message" unless="${strings.isEmpty(message)}">
        <i class="close icon"></i>
        <div class="header">提示：</div>
        <p text="在下方输入框中填写你的申请信息">${message}</p>
    </div>
</c:if>



<div class="box"  frame="border" style="width: 750px;height: 450px;margin-left: 25%;margin-top: 40px">
    <div class="box1" style="width: 40%;height: 100%">
        <br>

            <div class="box2" style="width: 80%;height: 80%;margin-left: 10%;margin-top: 10%">
                <br>
                <br>
                <br>
                <span>申请权限的范围如下</span>
                <span>需要填写你的姓名和权限范围</span>
                <span>备注选填</span>
                <br>
                <br>
                <div>
                    <li style="font-size: 16px;color: red">申请开通VIP</li>
                    <br>
                    <li style="font-size: 16px;color: green">申请成为管理员</li>
                    <br>
                    <li style="font-size: 16px;color: blue">申请文件删除权限</li>
                    <br>
                </div>
                <span>24小时内会审核你的权限申请</span>
            </div>
    </div>



    <div>
        <form  action="${pageContext.request.contextPath}/toapply" method="post" class="ui form"  autocomplete="on" style="margin-top: -400px;margin-left: 360px">
        <div class="field">
            <label for="applymanname">姓名</label>
            <input type="text" id="applymanname" name="applymanname" required="required" placeholder="输入姓名..."  style="width: 130px">
        </div>
            <div class="field">
                <label for="part" >岗位</label>
                <input type="text" id="part" name="part" required="required" placeholder="输入岗位..."  style="width: 130px">
            </div>
        <div class="field">
            <label for="applydesc" >权限类别</label>
            <input type="text" id="applydesc" name="applydesc"  required="required" placeholder="输入权限信息..." style="width: 130px">
        </div>

            <div class="field">
                <label for="comment" >备注</label>
                <input type="text" id="comment" name="comment" required="required" placeholder="输入备注..." style="width: 150px">
            </div>

        <button class="ui  teal button" type="submit">提交申请</button>
    </form></div>


</div>

<!--底部-->
<footer class="ui inverted  vertical segment m-paddmax" style="margin-top: 100px">
    <div class="ui center aligned container">
        <div class="ui inverted stackable divided grid">
            <div class="three wide column">
                <div class="ui inverted link list">
                    <div class="item">
                        <img src="./static/image/erweima.jpg"  th:src="@{/image/erweima.jpg}" class="ui rounded image" alt="" style="width: 110px">
                    </div>
                </div>
            </div>
            <div class="three wide column">
                <h4 CLASS="ui inverted header">西安工程大学</h4>
                <div class="ui inverted link list">
                    <a href="" class="item">【工程训练】</a>
                </div>
            </div>
            <div class="three wide column">
                <h4 CLASS="ui inverted header">联系我</h4>
                <div class="ui inverted link list">
                    <a href="" class="item">微信【hjj18891636438】</a>
                    <a href="" class="item">qq【2857154359】</a>
                </div>
            </div>
            <div class="seven wide column">
                <h4 CLASS="ui inverted header">ourcloud</h4>
                <p class="m-text-thin m-Text-sapcing m-opacity-mini">计算机科学与技术（卓越1801）03小组</p>
            </div>
        </div>
        <div class="ui inverted section divider"></div>
        <a href="http:49.232.127.127:8080/yinong">http:49.232.127.127:8080/yinong</a>
    </div>

</footer>

</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script>
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-moblie-hide')
    })
    $('.ui.dropdown').dropdown();
    //消息关闭
    $('.message .close')
        .on('click',function () {
            $(this).closest('.message').transition('fade');
        });

</script>
</html>