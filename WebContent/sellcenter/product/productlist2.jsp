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

      <TD align=middle  bgColor=#f6f6f6 height=20>商品价格</TD>


      <TD align=middle  bgColor=#f6f6f6 height=20>库存</TD>

     
  
    
     
      <TD align=middle  bgColor=#f6f6f6 height=23>操作</TD>
    </TR>
    
    <c:forEach items="${list}"  var="bean">
    <TR bgColor=#ffffff>
    <TD align=middle>
     ${bean.pname }&nbsp;
    </TD>
   
    <TD align=middle>
     ${bean.jiage }&nbsp;
    </TD>
   
    <TD align=middle>
     ${bean.kc }&nbsp;
    </TD>
    
    
   
    

      
      <TD borderColorLight=#c0c0c0 align=middle bgColor=#ffffff height=23>
      <DIV align=center>
      <a href="${url2 }update3.action?id=${bean.id }">查看</a>&nbsp;&nbsp;&nbsp;
      <a href="${url2 }update5.action?id=${bean.id }">商品入库</a>&nbsp;&nbsp;&nbsp;
     	
     
     
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

