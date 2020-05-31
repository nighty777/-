package com.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import com.dao.NewsDao;
import com.model.News;
import com.util.Pager;
import com.util.Util;


public class NewsAction extends BaseAction {

	private static final long serialVersionUID = -4304509122548259589L;

	
	
	private NewsDao newsDao;



	public NewsDao getNewsDao() {
		return newsDao;
	}



	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}
	
	
	//新闻列表
	public String newslist() {
		HttpServletRequest request = this.getRequest();
		String ntitle = request.getParameter("ntitle");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (ntitle != null && !"".equals(ntitle)) {

			sb.append("ntitle like '%" + ntitle + "%'");
			sb.append(" and ");
			request.setAttribute("ntitle", ntitle);
		}
		

		sb.append("   deletestatus=0 order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = newsDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", newsDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "newsmethod!newslist.action", "共有" + total + "条记录"));
		request.setAttribute("url", "newsmethod!newslist.action");
		request.setAttribute("url2", "newsmethod!news");
		request.setAttribute("title", "新闻管理");
		this.setUrl("manage/news/newslist.jsp");
		return SUCCESS;

	}
//跳转到添加新闻页面
	public String newsadd() {
		HttpServletRequest request = this.getRequest();
		request.setAttribute("url", "newsmethod!newsadd2.action");
		request.setAttribute("title", "新闻添加");
		this.setUrl("manage/news/newsadd.jsp");
		return SUCCESS;
	}
//添加新闻操作
	public void newsadd2() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		String content = request.getParameter("content");
		
		String ntitle = request.getParameter("ntitle");
		

		News bean = new News();
		
		bean.setContent(content);
		bean.setCtime(Util.getTime());
		bean.setNtitle(ntitle);
		
		newsDao.insertBean(bean);

		writer.print("<script language=javascript>alert('操作成功');window.location.href='newsmethod!newslist.action';</script>");
	}
	
	
//跳转到更新新闻页面
	public String newsupdate() {
		HttpServletRequest request = this.getRequest();
		News bean = newsDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("url", "newsmethod!newsupdate2.action?id="+bean.getId());
		request.setAttribute("title", "新闻信息修改");
		this.setUrl("manage/news/newsupdate.jsp");
		return SUCCESS;
	}
	
	
//更新新闻操作
	public void newsupdate2() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		String content = request.getParameter("content");
		
		String ntitle = request.getParameter("ntitle");
		
		News bean = newsDao.selectBean(" where id= "
				+ request.getParameter("id"));
		
		bean.setContent(content);
		bean.setNtitle(ntitle);
		
		
		newsDao.updateBean(bean);
		
		writer.print("<script language=javascript>alert('操作成功');window.location.href='newsmethod!newslist.action';</script>");
		
	}
	
	//删除新闻操作
	public void newsdelete() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		News bean = newsDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setDeletestatus(1);
		newsDao.updateBean(bean);
		
		writer.print("<script language=javascript>alert('操作成功');window.location.href='newsmethod!newslist.action';</script>");
	}
	
	
	//跳转到查看新闻页面
	public String newsupdate3() {
		HttpServletRequest request = this.getRequest();
		News bean = newsDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("title", "新闻信息查看");
		this.setUrl("manage/news/newsupdate3.jsp");
		return SUCCESS;
	}
	
	
	
	
	//前台新闻列表
	public String newslist2() {
		HttpServletRequest request = this.getRequest();
		String ntitle = request.getParameter("ntitle");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (ntitle != null && !"".equals(ntitle)) {

			sb.append("ntitle like '%" + ntitle + "%'");
			sb.append(" and ");
			request.setAttribute("ntitle", ntitle);
		}
		

		sb.append("   deletestatus=0 order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = newsDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", newsDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "newsmethod!newslist2.action", "共有" + total + "条记录"));
		request.setAttribute("url", "newsmethod!newslist2.action");
		request.setAttribute("url2", "newsmethod!news");
		request.setAttribute("title", "当前位置: <a href='.'>首页</a>>><a href='newsmethod!newslist2.action'>新闻资讯</a>");
		this.setUrl("newslist.jsp");
		return SUCCESS;

	}
	
	
	//跳转到查看新闻页面
	public String newsupdate5() {
		HttpServletRequest request = this.getRequest();
		News bean = newsDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("title", "当前位置: <a href='.'>首页</a>>><a href='newsmethod!newslist2.action'>新闻资讯</a>>>新闻查看");

		this.setUrl("news.jsp");
		return SUCCESS;
	}
	
}
