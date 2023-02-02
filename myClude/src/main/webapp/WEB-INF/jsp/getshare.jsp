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
    <title>博客详情</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="/static/lib/tocbot/tocbot.css" th:href="@{/lib/tocbot/tocbot.css}">
    <link rel="stylesheet" href="/static/lib/prism/prism.css" th:href="@{/lib/prism/prism.css}"><!--代码高亮-->
    <link rel="stylesheet" href="/static/css/typo.css"  th:href="@{/css/typo.css}">
    <link rel="stylesheet" href="/static/css/me.css" th:href="@{/css/me.css}">

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
            <h2 class="ui teal header item">分享，传递快乐！</h2>
        </div>
    </div>
</nav>


<!--中间位置-->
<div class="m-container-small-responsive m-paddmax-small animate__animated animate__pulse">
    <div class="ui container">
        <div class="ui top attached segment">
            <div class="ui horizontal link list">
                <div class="item">
                    <img src="" alt="" th:src="@{${blog.user.avatar}}" class="ui avatar image">
                    <div class="content">
                        <a  href="#" class="header" >${filename}</a>
                    </div>
                </div>
                <div class="item">
                    <i class="calendar icon" > </i><span >${file.createtime}</span>
                </div>
                <div class="item">
                    <i class="eye icon"></i> 分享数：<span >${sharenums}</span>
                </div>
            </div>
        </div>

        <div class="ui  attached padded segment">

            <!--赞赏-->
            <div class="ui center aligned  circluar segment">
                <button  id="good"  class="ui red basic button">点击分享</button>
            </div>
            <div class="ui payQ flowing popup  transition hidden">
                <div class="ui orange basic label">
                    <div class="ui images" style="font-size: inherit !important">
                        <div class="image">
                            <div class="ui action input">
                                <input  id="myspare"   type="text" value="${sharelink}">
                                <button class="ui teal right labeled icon button">
                                    <i class="copy icon"></i>
                                    选择复制
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--右边top-->
            <!--目录提示框-->
            <div class="ui toc-content flowing popup  transition hidden" style="width: 300px !important;">
                <ol class="js-toc">

                </ol>

            </div>

        </div>
        <div class="ui attached positive message">
            <div class="ui  middle aligned grid">
                <div class="eleven wide column">
                    <ui class="list">
                        <li>文件上传者：<span >${user.username}</span></li>
                        <li>权限：<span >${user.root}</span></li>
                        <li>上传时间：<span >${file.createtime}</span></li>
                    </ui>
                </div>
                <div class="five wide column">
                    <img src="/static/image/bk.jpg" alt="" th:src="@{${blog.firstPicture}}"  class="ui right floated rounder bordered image" style="width: 110px">
                </div>
            </div>
        </div>
        <div id="comment-container" class="ui bottom attached segment">
            <div class="ui teal segment">
                <div class="ui comments">
                    <h3 class="ui dividing header">评论区</h3>
                    <div class="comment">
                        <a class="avatar">
                            <img src="/static/image/bk.jpg">
                        </a>
                        <div class="content">
                            <a class="author">Matt</a>
                            <div class="metadata">
                                <span class="date">今天下午 5:42</span>
                            </div>
                            <div class="text">太赞了！ </div>
                            <div class="actions">
                                <a class="reply">Reply</a>
                            </div>
                        </div>
                    </div>
                    <div class="comment">
                        <a class="avatar">
                            <img src="/static/image/bk.jpg">
                        </a>
                        <div class="content">
                            <a class="author">Elliot Fu</a>
                            <div class="metadata">
                                <span class="date">昨天上午12:30</span>
                            </div>
                            <div class="text">
                                <p>這對我的研究是非常有用.謝謝!</p>
                            </div>
                            <div class="actions">
                                <a class="reply">Reply</a>
                            </div>
                        </div>
                        <div class="comments">
                            <div class="comment">
                                <a class="avatar">
                                    <img src="../static/image/bk.jpg">
                                </a>
                                <div class="content">
                                    <a class="author">Jenny Hess</a>
                                    <div class="metadata">
                                        <span class="date">刚刚</span>
                                    </div>
                                    <div class="text">艾略特你永远是多么正确 :) </div>
                                    <div class="actions">
                                        <a class="reply">Reply</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="comment">
                        <a class="avatar">
                            <img src="../static/image/bk.jpg">
                        </a>
                        <div class="content">
                            <a class="author">Joe Henderson</a>
                            <div class="metadata">
                                <span class="date">5 天以前</span>
                            </div>
                            <div class="text">老兄，这太棒了。非常感谢。 </div>
                            <div class="actions">
                                <a class="reply">回复</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--评论-->
            <div class="ui form" >
                <!-- <input type="text" name="blog.id" th:value="${blog.id}">
                <input type="text" name="parentComment.id" th:value="-1">-->

                <div class="field">
                       <textarea name="content" placeholder="评论功能正在开发中...." style="color:blue">
                       </textarea>
                </div>
                <div class="fields">
                    <div class="field m-moblie-wide m-magrn-tb-tiny">
                        <div class="ui left icon input">
                            <i class="user icon"></i>
                            <input type="text" name="nickname" placeholder="姓名">
                        </div>
                    </div>
                    <div class="field m-moblie-wide m-magrn-tb-tiny">
                        <div class="ui left icon input ">
                            <i class="mail icon"></i>
                            <input type="text" name="email" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="field">
                        <button type="button" id="commentpost-btn" class="ui teal button"><i class="edit icon"></i>发布</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--右边top-->




<br>
<br>
<br>
<br>
<!--上下拉的划动条-->
<div class="m-paddmax-little m-midding m-right-botton">
    <div class="ui vertical icon buttons ">
        <button   class="ui toc teal button" type="button">目录</button>
        <a href="#comment-container" class="ui teal button">留言</a>
        <button class="ui expand icon  button" ><i class="expand icon"></i></button>
        <a href="#" class="ui teal button">扫码</a>
    </div>
</div>

<!--弹出二微码-->
<div id="qrcode" class="ui weixin-qr flowing popup transition hidden" style="width: 130px !important;">
</div>




<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="/static/lib/tocbot/tocbot.min.js"></script>     <!--目录-->
<script src="/static/lib/prism/prism.js"></script>
<script src="/static/lib/qrcode/qrcode.min.js"></script>

<script>
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-moblie-hide')
    })
    $('#good').popup({
        popup:$('.payQ.popup'),
        on:'click',
        position:'bottom center'
    });

    //分享
    $('.ui.teal.right.labeled.icon.button').click(function () {

        $('#myspare')[0].select()
        document.execCommand("Copy");
        if(document.execCommand("Copy")!=null){
            alert("复制成功！")
        }else {
            alert("复制失败！")
        }
    })

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
    $('.expand').popup({
        popup:$('.weixin-qr'),
        on:'hover',
        position:'left center'
    });

    var serurl = "${sharelink}";

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
</body>
</html>