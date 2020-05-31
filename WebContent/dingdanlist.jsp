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
订单号：<input name="orderid" type="text"  value="${orderid }">
&nbsp;&nbsp;&nbsp;&nbsp;
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
生成时间
</span>
</td>

<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
总价
</span>
</td>

<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
订单状态
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
${bean.orderid }&nbsp;
</span>


</td>

<td  height="20px" align="center" >
<span style="font-size: 14px;font-weight: bold;">
${bean.product.pname } &nbsp;
</span>
</td>




<td  height="20px" align="center" >

<span style="font-size: 14px;font-weight: bold;">
${bean.createtime }&nbsp;
</span>

</td>



<td  height="20px" align="center" >

<span style="font-size: 14px;font-weight: bold;">
￥${bean.zongjia }&nbsp;
</span>

</td>


<td  height="20px" align="center" >

<span style="font-size: 14px;font-weight: bold;">
${bean.status }&nbsp;
</span>

</td>




<td  height="20px" align="center" >
<a href="dingdanmethod!dingdanupdate3.action?id=${bean.id }">
<span style="font-size: 18px;font-weight: bold;">
订单详情
</span>
</a>
&nbsp;&nbsp;
<c:if test="${bean.status=='处理中'}">
<a href="dingdanmethod!dingdandelete.action?id=${bean.id }">
<span style="font-size: 18px;font-weight: bold;">
取消订单
</span>
</a>
</c:if>


<c:if test="${bean.status=='已发货'}">
<a href="dingdanmethod!dingdandelete3.action?id=${bean.id }">
<span style="font-size: 18px;font-weight: bold;">
确认收货
</span>
</a>
</c:if>

<c:if test="${bean.status=='已收货'}">
<a href="pingjiamethod!pingjiaadd.action?did=${bean.id }">
<span style="font-size: 18px;font-weight: bold;">
商品评价
</span>
</a>
</c:if>

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
