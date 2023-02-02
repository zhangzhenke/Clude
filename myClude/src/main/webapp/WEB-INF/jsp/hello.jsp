<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml" xmlns:data-page="http://www.w3.org/1999/xhtml"
      xmlns:tb="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>个人管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="../../static/css/me.css" th:href="@{/css/me.css}">
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
            <h2 class="ui teal header item">个人管理</h2>

            <a href="index.html" th:href="@{/}"  class="m-item item m-moblie-hide"><i class="home icon"></i>博客首页</a>
            <a href="" th:href="@{/admin/blogadmin}" class="active m-item item m-moblie-hide"><i class="home icon"></i>进期博文</a>
            <a href="" th:href="@{/admin/types}" class=" m-item item m-moblie-hide"><i class="idea icon"></i>博文分类</a>
            <a href="" th:href="@{/admin/tags}" class="m-item item m-moblie-hide"><i class="tags icon"></i>博文标签</a>
            <a href="" th:href="@{/admin/inputblog}" class="m-item item m-moblie-hide"><i class="info icon"></i>博文发布</a>


            <div class="right menu item m-moblie-hide">
                <div class="ui dropdown item">
                    <div class="text">
                        <img src="https://up.enterdesk.com/photo/2012-3-16/enterdesk.com-698A0F2F1D9370844843D32CED3B91F6.jpg" alt="" class="ui actor image" width="150" height="150">
                        胡俊杰
                    </div>
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <a href="#" th:href="@{/admin/logout}" class="item">注销</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</nav>



<!--中间位置-->
<div class="stackable  mobile reversed  m-container-small-responsive m-paddmax-small">
    <div class="ui container">
        <div class="ui  form">
            <!-- -->
            <input type="hidden" name="page">
            <div class="inline fields">
                <div class="field">
                    <input type="text" name="title" placeholder="标题" class="text">
                </div>
                <div class="field">
                    <div class="ui selection dropdown">
                        <input type="hidden" name="type">
                        <i class="dropdown icon"></i>
                        <div class="default text">分类</div>
                        <div class="menu">
                            <!--<div class="item" tb:each="type : ${types}"  data-value="1" th:data-value="${type.id}" th:text="${type.name}"></div>-->
                            <div th:each="tag : ${types}" class="item" data-value="1" th:data-value="${tag.id}" th:text="${tag.name}">java</div>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <div class="ui checkbox">
                        <input type="checkbox" id="recommend" name="recommend">
                        <label for="recommend"><text style="color: aliceblue">推荐</text></label>
                    </div>
                </div>
                <div class="field">
                    <button type="button" id="search-btn" class="ui teal basic button"><i class="search icon"></i>搜索</button>
                </div>
            </div>
            <!--表格-->
            <div id="table-container">
                <table th:fragment="blogList"  class="ui compact teal table">
                    <thead>
                    <tr>
                        <th scope="col">文件名</th>
                        <th scope="col">文件大小</th>
                        <th scope="col">上传日期</th>
                        <th scope="col">下载文件</th>
                        <th scope="col">是否共享</th>
                        <th scope="col">操作</th>
                    </tr></thead>
                    <tbody>
                    <tr th:each="c,iterStat : ${requestScope.pagebean.list}">
                        <td th:text="${c.filename}" >1</td>
                        <td th:text="${c.filesize }" >1</td>
                        <td th:text="${c.createtime }" >1</td>
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
                            <a class="ui mini teal button" href="javascript:void(0)"
                               onclick="godelete(${pagebean.currentpage},${c.id})">删除文件</a>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th colspan="6">
                            <div class="ui pagination menu" >
                                <a onclick="page(this)" th:attr="${page.number}-1" th:unless="${page.first}"   class="item">上一页</a>
                                <a onclick="page(this)" th:attr="${page.number}+1" th:unless="${page.last}"  class="item">下一页</a>
                            </div>
                            <a href="" th:href="@{/admin/inputblog}" class="ui mini right floated teal basic button">新增</a>
                        </th>
                    </tr>
                    </tfoot>
                </table>
                <!--后台消息提示-->
                <div class="ui success message" th:unless="${#strings.isEmpty(message)}">
                    <i class="close icon"></i>
                    <div class="header">提示：</div>
                    <p th:text="${message}"></p>
                </div>

            </div>
            </form>
        </div>
    </div>
</div>
<!--右边top-->
<br>
<br>
<br>
<br>
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
                <h4 CLASS="ui inverted header">最新博客</h4>
                <div class="ui inverted link list">
                    <a href="" class="item">用户故事【 user is story】</a>
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
                <h4 CLASS="ui inverted header">my blog</h4>
                <p class="m-text-thin m-Text-sapcing m-opacity-mini">这是我的博客，我会在上面分享我的知识心得，欢迎大家一起讨论！</p>
            </div>
        </div>
        <div class="ui inverted section divider"></div>
        <a href="http:49.232.127.127:8080/yinong">http:49.232.127.127:8080/yinong</a>
    </div>

</footer>



<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
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

    //点机搜索
    $('#search-btn').click(function () {
        loaddata();
    });

    //消息关闭
    $('.message .close')
        .on('click',function () {
            $(this).closest('.message').transition('fade');
        });

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
</body>
</html>