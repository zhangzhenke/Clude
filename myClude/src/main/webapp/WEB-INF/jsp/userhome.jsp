<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的iCloud</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="../static/lib/tocbot/tocbot.css" th:href="@{/lib/tocbot/tocbot.css}">
    <link rel="stylesheet" href="../static/lib/prism/prism.css" th:href="@{/lib/prism/prism.css}"><!--代码高亮-->
    <link rel="stylesheet" href="../static/css/typo.css"  th:href="@{/css/typo.css}">
    <link rel="stylesheet" href="../static/css/me.css" th:href="@{/css/me.css}">
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
            <h2 class="ui teal header item">XPU3企业云盘</h2>
            <a href="index.html" th:href="@{/}"  class="active m-item item m-moblie-hide"><i class="file icon"></i>我的文件</a>
            <a href="" th:href="@{/admin/blogadmin}" class="m-item item m-moblie-hide"><i class="signal icon"></i>数据监控</a>
            <a href="${pageContext.request.contextPath}/toupload?user_name=${user_name}" th:href="@{/admin/types}" class=" m-item item m-moblie-hide"><i class="cloud upload icon"></i>文件上传</a>
            <a href="${pageContext.request.contextPath}/apply?user_name=${user_name}" class="m-item item m-moblie-hide"><i class="edit icon"></i>权限申请</a>
            <a href="http://localhost:9001/#/login" class="m-item item m-moblie-hide"><i class="user icon"></i>管理入口</a>
            <a href="" th:href="@{/admin/inputblog}" class="m-item item m-moblie-hide"><i class="user circle icon"></i>个人主页</a>
            <div class="right menu item m-moblie-hide">
                <div class="ui dropdown item">
                    <div class="text">
                        <img src="https://up.enterdesk.com/photo/2012-3-16/enterdesk.com-698A0F2F1D9370844843D32CED3B91F6.jpg" alt="" class="ui actor image" width="150" height="150">
                        ${user_name}
                    </div>
                </div>
            </div>
            <div class="right menu item m-moblie-hide">
           <a href="" href="${pageContext.request.contextPath}/requestout"  class="m-item item m-moblie-hide"><i class="globe icon"></i>注销</a>
               <i class="dropdown icon"></i>
          </div>
        </div>
    </div>
</nav>
<!--左侧菜单-->
<div class="ui vertical menu" style="width: 120px !important;margin-top: -20px">
    <a class="teal item" href="${pageContext.request.contextPath}/garbage">回收站<div class="ui teal left pointing label">${requestScope.pagebean1.totalrecord}</div>
    </a>
    <a class="item">收藏<div class="ui label">51</div>
    </a>
</div>
<!--后台消息提示-->

<form action="${pageContext.request.contextPath}/searchFile" method="post" style="margin-left:30%;margin-top: -100px !important;width: 500px !important;">
    <div class="input-group input-group-lg">
        <span class="input-group-addon" id="sizing-addon1">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></span>
        <input type="text" name="searchcontent" class="form-control" placeholder="输入关键词" aria-describedby="sizing-addon1" /> <span class="input-group-btn">
        <button class="btn btn-default" type="submit">搜 索</button></span>
    </div>
