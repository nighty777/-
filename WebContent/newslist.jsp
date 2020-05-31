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

		<title>二手交易网站</title>
		<link rel="stylesheet" type="text/css" href="css/index.css" />

		<script language="javascript" type="text/javascript"
			src="js/jquery.min.js"></script>
		

	</head>

	<body>



		<div id="alldiv">


			<jsp:include page="head.jsp" /> 


		<div id="apDiv5">
		
		<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  	<TR>
      
      <TD align="left" height=20>
    <span style="font-size: 12px;font-weight: bold;">${title }</span>
      </TD>
    
    </TR>
  
    <TR>
       <form action="${url }" method="post">
      <TD align="left" height=20>
<span style="font-size: 12px;font-weight: bold;">
       新闻标题：
</span>       
       <input type="text"  name="ntitle" value="${ntitle }" /> 
     
       <input type="submit"  style="height: 25px;" value="查询" />    
      </TD>
      </form>
    </TR>
  </TBODY>
</TABLE>
<hr/>

<DIV style="width:100% ;">
					
					
						<table width=95% border=0 cellspacing=0 cellpadding=0 align=center><tr><td ><span style="font-weight: bold;">==【新闻资讯】==</span></td></tr>
											
											 <c:forEach items="${list}"  var="bean">
											
											<tr  height=25px onmouseover="show_bg(this,'#dedede');" onmouseout="show_bg(this,'white');" >
											<td   class=F3   align=left><font style="font-size:9pt;">
											<li><a class=nav href="newsmethod!newsupdate5.action?id=${bean.id }" ><span style="font-weight: bold;">${bean.ntitle }</span></a></td><td>
											<font style="font-size:9pt;"><span style="font-weight: bold;">${bean.ctime }</span></font>
											</td></tr>
											
											</c:forEach>
											
											
											</td></tr>
											
											</table>				
					
			${pagerinfo }
				</DIV>
				
				
		</div>
			

			
		</div>

	</body>
	
</html>
