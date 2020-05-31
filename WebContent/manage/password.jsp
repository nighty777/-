<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<base href="<%=basePath%>">
<TITLE>二手交易网站后台</TITLE>
<LINK href="web.files/css.css" type=text/css 
rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2900.5880" name=GENERATOR>

<script language="javascript" type="text/javascript">

function checkform()
{
	 
	

	if (document.getElementById('password1id').value=="")
	{
		alert("原密码不能为空");
		return false;
	}
	if (document.getElementById('password2id').value=="")
	{
		alert("新密码不能为空");
		return false;
	}
	
	if (document.getElementById('password2id').value.length<6)
	{
		alert("新密码长度必须大于6位");
		return false;
	}
	if (document.getElementById('password2id').value != document.getElementById('password3id').value)
	{
		alert("新密码与新密码确认不一致");
		return false;
	}	 
	return true;
	
}


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

<form action="usermethod!changepwd2.action" method="post" onsubmit="return checkform()">
<TABLE cellSpacing=1 borderColorDark=#ffffff cellPadding=0 align=center bgColor=#cccccc borderColorLight=#999999 border=0>
  <TBODY>
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
        原密码:
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <input type="password" name="password1" id="password1id" size="30"  />
      </TD>
     
    </TR>
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
         新密码:
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <input type="password" name="password2" id="password2id" size="30"  />
      </TD>
     
    </TR>
    
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
        确认新密码:
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <input type="password" name="password3" id="password3id" size="30"  />
      </TD>
     
    </TR>
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
        操作
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <input type="submit" value="提交" style="width: 60px" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input  onclick="javascript:history.go(-1);" style="width: 60px" type="button" value="返回" />
      </TD>
     
    </TR>
    
  </TBODY>
</TABLE>
</form>

</BODY>
</HTML>