</form>
    <table class="ui compact teal table" frame="border" style="width: 80%;margin-left:10%;margin-top: 5px"   align="center">
        <thead class="thead bg-success">
        <tr>
            <th scope="col">文件名</th>
            <th scope="col">文件大小</th>
            <th scope="col">上传日期</th>
            <th scope="col">下载文件</th>
            <th scope="col">查看权限</th>
            <th scope="col">删除</th>
            <th scope="col">分享</th>
        </tr>
        </thead>
        <tr>
            <tbody>
                <c:forEach var="c" items="${requestScope.pagebean.list}" varStatus="stat">
                    <c:if test="${!c.garbage}">
                    <tr class="table-info">
                        <td>${c.filename }</td>
                        <td>${c.filesize } kb</td>
                        <td>${c.createtime }</td>
                        <td>
                            <a class="ui mini teal button"
                               href="${pageContext.request.contextPath}/download?id=${c.id }&filename=${c.filename }">下载</a>
                        </td>
                        <td>
                            <form>
                                <select class="custom-select" id="${c.id}"
                                        onchange="gochange(${pagebean.currentpage},${c.id})">
                                    <c:if test="${c.canshare==0 }">
                                        <option value="0">私有</option>
                                        <option value="1">共享</option>
                                    </c:if>
                                    <c:if test="${c.canshare==1 }">
                                        <option value="1" selected="selected">共享</option>
                                        <option value="0">私有</option>
                                    </c:if>
                                </select>
                            </form>
                        </td>
                        <td>
                            <c:if test="${user.isdelect||c.canshare==0}">
                                <a class="ui mini red button" href="javascript:void(0)"
                                   onclick="godelete(${pagebean.currentpage},${c.id})">删除文件</a>
                            </c:if>
                            <c:if test="${c.canshare==1&&!user.isdelect}">
                                <a class="ui mini red button" href="javascript:void(0)"
                                   onclick="gotoapply()">无权限</a>
                            </c:if>
                        </td>

                        <td>
                            <!--赞赏-->
                            <a class="ui mini yellow button" href="${pageContext.request.contextPath}/toshare?filename=${c.filename}" >
                                分享
                            </a>
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>
            </tbody>
    </table>
    <br/>
 <div style="margin-left: 45%">
     <p class="text-secondary" style="color: white;font-size: 15px">
         共[${requestScope.pagebean.totalrecord}]条记录,
         每页 <input type="text" id="pagesize" value="${pagebean.pagesize }" onchange="gotopage(${pagebean.currentpage})"
                   style="font-size: 15px;color: black" maxlength="5">条
         共[${requestScope.pagebean.totalpage}]页,
         当前是第[${requestScope.pagebean.currentpage}]页,
     </p>
     <a class="btn btn-outline-success" href="javascript:void(0)" onclick="gotopage(1)">回到首页</a>
     <a class="btn btn-outline-primary" href="javascript:void(0)"
        onclick="gotopage(${requestScope.pagebean.previouspage})">上一页</a>
     <c:forEach var="pagenum" items="${requestScope.pagebean.pagebar}">
         <c:if test="${pagenum==pagebean.currentpage }">
             <font color="red">${pagenum }</font>
         </c:if>
         <c:if test="${pagenum!=pagebean.currentpage }">
             <a href="javascript:void(0)" onclick="gotopage(${pagenum})">${pagenum}</a>
         </c:if>
     </c:forEach>
     <a class="btn btn-outline-primary" href="javascript:void(0)" onclick="gotopage(${requestScope.pagebean.nextpage})">下一页</a>
     <input class="btn btn-outline-warning" type="button" value="跳转至第"
            onclick="gotopage1(document.getElementById('pagenum').value)"/>
     <input type="text" style="font-size: 10px;color: black" maxlength="5" id="pagenum">页
 </div>



