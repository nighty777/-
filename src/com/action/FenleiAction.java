package com.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import com.dao.FenleiDao;
import com.model.Fenlei;
import com.util.Pager;


public class FenleiAction extends BaseAction {

	private static final long serialVersionUID = -4304509122548259589L;

	
	
	private FenleiDao fenleiDao;
	
	public FenleiDao getFenleiDao() {
		return fenleiDao;
	}
	public void setFenleiDao(FenleiDao fenleiDao) {
		this.fenleiDao = fenleiDao;
	}
	
	
	//商品分类列表
	public String fenleilist() {
		HttpServletRequest request = this.getRequest();
		String fname = request.getParameter("fname");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (fname != null && !"".equals(fname)) {

			sb.append("fname like '%" + fname + "%'");
			sb.append(" and ");
			request.setAttribute("fname", fname);
		}
		

		sb.append("   deletestatus=0 order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = fenleiDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", fenleiDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "fenleimethod!fenleilist.action", "共有" + total + "条记录"));
		request.setAttribute("url", "fenleimethod!fenleilist.action");
		request.setAttribute("url2", "fenleimethod!fenlei");
		request.setAttribute("title", "商品分类管理");
		this.setUrl("manage/fenlei/fenleilist.jsp");
		return SUCCESS;

	}
//跳转到添加商品分类页面
	public String fenleiadd() {
		HttpServletRequest request = this.getRequest();
		request.setAttribute("url", "fenleimethod!fenleiadd2.action");
		request.setAttribute("title", "商品分类添加");
		this.setUrl("manage/fenlei/fenleiadd.jsp");
		return SUCCESS;
	}
//添加商品分类操作
	public void fenleiadd2() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		String fname = request.getParameter("fname");
		

		Fenlei bean = new Fenlei();
		
		bean.setFname(fname);
		
		fenleiDao.insertBean(bean);

		writer.print("<script language=javascript>alert('操作成功');window.location.href='fenleimethod!fenleilist.action';</script>");
	}
	
	
//跳转到更新商品分类页面
	public String fenleiupdate() {
		HttpServletRequest request = this.getRequest();
		Fenlei bean = fenleiDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("url", "fenleimethod!fenleiupdate2.action?id="+bean.getId());
		request.setAttribute("title", "商品分类信息修改");
		this.setUrl("manage/fenlei/fenleiupdate.jsp");
		return SUCCESS;
	}
	
	
//更新商品分类操作
	public void fenleiupdate2() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		String fname = request.getParameter("fname");
		
		Fenlei bean = fenleiDao.selectBean(" where id= "
				+ request.getParameter("id"));
		
		bean.setFname(fname);
		
		
		fenleiDao.updateBean(bean);
		
		writer.print("<script language=javascript>alert('操作成功');window.location.href='fenleimethod!fenleilist.action';</script>");
		
	}
	
	//删除商品分类操作
	public void fenleidelete() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		Fenlei bean = fenleiDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setDeletestatus(1);
		fenleiDao.updateBean(bean);
		
		writer.print("<script language=javascript>alert('操作成功');window.location.href='fenleimethod!fenleilist.action';</script>");
	}
	
	
	//跳转到查看商品分类页面
	public String fenleiupdate3() {
		HttpServletRequest request = this.getRequest();
		Fenlei bean = fenleiDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("title", "商品分类信息查看");
		this.setUrl("manage/fenlei/fenleiupdate3.jsp");
		return SUCCESS;
	}
	
	
	
	
	
	
}
