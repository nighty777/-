<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<base href="<%=basePath%>">
<TITLE>二手交易网站后台</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK 
href="other/Style.css" type=text/css rel=stylesheet>
<STYLE type=text/css>
A:link {
	COLOR: #3a4273; TEXT-DECORATION: none
}
A:hover {
	TEXT-DECORATION: underline
}
A:visited {
	COLOR: #464f86; TEXT-DECORATION: none
}
BODY {
	FONT-SIZE: 12px; SCROLLBAR-ARROW-COLOR: #007db5; SCROLLBAR-BASE-COLOR: #5282e7
}
TABLE {
	FONT-SIZE: 12px; SCROLLBAR-ARROW-COLOR: #007db5; SCROLLBAR-BASE-COLOR: #5282e7
}
TR {
	FONT-SIZE: 12px; SCROLLBAR-ARROW-COLOR: #007db5; SCROLLBAR-BASE-COLOR: #5282e7
}
TD {
	FONT-SIZE: 12px; SCROLLBAR-ARROW-COLOR: #007db5; SCROLLBAR-BASE-COLOR: #5282e7
}
.header {
	FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #f1f3fb; FONT-FAMILY: Tahoma,Verdana; BACKGROUND-COLOR: #007db5
}
.tablerow {
	FONT-SIZE: 12px; COLOR: #464f86; FONT-FAMILY: Tahoma,Verdana
}
BODY {
	BACKGROUND-COLOR: #5282e7
}
BODY {
	SCROLLBAR-FACE-COLOR: #bbcee8; SCROLLBAR-HIGHLIGHT-COLOR: #f2fafd; SCROLLBAR-SHADOW-COLOR: #85a7d6; SCROLLBAR-3DLIGHT-COLOR: #bccfe9; SCROLLBAR-ARROW-COLOR: #2445c8; SCROLLBAR-TRACK-COLOR: #bcd9f3; SCROLLBAR-DARKSHADOW-COLOR: #bbcef8
}
</STYLE>

<META content="MSHTML 6.00.2900.5880" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" bgColor=#eeeef6 
border=0>
  <TBODY>
    <TR>
      <TD vAlign=top>
        <TABLE class=tablerow cellSpacing=0 cellPadding=0 width="100%" 
      bgColor=#eeeef6 border=0>
          <TBODY>
            <TR>
              <TD class=header  background="">
              <IMG height=25 src="menu.files/Menu2.gif" width=25 align=absMiddle name=img1>
              <FONT  color=#000000><B><STRONG>≡主菜单≡</STRONG></B></FONT></TD>
            </TR>
            <TR>
              <TD bgColor=#000000 height=1></TD>
            </TR>
            <TR id=tr1>
              <TD>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                  <TBODY>
                  
                    
                    
                    <TR class=tablerow bgColor=#003399>
                      <TD  bgColor=#eeeef6>
                      <IMG height=25 src="menu.files/Blank.gif" width=25 align=absMiddle border=0>
                      <IMG alt="" src="menu.files/icon.gif"  border=0><a href="productmethod!productlist.action" target="main">商品管理</a></TD>
                    </TR>
                    
                    <TR class=tablerow bgColor=#003399>
                      <TD  bgColor=#eeeef6>
                      <IMG height=25 src="menu.files/Blank.gif" width=25 align=absMiddle border=0>
                      <IMG alt="" src="menu.files/icon.gif"  border=0><a href="productmethod!productlist2.action" target="main">商品库存管理</a></TD>
                    </TR>  
                    
                    
                    <TR class=tablerow bgColor=#003399>
                      <TD  bgColor=#eeeef6>
                      <IMG height=25 src="menu.files/Blank.gif" width=25 align=absMiddle border=0>
                      <IMG alt="" src="menu.files/icon.gif"  border=0><a href="productmethod!productlist3.action" target="main">商品推荐管理</a></TD>
                    </TR>  
                   
                    
                    <TR class=tablerow bgColor=#003399>
                      <TD  bgColor=#eeeef6>
                      <IMG height=25 src="menu.files/Blank.gif" width=25 align=absMiddle border=0>
                      <IMG alt="" src="menu.files/icon.gif"  border=0><a href="dingdanmethod!dingdanlist2.action" target="main">订单管理</a></TD>
                    </TR>  
                    
                    
                     <TR class=tablerow bgColor=#003399>
                      <TD  bgColor=#eeeef6>
                      <IMG height=25 src="menu.files/Blank.gif" width=25 align=absMiddle border=0>
                      <IMG alt="" src="menu.files/icon.gif"  border=0><a href="dingdanmethod!dingdanlist3.action" target="main">订单查询</a></TD>
                    </TR>  
                    
                    
                    <TR class=tablerow bgColor=#003399>
                      <TD  bgColor=#eeeef6>
                      <IMG height=25 src="menu.files/Blank.gif" width=25 align=absMiddle border=0>
                      <IMG alt="" src="menu.files/icon.gif"  border=0><a href="pingjiamethod!pingjialist3.action" target="main">评价查询</a></TD>
                    </TR>  
                      
                    
                  </TBODY>
                </TABLE>
              </TD>
            </TR>
            
     
            
            
            
            
          
            </TR>
          </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TBODY>
</TABLE>
</BODY>
</HTML>

