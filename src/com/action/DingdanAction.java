package com.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dao.DingdanDao;
import com.dao.GouwucheDao;
import com.dao.ProductDao;
import com.model.Dingdan;
import com.model.Gouwuche;
import com.model.Product;
import com.model.User;
import com.util.Arith;
import com.util.Pager;
import com.util.Util;


public class DingdanAction extends BaseAction {

	private static final long serialVersionUID = -4304509122548259589L;

	
	
	private DingdanDao dingdanDao;
	
	
	public DingdanDao getDingdanDao() {
		return dingdanDao;
	}
	public void setDingdanDao(DingdanDao dingdanDao) {
		this.dingdanDao = dingdanDao;
	}
	
	
	//订单列表
	public String dingdanlist() {
		HttpServletRequest request = this.getRequest();
		String orderid = request.getParameter("orderid");
		
		String pname = request.getParameter("pname");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (orderid != null && !"".equals(orderid)) {

			sb.append("orderid like '%" + orderid + "%'");
			sb.append(" and ");
			request.setAttribute("orderid", orderid);
		}
		
		if (pname != null && !"".equals(pname)) {

			sb.append(" product.pname like '%" + pname + "%'");
			sb.append(" and ");
			request.setAttribute("pname", pname);
		}
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		sb.append("   deletestatus=0 and user.id="+user.getId()+" order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = dingdanDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", dingdanDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "dingdanmethod!dingdanlist.action", "共有" + total + "条记录"));
		request.setAttribute("url", "dingdanmethod!dingdanlist.action");
		request.setAttribute("url2", "dingdanmethod!dingdan");
		request.setAttribute("title", "我的订单");
		this.setUrl("dingdanlist.jsp");
		return SUCCESS;

	}
	
	
