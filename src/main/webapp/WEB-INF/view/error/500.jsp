<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>500error</title>
    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #000;
        }

        .bg-img {
            position: absolute;
            width: 100%;
            height: 100%;
            /*background: url(http://www.reactiongifs.us/wp-content/uploads/2015/04/nothing_to_see_here_naked_gun.gif) no-repeat center center fixed;*/
            background-size: cover;
            background-color: #000;
            opacity: .5;
            filter: alpha(opacity=50);
        }

        .content {
            font-family: 'Avenir-Next', Avenir, Helvetica, sans-serif;
            color: #fff;
            background-color: none;
            z-index: 2;
            position: absolute;
            top: 50%;
            -webkit-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        h1 {
            font-size: 160px;
            margin-bottom: 0;
            margin-top: 0;
        }

        h2 {
            margin-top: 0;
            max-width: 700px;
            font-size: 30px;
            width: 90%;
        }

        p {
            text-align: left;
            padding-bottom: 32px;
        }

        .btn {
            display: inline-block;
            border: 1px solid #aaa;
            border-radius: 40px;
            padding: 15px 30px;
            margin-right: 15px;
            margin-bottom: 10px;
        }

        .btn:hover {
            color: #e2e2e2;
            background: rgba(255, 255, 255, 0.1);
        }

        @media only screen and (max-width: 480px) {
            .btn {
                background-color: white;
                color: #444444;
                width: 100%;
            }

            h1 {
                font-size: 120px;
            }
        }

    </style>
</head>
<body>
<div class='container'>
    <div class='row content'>
        <div class='col-lg-12'></div>
        <div class='col-lg-12'>
            <h1>500</h1>
            <h2>服务器错误</h2>
            <p>
                You may want to head back to the homepage.
                <br>
                If you think something is broken, report a problem.
                </br>
            </p>
            <span id="reindex">返回首页</span>
            <span>报告错误</span>
        </div>
    </div>
</div>
<div class='bg-img'></div>
</body>

</html>
