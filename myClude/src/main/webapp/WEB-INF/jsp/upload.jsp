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
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的iCloud</title>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="../../static/css/OBS.css" th:href="@{/css/OBS.css}">
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
            <h2 class="ui teal header item">华为云OBS存储</h2>
        </div>
    </div>
</nav>



<div class="box" style="width: 600px;height: 400px;margin-left: 28%;margin-top: 40px">
    <br>
    <br>
    <div class="box1" style="width: 80%;height: 80%;margin-left: 10%">
        <br><br>
        <div class="box2" style="margin-left: 10%;margin-right: 10%;height: 80%">
            <i class="file icon"></i>
            <form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
                <br>
                <input class="ui input focus" type="file" onchange="checkfile()" id="fileupload" name="file"
                       onpropertychange="getFileSize(this.value)"/><br/>
                <br>
                <input type="hidden" name="username" value="${user_name}"/><br/>
                <input type="hidden" name="MD5" id="md5"/>
                 <img id="tempimg" dynsrc="" src="" style="display:none"/>  
                ${message }
                <div id="box"></div>
                <button class="ui  mini yellow button" id="cal" type="button" onclick="calculate()">急速上传</button>
                <input type="submit" class="ui mini teal button" onclick="return checkfile()" value="上传文件"/>
            </form>
        </div>
    </div>
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

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/spark-md5.js"></script>

<script type="text/javascript">
    var vipmaxsize = 50 * 1024 * 1024;
    var normalmaxsize = 20 * 1024 * 1024;
    var viperrMsg = "VIP用户上传的附件文件不能超过50M！！！";
    var normalerrMsg = "普通用户上传的附件文件不能超过20M！！！";
    var tipMsg = "建议使用chrome firefox ie等浏览器";
    var browserCfg = {};
    //下面一段鉴别使用者的浏览器
    var ua = window.navigator.userAgent;
    if (ua.indexOf("MSIE") >= 1) {
        browserCfg.ie = true;
    } else if (ua.indexOf("Firefox") >= 1) {
        browserCfg.firefox = true;
    } else if (ua.indexOf("Chrome") >= 1) {
        browserCfg.chrome = true;
    }

    function checkfile() {
        try {
            var obj_file = document.getElementById("fileupload");
            var isvip = ${isvip};
            if (obj_file.value == "") {
                alert("请先选择上传文件");
                return;
            }
            var filesize = 0;
            if (browserCfg.firefox || browserCfg.chrome) {
                filesize = obj_file.files[0].size;  //chrome等浏览器支持这个方法拿到文件大小
            } else if (browserCfg.ie) {
                var obj_img = document.getElementById('tempimg');
                obj_img.dynsrc = obj_file.value;
                filesize = obj_img.fileSize;
            } else {
                alert(tipMsg);
                return false;
            }
            if (filesize == -1) {
                alert(tipMsg);
                return false;
            } else if (isvip == 1 && filesize > vipmaxsize) {
                alert(viperrMsg);
                return false;
            } else if (isvip == 0 && filesize > normalmaxsize) {
                alert(normalerrMsg);
                return false;
            } else {
                return true;
            }
        } catch (e) {
            alert(e);
            return false;
        }
    }
</script>
</html>
