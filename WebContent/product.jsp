<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
		

	</head>

	<body>



		<div id="alldiv">


			<jsp:include page="head.jsp" /> 


		<div id="apDiv5">
		
		

<table width="100%" border="1" >

<tr bgcolor="#99CCFF">
<td align="center" colspan="2" height="35px" >
<br/>
<span style="font-size: 25px;font-weight: bold;">
<a href=".">首页</a>>>${title }
</span>


</td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
商品名：
</span>
</td>
<td >
${bean.pname }
</td>
</tr>


<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
商品图片：
</span>
</td>
<td >
 <img src="<%=basePath %>uploadfile/${bean.imgpath }" width="200" height="200" />
</td>
</tr>


<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
发布时间：
</span>
</td>
<td >
${bean.createtime }
</td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
商品分类：
</span>
</td>
<td >
${bean.fenlei.fname }
</td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
商品价格：
</span>
</td>
<td >
${bean.jiage }
</td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
是否推荐：
</span>
</td>
<td >
${bean.tuijian }
</td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
点击数：
</span>
</td>
<td >
${bean.dj }
</td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
销量：
</span>
</td>
<td >
${bean.xl }
</td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
库存：
</span>
</td>
<td >
${bean.kc }
</td>
</tr>

<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
商品描述：
</span>
</td>
<td >
${bean.miaoshu }
</td>
</tr>


<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
商品评价：
</span>
</td>
<td >
<a href="pingjiamethod!pingjialist2.action?pid=${bean.id }">
<span style="font-size: 18px;font-weight: bold;">
查看详情
</span>
</a>

</td>
</tr>



<tr  bgcolor="#eff4fe">
<td  height="30px" align="right" width="30%">
<span style="font-size: 18px;font-weight: bold;">
操作：
</span>
</td>
<td  >
 <input type="button"  onclick="window.location.href='gouwuchemethod!gouwucheadd2.action?pid=${bean.id }';" value="加入购物车" style="width: 100px;height: 25px;" /> 
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input onclick="window.location.href='.';" type="button" value="返&nbsp;&nbsp;&nbsp;&nbsp;回" style="width: 100px;height: 25px;"/>
   

</td>
</tr>


</table>



	</body>
	
</html>
