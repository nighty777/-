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
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
		<title>二手交易网站</title>
		<link rel="stylesheet" type="text/css" href="css/index.css" />

		<script language="javascript" type="text/javascript"
			src="js/jquery.min.js"></script>
		

	</head>

	<body>

		<div id="bgdiv">

		<div id="alldiv">


			<jsp:include page="head.jsp" /> 


		<div id="apDiv5">
		
	<form action="${url }" method="post">

商品名：<input name="pname" type="text"  value="${pname }">
<input type="submit"  value="查询"/>
</form>

<table width="100%" border="1" >


<tr bgcolor="#99CCFF">
<td align="center" colspan="20" height="35px" >

<span style="font-size: 25px;font-weight: bold;">
<a href=".">首页</a>>>${title }
</span>

</td>
</tr>



<tr  bgcolor="#eff4fe">


<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
订单号
</span>
</td>


<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
商品名
</span>
</td>



<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
评价内容
</span>
</td>

<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
评价时间
</span>
</td>



<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
操作
</span>
</td>



</tr>

<c:forEach items="${list}" var="bean">

<tr  bgcolor="#eff4fe">


<td  height="20px" align="center" >
<span style="font-size: 14px;font-weight: bold;">
${bean.dingdan.orderid } &nbsp;
</span>
</td>



<td  height="20px" align="center" >
<span style="font-size: 14px;font-weight: bold;">
${bean.product.pname } &nbsp;
</span>
</td>



<td  height="20px" align="center" >
<span style="font-size: 14px;font-weight: bold;">
${bean.pneirong }&nbsp;
</span>
</td>



<td  height="20px" align="center" >
<span style="font-size: 14px;font-weight: bold;">
${bean.shijian }&nbsp;
</span>
</td>





<td  height="20px" align="center" >
<a href="pingjiamethod!pingjiadelete.action?id=${bean.id }">
<span style="font-size: 18px;font-weight: bold;">
删除
</span>
</a>
</td>


</tr>

</c:forEach>



<tr>
<td  align="center" colspan="6">
${pagerinfo }

</td>




</table>



		</div>
			

			
		</div>
		</div>
		
	</body>
	
</html>