//跳转到生成订单页面
	public String dingdanadd() {
		HttpServletRequest request = this.getRequest();
		request.setAttribute("url", "dingdanmethod!dingdanadd2.action");
		request.setAttribute("title", "生成订单");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		List<Gouwuche> list = gouwucheDao.selectBeanList(0, 9999, " where  user.id="+user.getId());
		
		double zongjia = 0;
		for(Gouwuche bean:list){
			zongjia = Arith.add(zongjia, Arith.mul(bean.getJiage(), bean.getShuliang()));
		}
		
		request.setAttribute("zongjia", zongjia);
		
		this.setUrl("dingdanadd.jsp");
		return SUCCESS;
	}
	
	
	private GouwucheDao gouwucheDao;
	

	
	public GouwucheDao getGouwucheDao() {
		return gouwucheDao;
	}
	public void setGouwucheDao(GouwucheDao gouwucheDao) {
		this.gouwucheDao = gouwucheDao;
	}
	
	
	
	
	
	
	
	
	//生成订单操作
	public void dingdanadd2() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		String address = request.getParameter("address");
		String beizhu = request.getParameter("beizhu");
		String phone = request.getParameter("phone");
		String sjname = request.getParameter("sjname");
		String w = request.getParameter("w");
		
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		List<Gouwuche> list = gouwucheDao.selectBeanList(0, 9999, " where  user.id="+user.getId());


		for(Gouwuche gwc :list){
			Dingdan bean = new Dingdan();
			
			bean.setAddress(address);
			bean.setBeizhu(beizhu);
			bean.setCreatetime(Util.getTime());
			bean.setJiage(gwc.getJiage());
			bean.setOrderid(Util.getTime2());
			bean.setPhone(phone);
			bean.setProduct(gwc.getProduct());
			bean.setSjname(sjname);
			bean.setSl(gwc.getShuliang());
			bean.setStatus("处理中");
			bean.setUser(user);
			bean.setZongjia(Arith.mul(gwc.getShuliang(), gwc.getJiage()));
			bean.setPayway(w);
			
			dingdanDao.insertBean(bean);
			
			
			gouwucheDao.deleteBean(gwc);
			
			
		}
		
		

		writer.print("<script language=javascript>alert('操作成功');window.location.href='dingdanmethod!dingdanlist.action';</script>");
	}
	
	
	//取消订单操作
	public void dingdandelete() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		Dingdan bean = dingdanDao.selectBean(" where id= "
				+ request.getParameter("id"));
		
		bean.setStatus("已取消");
		
		
		dingdanDao.updateBean(bean);
		
		writer.print("<script language=javascript>alert('操作成功');window.location.href='dingdanmethod!dingdanlist.action';</script>");
	}
	
	
	
	
	
	//跳转到查看订单页面
	public String dingdanupdate3() {
		HttpServletRequest request = this.getRequest();
		Dingdan bean = dingdanDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("title", "订单信息查看");
		this.setUrl("dingdanupdate3.jsp");
		return SUCCESS;
	}
	
	
	//订单列表
	public String dingdanlist2() {
		HttpServletRequest request = this.getRequest();
		String orderid = request.getParameter("orderid");
		
		String pname = request.getParameter("pname");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (orderid != null && !"".equals(orderid)) {

			sb.append("orderid like '%" + orderid + "%'");
			sb.append(" and ");
			request.setAttribute("orderid", orderid);
		}
		
		if (pname != null && !"".equals(pname)) {

			sb.append(" product.pname like '%" + pname + "%'");
			sb.append(" and ");
			request.setAttribute("pname", pname);
		}
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		sb.append("   deletestatus=0 and product.user.id="+user.getId()+" and status='处理中' order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = dingdanDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", dingdanDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "dingdanmethod!dingdanlist2.action", "共有" + total + "条记录"));
		request.setAttribute("url", "dingdanmethod!dingdanlist2.action");
		request.setAttribute("url2", "dingdanmethod!dingdan");
		request.setAttribute("title", "订单管理");
		this.setUrl("sellcenter/dingdan/dingdanlist2.jsp");
		return SUCCESS;

	}
	
	
	//发货操作
	public void dingdandelete2() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		Dingdan bean = dingdanDao.selectBean(" where id= "
				+ request.getParameter("id"));
		
		bean.setStatus("已发货");
		
		
		dingdanDao.updateBean(bean);
		
		writer.print("<script language=javascript>alert('操作成功');window.location.href='dingdanmethod!dingdanlist2.action';</script>");
	}
	
	//跳转到查看订单页面
	public String dingdanupdate5() {
		HttpServletRequest request = this.getRequest();
		Dingdan bean = dingdanDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("title", "订单信息查看");
		this.setUrl("sellcenter/dingdan/dingdanupdate5.jsp");
		return SUCCESS;
	}
	
	
	//订单列表
	public String dingdanlist3() {
		HttpServletRequest request = this.getRequest();
		String orderid = request.getParameter("orderid");
		
		String pname = request.getParameter("pname");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (orderid != null && !"".equals(orderid)) {

			sb.append("orderid like '%" + orderid + "%'");
			sb.append(" and ");
			request.setAttribute("orderid", orderid);
		}
		
		if (pname != null && !"".equals(pname)) {

			sb.append(" product.pname like '%" + pname + "%'");
			sb.append(" and ");
			request.setAttribute("pname", pname);
		}
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		sb.append("   deletestatus=0 and product.user.id="+user.getId()+"  order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = dingdanDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", dingdanDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "dingdanmethod!dingdanlist3.action", "共有" + total + "条记录"));
		request.setAttribute("url", "dingdanmethod!dingdanlist3.action");
		request.setAttribute("url2", "dingdanmethod!dingdan");
		request.setAttribute("title", "订单查询");
		this.setUrl("sellcenter/dingdan/dingdanlist3.jsp");
		return SUCCESS;

	}
	
	private ProductDao productDao;
	
	
	
	public ProductDao getProductDao() {
		return productDao;
	}
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	//确认收货操作
	public void dingdandelete3() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		Dingdan bean = dingdanDao.selectBean(" where id= "
				+ request.getParameter("id"));
		
		bean.setStatus("已收货");
		
		
		dingdanDao.updateBean(bean);
		
		Product pro = productDao.selectBean(" where id= "+bean.getProduct().getId());
		
		pro.setXl(pro.getXl()+bean.getSl());
		
		pro.setKc(pro.getKc()-bean.getSl());
		
		productDao.updateBean(pro);
		
		writer.print("<script language=javascript>alert('操作成功');window.location.href='dingdanmethod!dingdanlist.action';</script>");
	}
	
	
	
	//订单列表
	public String dingdanlist4() {
		HttpServletRequest request = this.getRequest();
		String orderid = request.getParameter("orderid");
		
		String pname = request.getParameter("pname");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (orderid != null && !"".equals(orderid)) {

			sb.append("orderid like '%" + orderid + "%'");
			sb.append(" and ");
			request.setAttribute("orderid", orderid);
		}
		
		if (pname != null && !"".equals(pname)) {

			sb.append(" product.pname like '%" + pname + "%'");
			sb.append(" and ");
			request.setAttribute("pname", pname);
		}
		
		

		sb.append("   deletestatus=0   order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = dingdanDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", dingdanDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "dingdanmethod!dingdanlist4.action", "共有" + total + "条记录"));
		request.setAttribute("url", "dingdanmethod!dingdanlist4.action");
		request.setAttribute("url2", "dingdanmethod!dingdan");
		request.setAttribute("title", "订单查询");
		this.setUrl("manage/dingdan/dingdanlist4.jsp");
		return SUCCESS;

	}
	
}
