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

function checkform()
{
	 
	

	if (document.getElementById('pnameid').value=="")
	{
		alert("商品名不能为空");
		return false;
	}
	
	
	
	if (document.getElementById('jiageid').value=="")
	{
		alert("商品价格不能为空");
		return false;
	}
	
	
	
	//验证必须为正数

var reg1 =  /^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$/;
 
 var reg2 =  /^\d+$/;
 
 var flag = 0;
 if(document.getElementById('jiageid').value.match(reg1) != null){
 	flag=1
 }
  if(document.getElementById('jiageid').value.match(reg2) != null){
 	flag=1
 }
 

	if (flag==0)
	{
		alert("商品价格必须为正数");
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
      <select name="fid">
      <c:forEach items="${fenleilist}" var="fenlei">
      <option value="${fenlei.id }" <c:if test="${bean.fenlei.id==fenlei.id }">selected</c:if> >${fenlei.fname }</option>
      </c:forEach>
      
      </select>
      </TD>
     
    </TR>
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
        商品名：
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <input  type="text" name="pname"  id='pnameid'  size="40" value="${bean.pname }" />
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
        上传新图片：
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <input   name="uploadfile"  type="file"  id='uploadfileid'  size="40"  />
      </TD>
     
    </TR>
    
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
        商品价格：
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <input  type="text" name="jiage"  id='jiageid'  size="40"  value="${bean.jiage }" />
      </TD>
     
    </TR>
    
    
    
    <TR>
      <TD width=300 bgColor=#f6f6f6 height=20>
        <DIV align=center>&nbsp;
       商品描述：
        </DIV>
      </TD>
      <TD width=300 bgColor=#f6f6f6 height=20>
      <textarea rows="7" cols="50" name="miaoshu">${bean.miaoshu }</textarea>
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

