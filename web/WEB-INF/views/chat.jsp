<%--
  Created by IntelliJ IDEA.
  User: Chauncy
  Date: 17/05/2018
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Robot Chat</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="lib/js/jqueryrotate.js"></script>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
</head>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial;
    }
    .head{
        background-color: #393a3f;
        padding-left: 20px;
        position: relative;
    }
    .messages{
        background-color: #ebebeb;
        overflow-y: scroll;
        padding: 10px;
        position: relative;
        /*background: url("lib/img/bg1.jpg") no-repeat;*/
        /*background-size: 100%;*/
    }
    .send{
        background-color: #f4f4f4;
        line-height: 50px;
    }

    /*局部*/
    /*head*/
    .cover{
        background-color: #393a3f;
        position: relative;
        z-index: 3;
    }
    .name{
        color: #ffffff;
        line-height: 50px;
        display: inline-block;
        background-color: #393a3f;
        position: relative;
        z-index: 3;
    }
    .icon{
        width: 20px;
        height: 30px;
        vertical-align: middle;
        position: relative;
        z-index: 3;
        background-color: #393a3f;
    }
    .head ul{
        list-style: none;
        z-index: 2;
        position: absolute;
        bottom: 0px;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
        border: 1px solid #393a3f;
        overflow: hidden;
    }
    .head li{
        line-height: 30px;
    }
    .list{
        background-color: #f5eaea;
        display: inline-block;
        border-top: 1px solid #393a3f;
        border-collapse: collapse;
        padding: 5px 15px;
    }
    /*messages*/
    .background{
        position: fixed;
        left: 0;
        top: 0;
        margin-top: 50px;
    }
    .messages div{
        margin-bottom: 5px;
    }
    .receive{
        text-align: left;
        line-height: 30px;
        position: relative;
        z-index: 1;
    }
    .chat-profile{
        position: absolute;
        left: 0;
        width: 40px;
        height: 40px;
        border-radius: 100px;
    }
    .toward{
        text-align: right;
        line-height: 30px;
        position: relative;
        z-index: 1;
    }
    .text{
        word-break: break-all;
        min-height: 40px;
    }
    .receive .text{
        background-color: rgba(255,255,255,0.5);
        /*background: none;*/
        border: 1px solid #ffffff;
        padding: 5px 10px;
        border-radius: 10px;
        display: inline-block;
        margin-left: 45px;
    }
    .toward .text{
        background-color: rgba(220,186,4,0.5);
        /*background: none;*/
        border: 2px solid #dcba04;
        padding: 5px 10px;
        border-radius: 10px;
        display: inline-block;
    }

    /*send*/
    .input{
        line-height: 30px;
        background-color: #f4f4f4;
        border: 1px solid #f4f4f4;
        border-bottom: 1px solid #e2e2e2;
        padding: 0 10px;
        font-size: 16px;
        outline: none;
    }
    .btn{
        font-size: 16px;
        border-radius: 10px;
        border: 1px solid #94989b;
        padding: 5px 10px;
        background-color: #f4f4f4;
        outline:none;
    }
    .btn:active{
        box-shadow: 0 0 2px black inset;
    }
