<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%
		response.addHeader("Cache-Control", "no-store, must-revalidate"); 
		response.addHeader("Expires", new java.util.Date().getTime()+"");
		%>

		<title>二手交易网站</title>
		<link rel="stylesheet" type="text/css" href="css/index.css" />

		<script language="javascript" type="text/javascript"
			src="js/jquery.min.js"></script>
		<script type="text/javascript">





function checkform(){



if (document.getElementById('password2id').value=="")
	{
		alert("原密码不能为空");
		return false;
	}
	

	if (document.getElementById('password2id').value=="")
	{
		alert("新密码不能为空");
		return false;
	}
	if (document.getElementById('password2id').value.length<6)
	{
		alert("新密码长度必须大于6位");
		return false;
	}
	if (document.getElementById('password2id').value != document.getElementById('password3id').value)
	{
		alert("确认新密码与新密码不一致");
		return false;
	}
		 
	
	
	
	
	
	return true;
}
</script>

	</head>

	<body>



		<div id="alldiv">


			<jsp:include page="head.jsp" /> 


		<div id="apDiv5">
		
		<form method="post" action="${url }"  onsubmit="return checkform()">		

<table width="100%" border="1" >

<tr bgcolor="#99CCFF">
<td align="center" colspan="2" height="35px" >

<span style="font-size: 25px;font-weight: bold;">
<a href=".">首页</a>>>${title }
</span>


</td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
原密码：
</span>
</td>
<td ><input name="password1" type="password" id="password1id"    style="width: 500px;height: 25px;"/></td>
</tr>


<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
新密码：
</span>
</td>
<td ><input name="password2" type="password" id="password2id"    style="width: 500px;height: 25px;"/></td>
</tr>


<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
确认新密码：
</span>
</td>
<td ><input name="password3" type="password" id="password3id"    style="width: 500px;height: 25px;"/></td>
</tr>




<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
操作：
</span>
</td>
<td  >
 <input type="submit" value="提&nbsp;&nbsp;&nbsp;&nbsp;交" style="width: 100px;height: 25px;" /> 
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" value="重&nbsp;&nbsp;&nbsp;&nbsp;置" style="width: 100px;height: 25px;"/>
   

</td>
</tr>


</table>
</form>


	</body>
	
</html>
