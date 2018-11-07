<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>币币袋</title>
    <link href="<%=basePath%>/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/user.js"></script>
    <script type="text/javascript" src="<%=basePath%>/layui/layui.js" charset="utf-8"></script>
</head>
<style>
    .alert-title {
        border-bottom: none;
    }

    .alert-title h3 {
        font-size: 16px;
        font-weight: normal;
    }

    .subtitle {
        background: #F6F7F9;
        padding-left: 20px;
    }

    .subtitle::before {
        content: '';
        display: inline-block;
        width: 4px;
        height: 16px;
        background: #C89F67;
        margin-right: 4px;
        position: relative;
        top: 2px;
    }

    .subtitle .order-state {
        color: #423E9D;
        position: relative;
        left: 296px;
    }

    .confirm-btn {
        width: 100%;
        text-align: center;
        margin-bottom: 20px;
    }

    .confirm-btn span {
        display: inline-block;
        width: 110px;
        line-height: 34px;
        background: #423E9D;
        color: #fff;
    }

    .content-info {
        background: #fff;
        margin: 10px 20px;
        line-height: 30px;
        padding: 10px;
        margin-bottom: 20px;

    }

    .content-info span {
        display: inline-block;
        width: 190px;

    }

    .content-info div {
        border-bottom: 1px solid #f7f7f7;
        line-height: 40px;
    }

    .search-btn {
        width: 200px;
    }

</style>
<body>

<jsp:include page="head.jsp"></jsp:include>
<div class="w1200 personal">
    <jsp:include page="left.jsp"></jsp:include>
    <div class="personal-main">
        <div class="" style="margin-top: 20px">
            <form action="<%=basePath%>brower/insert.do" method="post" class="layui-form">
                <div class="layui-row">
                    <div class="layui-col-md5 ">
                        <div class="layui-form-item re-heigth">
                            <label class="layui-form-label">订单类型</label>
                            <div class="layui-input-block">
                                <select lay-verify="required" name="type">
                                    <option value="0">全部</option>
                                    <option value="1">借款</option>
                                    <option value="2">投资</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-md5">
                        <div class="layui-form-item re-heigth">
                            <label class="layui-form-label">订单状态</label>
                            <div class="layui-input-block">
                                <select name="state" style="lay-verify:required;">
                                    <option value="0">全部</option>
                                    <option value="1">BTC</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md2" style="padding-left: 50px">
                        <button class="layui-btn" style="width: 80px;background: #423E9D">搜索</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="pmain-profile" style="padding: 10px">
            <table class="layui-table" lay-skin="nob" lay-even>
                <colgroup>
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>借款编号</th>
                    <th>借款总金额</th>
                    <th>还款方式</th>
                    <th>期限</th>
                    <th>抵押资产</th>
                    <th>质押率</th>
                    <th>年化收益</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>123</td>
                    <td>123</td>
                    <td>123</td>
                    <td>123</td>
                    <td>123</td>
                    <td>123</td>
                    <td>123</td>
                    <td>123</td>
                    <td>
                        <span><a href="javascript:void(0)"
                                 class="layui-btn layui-btn-sm"
                                 style="background: #423E9D"
                                 onclick="showDlg('detailDlg')">查看</a></span>
                    </td>
                </tr>
                <%--<c:forEach items="${pageInfo.list}" var="invest" varStatus="status">--%>
                <%--<tr>--%>
                <%--<td>${invest.id}</td>--%>
                <%--<td>${invest.borrowCount}${invest.borrowType}</td>--%>
                <%--<td>${invest.paytype}</td>--%>
                <%--<td>${invest.loanterm}</td>--%>
                <%--<td>${invest.collateralCount}${invest.collateralType}</td>--%>
                <%--<td>${invest.pledgeRatio}</td>--%>
                <%--<td>${invest.annualizedRate}</td>--%>
                <%--<td>${invest.createtime}</td>--%>
                <%--<td>--%>
                <%--<a class="layui-btn layui-btn-sm" href="<%=basePath%>/investDetail.do?bid=${invest.id}"--%>
                <%--style="background: #423E9D">立即出借--%>
                <%--</a>--%>
                <%--</td>--%>
                <%--</tr>--%>
                <%--</c:forEach>--%>
                </tbody>
            </table>
            <div style="margin-bottom: 20px">
                <!--分页文字信息  -->
                <div id="page_info_area">
                    当前第<span>${pageInfo.pageNum}</span>页，共计<span>${pageInfo.pages}</span>页
                </div>
                <!-- 分页条信息 -->
                <div id="page_nav_area">
                    <div class="page_bar">
                        <span><a href="/invest?pn=1">首页</a></span>
                        <span><a href="">1</a></span>
                        <span><a href="">2</a></span>
                        <span><a href="" class="active">3</a></span>
                        <span><a href="">4</a></span>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <span><a href="/invest?pn=${pageInfo.pageNum-1}"><</a></span>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum }">
                                <span><a href="#" class="active">${page_Num }</a></span>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum }">
                                <span><a href="/invest?pn=${page_Num}">${page_Num }</a></span>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <span><a href="/invest?pn=${pageInfo.pageNum+1}">> </a></span>
                        </c:if>
                        <span><a href="/invest?pn=${pageInfo.endRow}">尾页</a></span>
                    </div>
                </div>
            </div>
            <%--<div class="pmain-user">--%>
            <%--<div class="user-info user-info1">--%>
            <%--订单类型 (订单状态)--%>
            <%--<br3/>--%>
            <%--"1.订单ID###"2.用户ID"###"3.用户电话号"###"4.用户邮箱--%>
            <%--<c:forEach items="${borrow}" var="item">--%>
            <%--<li>--%>
            <%--${item.id}"###"${item.buserid}"####"${item.brelname}"####"${item.bmailbox}"###"--%>
            <%--</li>--%>
            <%--</c:forEach>--%>
            <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<div class="alert-450" id="detailDlg" style="display: none">
    <div class="alert-title">
        <h3>借款详情</h3>
        <span class="alert-close" onclick="closeDlg('detailDlg')"></span>
    </div>
    <div class="subtitle">
        <span class="order-info">订单信息</span>
        <span class="order-state">募集中</span>
    </div>
    <div class="alert-main" style="background: #F6F7F9;width: 100%">
        <div class="content-info">
            <div>
                <span>借款金额</span><span>124BCH</span>
            </div>
            <div>
                <span>质押金额</span><span>124BCH</span>
            </div>
            <div>
                <span>借款价值／质押品价值</span><span>124BCH</span>
            </div>
            <div>
                <span>借款期限／还款方式</span><span>124BCH</span>
            </div>
            <div>
                <span>最小收款单元</span><span>124BCH</span>
            </div>
            <div>
                <span>借款发起时间</span><span>124BCH</span>
            </div>
            <div>
                <span>募集结束时间</span><span>124BCH</span>
            </div>
        </div>
        <%--if 确认收款--%>
        <div class="confirm-btn"><span>确认收款</span></div>
    </div>
</div>
</body>
<script>
    function showDlg(op) {
        $("body").append("<div id='mask'></div>");
        $("#mask").addClass("mask").css("display", "block");
        $("#" + op).css("display", "block");
    }

    function closeDlg(op) {
        $("#mask").css("display", "none");
        $("#" + op).css("display", "none");
    }

    //Demo
    layui.use('form', function () {
//        var form = layui.form();
//
//        //监听提交
//        form.on('submit(formDemo)', function (data) {
//            layer.msg(JSON.stringify(data.field));
//            return false;
//        });
    });
</script>
</html>