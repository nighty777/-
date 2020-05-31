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
	
	
	<script language="javascript" type="text/javascript">

function changenum(id){
		var num = document.getElementById(id+"_num").value;
		var reg1 =  /^\d+$/;
	if (num.match(reg1) == null)
	{
		alert("购买数量必须为正整数");
		return false;
	}
		if (num == 0 )
	{
		alert("购买数量必须大于0的正整数");
		return false;
	}
		var now = new Date(); 
		var t = now.getTime()+''; 
		window.location.href="gouwuchemethod!gouwucheupdate2.action?id="+id+"&sl="+num+"&t="+t;
		
		
	}

</script>	

	</head>

	<body>

		<div id="bgdiv">

		<div id="alldiv">


			<jsp:include page="head.jsp" /> 


		<div id="apDiv5">
		
	

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
商品名
</span>
</td>

<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
单价
</span>
</td>

<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
库存数量
</span>
</td>

<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
购买数量
</span>
</td>

<td  height="20px" align="center" >
<span style="font-size: 18px;font-weight: bold;">
小计
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

<a href="productmethod!product.action?id=${bean.product.id }">
<span style="font-size: 14px;font-weight: bold;">
${bean.product.pname }&nbsp;
</span>
</a>

</td>

<td  height="20px" align="center" >
<span style="font-size: 14px;font-weight: bold;">
￥${bean.product.jiage } &nbsp;
</span>
</td>


<td  height="20px" align="center" >
<span style="font-size: 14px;font-weight: bold;">
${bean.product.kc } &nbsp;
</span>
</td>


<td  height="20px" align="center" >

<span style="font-size: 14px;font-weight: bold;">

<input type="text" name="sl"  value="${bean.shuliang }" id="${bean.id }_num"  size="5"/>&nbsp;
    <a href="javascript:;"  onclick="changenum(${bean.id })">变更</a> &nbsp;</td>
</span>

</td>

<td  height="20px" align="center">

<span style="font-size: 14px;font-weight: bold;">
￥${bean.product.jiage*bean.shuliang }&nbsp;
</span>

</td>


<td  height="20px" align="center">


<a href="gouwuchemethod!gouwuchedelete.action?id=${bean.id }" onclick=" return confirm('确定要取消吗?'); ">
<span style="font-size: 18px;font-weight: bold;">取消
</span>
</a>

</td>


</tr>




</c:forEach>



<tr  bgcolor="#eff4fe">
<td  height="20px" align="center" >

<span style="font-size: 25px;">总计：￥${zongjia }</span>

</td>

<td  height="20px" align="center" colspan="5" >
<input type="button" value="结算，生成订单" style="width: 150px;height: 25px;" 
onclick="javascript:window.location.href='dingdanmethod!dingdanadd.action'"/>

</font>
</td>


</tr>



</table>



		</div>
			

			
		</div>
		</div>
		
	</body>
	
</html>
