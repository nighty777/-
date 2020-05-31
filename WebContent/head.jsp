<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


			<div id="apDiv1">
				<div align="center">
				<br/>
				<span id="sph1"
						style="font-size: 50px; font-weight: bold; color: white;">
					二手交易网站
				</span>
				</div>
				
			</div>
			

			
			<div id="apDiv3">
				
<div style="padding-top: 15px; padding-left: 30px;">
					<a href="."><span style="color: white;font-size: 15px;font-weight: bold;">首页</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="newsmethod!newslist2.action"><span style="color: white;font-size: 15px;;font-weight: bold;">新闻资讯</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${user==null}">
					<a href="usermethod!register.action"><span style="color: white;font-size: 15px;;font-weight: bold;">新用户注册</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="usermethod!login3.action"><span style="color: white;font-size: 15px;;font-weight: bold;">用户登录</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${user!=null}">
					<a href="gouwuchemethod!gouwuchelist.action"><span style="color: white;font-size: 15px;;font-weight: bold;">我的购物车</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="dingdanmethod!dingdanlist.action"><span style="color: white;font-size: 15px;;font-weight: bold;">我的订单</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="pingjiamethod!pingjialist.action"><span style="color: white;font-size: 15px;;font-weight: bold;">我的评价</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="usermethod!userupdate3.action"><span style="color: white;font-size: 15px;;font-weight: bold;">我的信息</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="sellcenter/index.jsp"><span style="color: white;font-size: 15px;;font-weight: bold;">卖家中心</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="usermethod!loginout2.action"><span style="color: white;font-size: 15px;;font-weight: bold;">用户退出</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					</c:if>
					
					
					<a href="manage/login.jsp"><span style="color: white;font-size: 15px;;font-weight: bold;">管理后台</span></a>
</div>

			</div>
<%
org.springframework.web.context.WebApplicationContext app = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());

com.dao.FenleiDao fenleiDao = (com.dao.FenleiDao) app.getBean("fenleiDao");

List<com.model.Fenlei> fenleilist = fenleiDao.selectBeanList(0,12," where deletestatus=0 ");

%>
  
			
			<div id="apDiv4">
				<div style="padding-top: 10px; padding-left: 10px;">
					<span style="font-weight: bold;color: #990033;">
					欢迎${user.username }光临
					</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href=".?tuijian=1">
					<span style="color: #990033;font-size: 15px;font-weight: bold;">
					卖家推荐&nbsp;&nbsp;&nbsp;
					</span>
					</a>
					<a href=".?paixu=1">
					<span style="color: #990033;font-size: 15px;font-weight: bold;">
					销量排行&nbsp;&nbsp;&nbsp;
					</span>
					</a>
					<a href=".?paixu=2">
					<span style="color: #990033;font-size: 15px;font-weight: bold;">
					点击排行&nbsp;&nbsp;&nbsp;
					</span>
					</a>
					<%
					for(com.model.Fenlei fenlei:fenleilist){
					%>	
					<a href=".?fid=<%=fenlei.getId() %>">
					<span style="color: #990033;font-size: 15px;font-weight: bold;">
					<%=fenlei.getFname() %>&nbsp;&nbsp;&nbsp;
					</span>
					</a>
					<% 	
					}
					%>
					
					
					
					
					
					&nbsp;&nbsp;&nbsp;
					
						
				</div>

			</div>
