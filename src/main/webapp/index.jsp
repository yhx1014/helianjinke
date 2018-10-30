<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/jquery.jcarousellite-1.0.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/index.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>/layui/layui.js" charset="utf-8"></script>
    <title>币币袋</title>
    <style>
        #scrollDiv {
            width: 400px;
            height: 30px;
            line-height: 30px;
            overflow: hidden;
        }

        #scrollDiv li {
            height: 30px;
            padding-left: 10px;
        }

        .first {
            margin-top: -100px;

        }

        .first-content {
            width: 100%;
            margin: 0 auto;
        }

        .first-content img {
            width: 100%;
        }

        .second {
            background: #fff;
            padding: 40px;
        }

        .second-content {
            width: 900px;
            margin: 0 auto;
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, .15), 0 1px 5px rgba(0, 0, 0, .075);
            padding: 10px;
            height: 480px;
        }

        .third {
        }

        .third-content {
            width: 100%;
            margin: 0 auto;
        }

        .third-content img {
            width: 100%;
        }

        .fourth {
            margin: 0 auto;
            padding: 90px 0px;
            background: #fff;
            position: relative;
        }

        .fourth-content {
            width: 760px;
            margin: 0 auto;
            /*position: relative;*/
        }

        .fourth::after {
            content: '';
            display: inline-block;
            width: 100%;
            height: 200px;
            background: #DDE4EF;
            top: 174px;
            position: absolute;

        }

        .fourth-content img {
            width: 100%;
            position: relative;
            z-index: 1;
        }

        .fifth {
            width: 100%;
            /*height: 300px;*/
            margin: 0 auto;
        }

        .fifth-content {
        }

        .fifth-content img {
            width: 100%;
            border: none;
        }
    </style>

    <script type="text/javascript">
        //上下滚动
        function AutoScroll(obj) {
            $(obj).find("ul:first").animate({
                marginTop: "-25px"
            }, 500, function () {
                $(this).css({
                    marginTop: "0px"
                }).find("li:first").appendTo(this);
            });
        }

        $(document).ready(function () {
            var myar = setInterval('AutoScroll("#scrollDiv")', 3000);
            $("#scrollDiv").hover(function () {
                clearInterval(myar);
            }, function () {
                myar = setInterval('AutoScroll("#scrollDiv")', 3000)
            });
        });
    </script>
    <script src="${pageContext.request.contextPath}/script/jquery.flexslider-min.js"></script>
    <script>
        $(function () {
            //判断最新公告是否为空,为空加载通知
            var list = "${listss}";
            if (list == "") {
                window.location = "${pageContext.request.contextPath}/notice/banner.do";
            }

            $('.flexslider').flexslider({
                directionNav: true,
                pauseOnAction: false
            });

            //产品列表滚动
            var pLength = $('.pListContentBox > li').length;
            var cishu = pLength - 4;
            var n = 0;
            $('.pListContentBox').css({
                'width': pLength * 245 + 'px'
            });
            if (pLength > 4) {
                $('.pListRight').addClass('curr');
            }
            $('.pListRight').on('click', function () {
                if (cishu > 0) {
                    n++;
                    cishu--;
                    $('.pListContentBox').animate({
                        'left': '-' + n * 244 + 'px'
                    }, 500);
                    if (cishu == 0) {
                        $('.pListRight').removeClass('curr');
                    }
                    if (n > 0) {
                        $('.pListLeft').addClass('curr');
                    }
                }
            });
            $('.pListLeft').on('click', function () {
                if (n > 0) {
                    n--;
                    cishu++;
                    $('.pListContentBox').animate({
                        'left': '-' + n * 244 + 'px'
                    }, 500);
                    if (n == 0) {
                        $('.pListLeft').removeClass('curr');
                    }
                    if (cishu > 0) {
                        $('.pListRight').addClass('curr');
                    }
                }
            });
        });
    </script>
    <script type="text/javascript">
        var gaintop;
        $(function () {
            gaintop = $(".login_float").css("top");
            $(".login_float").css("top", -695);
            $(".login_float").show();
            $(".login_float").animate({
                top: gaintop,
                opacity: 1
            }, 800);
            $(".login_float").animate({
                top: '-=12px',
                opacity: 1
            }, 200);
            $(".login_float").animate({
                top: gaintop,
                opacity: 1
            }, 200);
            $(".login_float").animate({
                top: '-=6px',
                opacity: 1
            }, 200);
            $(".login_float").animate({
                top: gaintop,
                opacity: 1
            }, 200);
            $(".login_float").animate({
                top: '-=2px',
                opacity: 1
            }, 100);
            $(".login_float").animate({
                top: gaintop,
                opacity: 1
            }, 100);
        });
    </script>
</head>

<body>
<jsp:include page="head.jsp"></jsp:include>
<section class="first">
    <div class="first-content">
        <img src="<%=basePath%>/images/first-bg.png" style="display: inline;">
    </div>
</section>
<section class="second">
    <div class="second-content">
        <div style="padding: 10px;border-bottom: 1px solid #ddd">精选债权</div>
        <table class="layui-table" lay-skin="nob" lay-even>
            <colgroup>
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>订单编号</th>
                <th>借款总金额</th>
                <th>借款期限</th>
                <th>抵押物</th>
                <th>最小投资金额</th>
                <th>年利率</th>
                <th>截止时间</th>
                <th>投标进度</th>
                <th>操作</th>

            </tr>
            </thead>
            <tbody>
            <tr>
                <td>质押金额</td>
                <td>1341</td>
                <td>质押金额</td>
                <td>1341</td>
                <td>质押金额</td>
                <td>1341</td>
                <td>质押金额</td>
                <td>1341</td>
                <td>质押金额</td>
            </tr>
            </tbody>
        </table>
    </div>
</section>
<section class="third">
    <div class="third-content">
        <img src="<%=basePath%>/images/third-bg.png" style="display: inline;">
    </div>
</section>
<section class="fourth">
    <div class="fourth-content">
        <img src="<%=basePath%>/images/four-bg.png" style="display: inline;">
    </div>
</section>
<section class="fifth">
    <div class="fifth-content">
        <img src="<%=basePath%>/images/fifth-bg.png" style="display: inline;">
    </div>
</section>
<div class="page-right fn-right" style="top: 0px;"></div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>