</style>
<body>
    <div class="container">
        <div class="head">
            <div class="cover">
                <img src="lib/img/white_arrow.png" alt="" id="icon" class="icon">
                <div class="name">小兔子</div>
                <img class="top-profile" src="" alt="">
            </div>
            <ul>
                <li><div class="list">小兔子</div></li>
                <li><div class="list">小脑斧</div></li>
                <li><div class="list">嘤嘤怪</div></li>
            </ul>
        </div>
        <div class="messages" id="message">
            <div class="background"><img src="lib/img/bunny_bg2.jpg" alt=""></div>
            <div class="receive"><img class="chat-profile" src="lib/img/bunny.jpg" alt=""><div class="text">你好呀~我是小兔子，你可以跟我聊天，也可以向我倾诉，我还会给你讲笑话喔~，新版本还添加了换机器人和看新闻功能哟~，想找我的其他机器人伙伴就点我的名字哟~~~</div></div>
            <div class="receive"><img class="chat-profile" src="lib/img/bunny.jpg" alt=""><div class="text">那~我们开始聊天吧~~~</div></div>
            <%--<div class="receive"><img class="chat-profile" src="lib/img/bunny.jpg" alt=""><div class="text">小兔子</div></div>--%>
            <%--<div class="receive"><img class="chat-profile" src="lib/img/tiger.jpg" alt=""><div class="text">小脑斧</div></div>--%>
            <%--<div class="receive"><div class="text">测试<a href="http://www.baidu.com">链接</a></div></div>--%>
            <%--<div class="receive"><div class="text">啦啦啦<img width="100%" src="lib/img/profile4.jpg" alt=""></div></div>--%>
            <%--<div class="receive"><div class="text">啦啦啦<img width="100%" src="lib/img/bg4.jpeg" alt=""></div></div>--%>
            <%--<div class="receive"><div class="text">亲，已帮您找到相关新闻</div></div>--%>
            <%--<div class="receive"><div class="text" style="font-size: 20px;font-weight: bold">外媒:1名中国人被IS割掉耳朵<img--%>
                    <%--src="lib/img/profile4.jpg" width="30px" alt=""><object width="100%" height="500px" data="http://www.runoob.com"></object></div></div>--%>
        </div>
        <div class="send">
            <input class="input" type="text" value="">
            <button class="btn">发送</button>
        </div>
    </div>
    <%--DISPLAY--%>
    <script>
        // function wordComeOut($object,text){
        //     var counter = 0;
        //     var temp = '';
        //     var this_timer = setInterval(function () {
        //         temp += text[counter];
        //         counter ++;
        //         $object.text(temp);
        //
        //         if(temp == text){
        //             clearInterval(this_timer);
        //         }
        //     },50);
        // }
        //
        // wordComeOut($('.receive:eq(0)'),"你好呀~我是小兔子，你可以跟我聊天，也可以向我倾诉，我还会给你讲笑话喔~，新版本还添加了换机器人和看新闻功能哟~")


        $('body').css({
            'width':window.innerWidth,
            'height':window.innerHeight
        });
        $('.head').css({
            'height':'50px'
        });
        $('.send').css({
            'height':'50px'
        });
        $('.messages').css({
            'height':window.innerHeight - 50 - 50 + 'px'
        });
        $('.input').css({
            'width': window.innerWidth - $('.btn').outerWidth() - 10 + 'px'
        });
        $('.background img').css({
            'height':$('.messages').outerHeight()+'px',
            'width':$('.messages').outerWidth()+'px',
            'opacity':'1'
        });

        window.onresize = function () {
            $('body').css({
                'width':window.innerWidth,
                'height':window.innerHeight
            });
            $('.head').css({
                'height':'50px'
            });
            $('.send').css({
                'height':'50px'
            });
            $('.messages').css({
                'height':window.innerHeight - 50 - 50 + 'px'
            });
            $('.input').css({
                'width': window.innerWidth - $('.btn').outerWidth() - 10 + 'px'
            });

            $('.background img').css({
                'height':$('.messages').outerHeight()+'px',
                'width':$('.messages').outerWidth()+'px',
                'opacity':'1'
            });
        };
    </script>
    <%--MANAGE--%>
    <script>
        <%--全局变量--%>
        var robots = [{
            name:"小兔子",
            key:"4e6278a4d8f94a5297c078e57d6a71c7",
            info:"我是小兔子，一只萌萌哒小兔子~",
            icon:"lib/img/bunny.jpg",
            background:"lib/img/bunny_bg2.jpg"
        },{
            name:"小脑斧",
            key:"4ef088ff40ee49dfa7e2d576a2c21b72",
            info:"我是小脑斧，一只神奇的小脑斧哟~",
            icon:"lib/img/tiger.jpg",
            background:"lib/img/tiger_bg.jpg"
        },{
            name:"嘤嘤怪",
            key:"914d01df3d46466e8cf3178a2dcb4da6",
            info:"我是嘤嘤怪，我不只会嘤嘤嘤，我还能陪你聊天哟~",
            icon:"lib/img/yyg.gif",
            background:"lib/img/yyg_bg.jpg"
        }];
        var currentRobot = robots[0];

        $('.btn').click(function () {
            //添加自己的消息
            addMyMessage();

            var xmlhttp;
            //创建请求
            if(window.XMLHttpRequest){
                xmlhttp = new XMLHttpRequest();
            }else{
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var info = $('.input').val();
            $('.input').val("");

            if (info != "") {
                xmlhttp.open("POST","chatservlet?info="+info+"&key="+currentRobot.key+"&robot="+currentRobot.name);
                xmlhttp.send();

                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        //成功访问
                    //    添加机器人的聊天信息
                        var reply = xmlhttp.responseText;
                        console.log(reply);
                        // $('.messages').append('<div class="receive"><div class="text">'+reply+'</div></div>');
                        handleReplyJSON(reply);
                        scrollToBottom();
                    }
                }
            }
            var $message = $('.messages');
                $message.scrollTop = $message.scrollHeight;
        });
    //    添加自己的聊天信息
        function addMyMessage(){
            var myMessage = $('.input').val();
            if (myMessage!="") {
                $('.messages').append('<div class="toward"><div class="text">'+myMessage+'</div></div>');
                scrollToBottom();
            }
        }

    //    滚动到底部
        function scrollToBottom() {
            $('#message').scrollTop($('.messages').get(0).scrollHeight)
        }

        function handleReplyJSON(reply) {
            reply = JSON.parse(reply);
            console.log(reply.code);
            if( reply.code == 100000 ){//文本类
                console.log(100000);
                $('.messages').append('<div class="receive"><img class="chat-profile" src="'+currentRobot.icon+'" alt=""><div class="text">'+reply.text+'</div></div>');
            }
            else if( reply.code == 200000){//链接类
                console.log("lll");
                $('.messages').append('<div class="receive"><img class="chat-profile" src="'+currentRobot.icon+'" alt=""><div class="text">'+reply.text+'<a href="'+reply.url+'">'+reply.url+'</a></div></div>');
            }
        // <div class="receive"><div class="text" style="font-size: 20px;font-weight: bold">外媒:1名中国人被IS割掉耳朵<img
        //     src="lib/img/profile4.jpg" width="30px" alt=""><object width="100%" height="500px" data="http://www.runoob.com"></object></div></div>
            else if( reply.code == 302000){//新闻类
                $('.messages').append('<div class="receive"><img class="chat-profile" src="'+currentRobot.icon+'" alt=""><div class="text">'+reply.text+'</div></div>');

                //随机获取一条新闻
                var i = Math.floor(Math.random()*reply.list.length);
                $('.messages').append('<div class="receive"><div class="text" style="font-size: 20px;font-weight: bold">' + reply.list[i].article + '<img src="'+reply.list[i].icon+'" width="100%" alt=""><object width="100%" height="500px" data="'+reply.list[i].detailurl+'"></object></div></div>');
            }
            // else if( reply.code == 308000){//菜谱类
            //
            // }else if( reply.code == 313000){//儿歌类
            //
            // }else if( reply.code == 314000){//诗词类
            //
            // }
            else if( reply.code == 40004){//超出聊天次数
                $('.messages').append('<div class="receive"><img class="chat-profile" src="'+currentRobot.icon+'" alt=""><div class="text">'+currentRobot.name+'今天已经累了呢，快去找其他机器人陪你聊天吧~</div></div>');
            }
            else{
                $('.messages').append('<div class="receive"><img class="chat-profile" src="'+currentRobot.icon+'" alt=""><div class="text">'+reply.text+'</div></div>');
                console.log("else")
            }
            // else{
            //     $('.messages').append('<div class="receive"><div class="text">'+reply+'</div></div>');
            //     console.log("else")
            // }
            scrollToBottom();
        }

        var clickTime = 0 ;
        $('.cover:eq(0)').click(function () {
            if( clickTime%2==0 ) {
                showRobotList();
            }else{
                hideRobotList();
            }
        });

        function showRobotList(){
            var $ul = $('ul');
            $('#icon').rotate({
                animateTo: 90
            });
            $ul.animate({
                bottom:"-"+$ul.height()+"px",
            });
            clickTime++;
        }
        function hideRobotList() {
            var $ul = $('ul');
            $('#icon').rotate({
                animateTo: 0
            });
            $ul.animate({
                bottom:"0px",
            });
            clickTime++;
        }

        //绑定点击事件
        $('.list:eq(0)').click(function () {
            currentRobot = robots[0];
            changeRobot();
        });
        $('.list:eq(1)').click(function () {
            currentRobot = robots[1];
            changeRobot();
        });
        $('.list:eq(2)').click(function () {
            currentRobot = robots[2];
            changeRobot();
        });
        function changeRobot() {
            if ($('.name').text() != currentRobot.name) {
                $('.name').text(currentRobot.name);
                hideRobotList();
                clearMessage();
                $('.messages').append('<div class="background"><img src="'+currentRobot.background+'" alt=""></div>');
                bg_resize();

                $('.messages').append('<div class="receive"><img class="chat-profile" src="'+currentRobot.icon+'" alt=""><div class="text">'+currentRobot.info+'</div></div>');
                $('.messages').append('<div class="receive"><img class="chat-profile" src="'+currentRobot.icon+'" alt=""><div class="text">那~我们开始聊天吧~~~</div></div>');
            }else{
                hideRobotList();
            }
        }
        function clearMessage() {
            $div = $('.messages div');
            // $message = $('.messages:eq(0)');
            for( var i = 0 ; i < $div.length ; i ++){
                $div[i].remove();
            }
        }
        function bg_resize() {
            $('.background img').css({
                'height':$('.messages').outerHeight()+'px',
                'width':$('.messages').outerWidth()+'px',
                'opacity':'1'
            });
        }
    </script>
</body>
</html>

