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




	 if (document.getElementById('sjnameid').value=="")
	{
		alert("收货人姓名不能为空");
		return false;
	}
	
		 
	if (document.getElementById('addressid').value=="")
	{
		alert("收货地址不能为空");
		return false;
	}
	

	
	if (document.getElementById('phoneid').value=="")
	{
		alert("手机不能为空");
		return false;
	}
	
	valid=/^0?1[3,4,5,6,7,8,9][0,1,2,3,4,5,6,7,8,9]\d{8}$/;  
	if(!valid.test(document.getElementById('phoneid').value)){
		alert("请输入正确的手机格式");
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
收货人姓名：
</span>
</td>
<td ><input name="sjname" type="text" id="sjnameid"  value="${user.truename }"   style="width: 500px;height: 25px;"/></td>
</tr>




<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
收货地址：
</span>
</td>
<td ><input name="address" type="text" id="addressid"    style="width: 500px;height: 25px;"/></td>
</tr>



<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
手机：
</span>
</td>
<td ><input name="phone" type="text" id="phoneid" value="${user.phone }"    style="width: 500px;height: 25px;"/></td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
总金额：
</span>
</td>
<td ><span style="font-size: 18px;font-weight: bold;color: red;">${zongjia }</span></td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
支付方式：
</span>
</td>
<td >
		<img src="images/01.jpg"></img><input type="radio" name="w" value="建设银行" checked="checked"/>
    	<img src="images/02.jpg"></img><input type="radio" value="工商银行" name="w" />
    	<img src="images/03.jpg"></img><input type="radio" value="农业银行" name="w" /><br/>
    	<img src="images/04.jpg"></img><input type="radio" value="招商银行" name="w" />
    	<img src="images/05.jpg"></img><input type="radio" value="支付宝" name="w" />
    	<img src="images/06.jpg"></img><input type="radio" value="财付通" name="w" />

</td>
</tr>


<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
备注：
</span>
</td>
<td ><input name="beizhu" type="text"  style="width: 500px;height: 25px;"/></td>
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
