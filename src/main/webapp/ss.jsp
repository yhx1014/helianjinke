<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function DoCheck()
{
var ch=document.getElementsByName("choose");
if(document.getElementsByName("allChecked")[0].checked==true)
{
for(var i=0;i<ch.length;i++)
{
ch[i].checked=true;
}
}else{
for(var i=0;i<ch.length;i++)
{
ch[i].checked=false;
}
}
}
</script>
<body>
请选择爱好：<br/>
<input type="checkbox" name="choose">跳舞
<input type="checkbox" name="choose">跳水
<input type="checkbox" name="choose"/>跳棋
<input type="checkbox" name="choose"/>跑步<br/>
<input type="checkbox" name="allChecked" id="allChecked" onclick="DoCheck()"/>全选/取消
</body>
</html>