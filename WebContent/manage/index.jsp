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
<SCRIPT language=javascript>
function switchbar(){
if (switchPoint.innerText==3){
switchPoint.innerText=4
document.all("frm").style.display="none"
}else{
switchPoint.innerText=3
document.all("frm").style.display=""
}}
</SCRIPT>


<META content="MSHTML 6.00.2900.5880" name=GENERATOR>
</HEAD>
<BODY style="MARGIN: 0px" bgColor=#ffffff leftMargin=0 topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
    <TR>
      <TD align=middle background=css.files/top.gif colSpan=3 height=50>
        <TABLE width="100%">
          <TBODY>
            <TR>
              <TD></TD>
              <TD align=middle><FONT style="FONT-SIZE: 10pt" color=#ffffff><B>
            <span style="font-weight: bold;font-size: 25px;">二手交易网站后台主界面</span>  
              　
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
    
         欢迎${manage.username }&nbsp;&nbsp;&nbsp;&nbsp;
             
              <A href="usermethod!changepwd.action" target="main"><FONT color=#ffffff>修改密码</FONT></A>｜
              <A href="usermethod!loginout.action"><FONT  color=#ffffff>退出系统</FONT></A>
              </B></FONT> </TD>
            </TR>
          </TBODY>
        </TABLE>
      </TD>
    <TR>
    <TR>
      <TD id=frm vAlign=center noWrap align=middle height="100%">
        <IFRAME style="Z-INDEX: 2; VISIBILITY: inherit; WIDTH: 200px; HEIGHT: 100%" name=rijcm src="manage/menu.jsp" frameBorder=0 scrolling=no></IFRAME>
      
      </TD>
      <TD width=10 bgColor=#73798c height="100%">
        <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
          <TBODY>
            <TR>
              <TD style="HEIGHT: 100%" onclick=switchbar() width=52>
              <FONT style="FONT-SIZE: 9pt; CURSOR: hand; COLOR: white; FONT-FAMILY: Webdings">
              <SPAN  id=switchPoint></SPAN> </FONT></TD>
            </TR>
          </TBODY>
        </TABLE>
      </TD>
      <TD width="100%">
        <IFRAME id=main  style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 100%"  name=main src="manage/web.jsp" frameBorder=0  scrolling=yes></IFRAME>
      </TD>
    </TR>
  </TBODY>
</TABLE>
</BODY>
</HTML>

