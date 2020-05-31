<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<base href="<%=basePath %>"/>
<TITLE>二手交易网站后台</TITLE>
<LINK href="web.files/css.css" type=text/css 
rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2900.5880" name=GENERATOR>
</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  	<TR>
      
      <TD align="center" height=20>
     ${title }
      </TD>
    
    </TR>
  
    <TR>
       <form action="${url }" method="post">
      <TD align="left" height=20>
<input  onclick="javascript:window.location.href='<%=basePath %>${url2 }add.action';" class="buttoncss" type="button" value="发布商品" />
     &nbsp;&nbsp;&nbsp;
       商品名：<input type="text"  name="pname" value="${pname }" /> 
     
       <input type="submit"  value="查询" />    
      </TD>
      </form>
    </TR>
  </TBODY>
</TABLE>
<br/>

<TABLE width="100%" cellSpacing=1 borderColorDark=#ffffff cellPadding=0 align=center bgColor=#cccccc borderColorLight=#999999 border=0>
  <TBODY>
    <TR>
      
      <TD align=middle  bgColor=#f6f6f6 height=20>商品名</TD>
      <TD align=middle  bgColor=#f6f6f6 height=20>商品分类</TD>
      <TD align=middle  bgColor=#f6f6f6 height=20>商品价格</TD>
      <TD align=middle  bgColor=#f6f6f6 height=20>是否推荐</TD>
     
  
    
     
      <TD align=middle  bgColor=#f6f6f6 height=23>操作</TD>
    </TR>
    
    <c:forEach items="${list}"  var="bean">
    <TR bgColor=#ffffff>
    <TD align=middle>
     ${bean.pname }&nbsp;
    </TD>
    <TD align=middle>
     ${bean.fenlei.fname }&nbsp;
    </TD>
    <TD align=middle>
     ${bean.jiage }&nbsp;
    </TD>
    <TD align=middle>
     ${bean.tuijian }&nbsp;
    </TD>
   
    
   
    

      
      <TD borderColorLight=#c0c0c0 align=middle bgColor=#ffffff height=23>
      <DIV align=center>
      <a href="${url2 }update3.action?id=${bean.id }">查看</a>&nbsp;&nbsp;&nbsp;
     <c:if test="${bean.tuijian=='未推荐'}">
      <a href="${url2 }delete2.action?id=${bean.id }" onclick="return confirm('确定要推荐吗?'); ">推荐</a>
      </c:if>
       <c:if test="${bean.tuijian=='已推荐'}">
      <a href="${url2 }delete3.action?id=${bean.id }" onclick="return confirm('确定要取消推荐吗?'); ">取消推荐</a>
      </c:if>
      </DIV>
      </TD>
      
    </TR>
    </c:forEach>
    
    
    <TR bgColor=#ffffff>
      <TD borderColorLight=#c0c0c0 align=middle colSpan=20 height=23>${pagerinfo }</TD>
    </TR>
  </TBODY>
</TABLE>
</BODY>
</HTML>

