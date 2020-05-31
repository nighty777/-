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
		
		<TABLE cellSpacing=0 cellPadding=0 width=100% align=center border=0>
  <TBODY>
    <TR>
      <TD align="left" height=20>
    <span style="font-size: 12px;font-weight: bold;">${title }</span>
      </TD>
    
    </TR>
  </TBODY>
</TABLE>
<hr/>

<div align="center" style="border-bottom:1px solid #000000;height:60px;line-height:50px; WORD-BREAK: break-all&#59&#59;border-collapse: collapse">
							<font style="font-size:16pt;font-weight:bold;font-family:heiti,黑体;" color=#000000>${bean.ntitle }</font>							
										
							
</div>

<div  style="padding:10px;" >
							<div style="width:900px;word-wrap:break-word;word-break:break-all;font-size:12pt;font-color:#000000;line-height:30px">
							<p>&nbsp; &nbsp;${bean.content }</p>

							</div>
						
						</div>

		</div>
			

			
		</div>

	</body>
	
</html>