<!--底部-->
<footer class="ui inverted  vertical segment m-paddmax">
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

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <script src="../static/lib/qrcode/qrcode.min.js"></script>
    <script type="text/javascript" src="js/spark-md5.js"></script>

    <script type="text/javascript">

        $('.message .close')
            .on('click',function () {
                $(this).closest('.message').transition('fade');
            });

        function godelete(currentpage, fileid) {
            var pagesize = document.getElementById("pagesize").value;

            if (pagesize > 10 || pagesize >= ${pagebean.totalrecord - pagebean.pagesize * ( pagebean.currentpage - 1 )}) {
                pagesize = Math.min(pagesize, ${pagebean.totalrecord});
                currentpage = 1;
            } else if (pagesize < 1) {
                pagesize = 1;
            }

            var r = confirm("确认删除文件？");
            if (r == true) {
                window.location.href = '${pageContext.request.contextPath}/togarbage?currentpage=' + currentpage + '&pagesize=' + pagesize + '&id=' + fileid;
                var q = confirm("文件已经进入回收站，请查看！");
            } else {
                return false;
            }
        }

        function gotoapply() {
            var r = confirm("删除共享资源，影响其他用户正常工作，需要申请权限");
            if(r == true){
                window.location.href= '${pageContext.request.contextPath}/apply?user_name='+user_name;
            }
        }


        function gochange(currentpage, fileid) {

            var canshare = document.getElementById(fileid).value;
            var pagesize = document.getElementById("pagesize").value;
            var r = confirm("如果设置共享，您的文件将可以被其他人搜索到");
            if (r == true) {
                window.location.href = '${pageContext.request.contextPath}/Share?currentpage=' + currentpage + '&pagesize=' + pagesize + '&id=' + fileid + '&canshare=' + canshare;
            } else {
                location.reload();
            }
        }

    </script>

    <script type="text/javascript">
        function calculate() {
            var fileReader = new FileReader(),
                box = document.getElementById('box');
            blobSlice = File.prototype.mozSlice || File.prototype.webkitSlice || File.prototype.slice,
                file = document.getElementById("fileupload").files[0],
                chunkSize = 2097152,
                // read in chunks of 2MB
                chunks = Math.ceil(file.size / chunkSize),
                currentChunk = 0,
                spark = new SparkMD5();

            fileReader.onload = function (e) {
                console.log("read chunk nr", currentChunk + 1, "of", chunks);
                spark.appendBinary(e.target.result); // append binary string
                currentChunk++;

                if (currentChunk < chunks) {
                    loadNext();
                }
                else {
                    var md5 = spark.end();
                    $("#md5").val(md5);
                    $.ajax({
                        url: "https://mykaleidoscope.xin/cloud/MD5test",
                        type: "POST",
                        data: {
                            "MD5": md5
                        },
                        success: function (res) {  //res是server端响应
                            response = eval('(' + res + ')');
                            ; //将json字符串解析为json对象（即JS对象）
                            if (response.fast == "true") {
                                box.innerText = '支持急速上传';
                                $("#cal").html("急速上传");
                                $("#cal").click(function(){
                                    $.ajax({
                                        url: "https://mykaleidoscope.xin/cloud/FastUpload",
                                        type: "POST",
                                        data: {
                                            "MD5": md5
                                        }, success: function () {

                                        }
                                    })

                                })

                            }else{
                                box.innerText='暂不支持急速上传';
                            }
                        }
                    });

                    console.info("computed hash", md5); // compute hash
                }
            };

            function loadNext() {
                var start = currentChunk * chunkSize,
                    end = start + chunkSize >= file.size ? file.size : start + chunkSize;

                fileReader.readAsBinaryString(blobSlice.call(file, start, end));
            };


            loadNext();
        }

        function gotopage(currentpage) {

            var pagesize = document.getElementById("pagesize").value;

            if (pagesize > 10 || pagesize >= ${pagebean.totalrecord - pagebean.pagesize * ( pagebean.currentpage - 1 )}) {
                pagesize = Math.min(10, ${pagebean.totalrecord});
                currentpage = 1;
            } else if (pagesize < 1) {
                pagesize = 1;
            }
            window.location.href = '${pageContext.request.contextPath}/searchUserfile?currentpage=' + currentpage + '&pagesize=' + pagesize;

        }

        function gotopage1(currentpage) {

            var pagesize = document.getElementById("pagesize").value;

            if (currentpage > ${pagebean.totalpage}) {
                currentpage = ${pagebean.totalpage};
                pagesize = ${pagebean.pagesize};
            } else if (currentpage < 1) {
                currentpage = 1;
                pagesize = ${pagebean.pagesize};
            }

            window.location.href = '${pageContext.request.contextPath}/searchUserfile?currentpage=' + currentpage + '&pagesize=' + pagesize;
        }
    </script>

        
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

    <script>
        $('.menu.toggle').click(function () {
            $('.m-item').toggleClass('m-moblie-hide')
        })
        $('.ui.dropdown').dropdown();

        function page(obj) {
            $("[name='page']").val($(obj).data("page"));
            loaddata();
        }

        function loaddata() {
            $("#table-container").load(/*[[@{/admin/blogadmin/search}]]*/"/admin/blogadmin/search",{
                title : $("[name='title']").val(),
                type : $("[name='type']").val(),
                recommend : $("[name='recommend']").prop('checked'),
                page : $("[name='page']").val(),
            });
        }
        $('.menu.toggle').click(function () {
            $('.m-item').toggleClass('m-moblie-hide')
        })


     </script>
     <script>


    $('#good').popup({
        popup:$('.payQ.popup'),
        on:'click',
        position:'bottom center'
    });

    tocbot.init({
        // Where to render the table of contents.
        tocSelector: '.js-toc',
        // Where to grab the headings to build the table of contents.
        contentSelector: '.js-toc-content',
        // Which headings to grab inside of the contentSelector element.
        headingSelector: 'h1, h2, h3',
        // For headings inside relative or absolute positioned containers within content.
        hasInnerContainers: true,
    });

    $('.toc.button').popup({
        popup:$('.toc-content.popup'),
        on:'click',
        position:'left center'
    });
    $('.weixin').popup({
        popup:$('.weixin-qr'),
        on:'hover',
        position:'left center'
    });

    var serurl = "http://127.0.0.1:8086";
    // var  url= @{/blog/{id}(id=${blog.id})};
    var qrcode = new QRCode("qrcode", {//原数的id
        text: serurl,
        width: 128,
        height: 128,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });

    /*   $('.ui.form').form({
           fields:{
               title:{
                   identifier:'content',
                   rules:[{
                       type:'empty',
                       prompt:'内容:请输入评论内容',
                   }]
               },
               context:{
                   identifier:'nickname',
                   rules:[{
                       type:'empty',
                       prompt:'请输入你的昵称',
                   }]
               },
               type:{
                   identifier:'email',
                   rules:[{
                       type:'empty',
                       prompt:'请输入你的邮箱',
                   }]
               },
           }
       });

       $('#commentpost-btn').click(function () {
         var boo = $('.ui.form').form('validate form');
         if(boo){
             console.log('验证成功！');
         }else {
             console.log('验证失败！');
         }

           console.log('点击成功！');
       })*/
</script>
</div>

</body>
</html>




		
		
		

