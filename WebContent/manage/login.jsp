<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.util.Util"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Util.init(request);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<base href="<%=basePath%>">
<TITLE>二手交易网站后台</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">

<META content="MSHTML 6.00.2900.5880" name=GENERATOR>
<STYLE type=text/css>
BODY {
	BACKGROUND-COLOR: #3068b5
}
</STYLE>
<LINK href="login.files/css.css" type=text/css rel=stylesheet>
</HEAD>
<BODY text=#000000 bgColor=#3068b5 leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<DIV align=center></DIV>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
    <TR>
      <TD align=middle bgColor=#3068b5>
       
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
          <TBODY>
            <TR>
              <TD align=middle background=login.files/bgImage.gif>
                <TABLE cellSpacing=0 cellPadding=0 width=504 border=0>
                  <TBODY>
                    <TR>
                      <TD background=login.files/homeTop.gif height=82>
                      <span style="font-size: 40px;font-weight: bold;color: white;">
                     &nbsp; &nbsp; &nbsp; &nbsp;
                      二手交易网站后台
                      </span>
                      </TD>
                    </TR>
                    
                    <TR>
                      <TD vAlign=bottom background=login.files/homeBottom.gif 
                  height=81>
                        <FORM id=_ctl0 name=_ctl0 action="usermethod!login.action"  method=post>
                          <TABLE height=78 cellSpacing=0 cellPadding=3 width=443 
                  align=center border=0>
                            <TBODY>
                              <TR>
                                <TD vAlign=bottom align=middle>
                                  <TABLE cellSpacing=0 cellPadding=2 align=center border=0>
                                    <TBODY>
                                      <TR>
                                        <TD align=left height=31>
                                   <span style="font-weight: bold;">帐号：</span>
                                   <INPUT class=form  style="WIDTH: 200px" maxLength=20 name=username>
                              <br/>
                                   <span style="font-weight: bold;">密码：</span>
                                   <INPUT class=form id=pass style="WIDTH: 200px" type=password name=password>
                              <br/> <br/>  
                                     
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           <INPUT type=submit value=登录 style="WIDTH: 100px">
                                     	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     	<input  onclick="window.location.href='<%=basePath %>';" style="width: 120px" type="button" value="返回首页" />
										  
                                        </TD>
                                      </TR>
                                    </TBODY>
                                  </TABLE>
                                </TD>
                              </TR>
                            </TBODY>
                          </TABLE>
                        </FORM>
                      </TD>
                    </TR>
                  </TBODY>
                </TABLE>
              </TD>
            </TR>
          </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TBODY>
</TABLE>
</BODY>
</HTML>

