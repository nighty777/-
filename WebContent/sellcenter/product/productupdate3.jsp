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

<script language="javascript" type="text/javascript">


</script>

</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width=500 align=center border=0>
  <TBODY>
    <TR>
      
      <TD align=middle height=20>
     ${title }
      </TD>
    
    </TR>
  </TBODY>
</TABLE>
<br/>

<form action="${url }" method="post" onsubmit="return checkform()" enctype="multipart/form-data">
<TABLE cellSpacing=1 borderColorDark=#ffffff cellPadding=0 align=center bgColor=#cccccc borderColorLight=#999999 border=0>
  <TBODY>
    
    
    
    
    
    
   
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
        商品分类名：
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      
       <input  type="text" name="pname"  id='pnameid'  size="40" value="${bean.fenlei.fname }"  readonly="readonly"/>
      
      </TD>
     
    </TR>
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
        商品名：
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <input  type="text" name="pname"  id='pnameid'  size="40" value="${bean.pname }"  readonly="readonly"/>
      </TD>
     
    </TR>
    
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
        商品图片：
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <img src="<%=basePath %>uploadfile/${bean.imgpath }" width="100" height="100" />
      </TD>
     
    </TR>
    
   
    
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
        商品价格：
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <input  type="text" name="jiage"  id='jiageid'  size="40"  value="${bean.jiage }"  readonly="readonly"/>
      </TD>
     
    </TR>
    
    
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
       商品描述：
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <textarea rows="7" cols="50" name="miaoshu" readonly="readonly">${bean.miaoshu }</textarea>
      </TD>
     
    </TR>
    
    
    
    
    
   
     
    
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
        操作
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>

				<input  onclick="javascript:history.go(-1);" style="width: 60px" type="button" value="返回" />
                                    
      </TD>
     
    </TR>
    
  </TBODY>
</TABLE>
</form>

</BODY>
</HTML>

