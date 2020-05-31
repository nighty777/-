package com.action;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.FenleiDao;
import com.dao.ProductDao;
import com.model.Product;
import com.model.User;
import com.util.Pager;
import com.util.Util;


public class ProductAction extends BaseAction {

	private static final long serialVersionUID = -4304509122548259589L;

	
	
	private ProductDao productDao;
	

	
	
	public ProductDao getProductDao() {
		return productDao;
	}
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	
	private FenleiDao fenleiDao;

	public FenleiDao getFenleiDao() {
		return fenleiDao;
	}
	public void setFenleiDao(FenleiDao fenleiDao) {
		this.fenleiDao = fenleiDao;
	}
	
	
	
	
	
	
	//商品列表
	public String productlist() {
		HttpServletRequest request = this.getRequest();
		String pname = request.getParameter("pname");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (pname != null && !"".equals(pname)) {

			sb.append("pname like '%" + pname + "%'");
			sb.append(" and ");
			request.setAttribute("pname", pname);
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		sb.append("   deletestatus=0 and user.id="+user.getId()+" order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", productDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "productmethod!productlist.action", "共有" + total + "条记录"));
		request.setAttribute("url", "productmethod!productlist.action");
		request.setAttribute("url2", "productmethod!product");
		request.setAttribute("title", "商品管理");
		this.setUrl("sellcenter/product/productlist.jsp");
		return SUCCESS;

	}
	
//跳转到发布商品页面
	public String productadd() {
		HttpServletRequest request = this.getRequest();
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where  deletestatus=0"));
		request.setAttribute("url", "productmethod!productadd2.action");
		request.setAttribute("title", "发布商品");
		this.setUrl("sellcenter/product/productadd.jsp");
		return SUCCESS;
	}
	
	
	
	private File uploadfile;
	

	public File getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(File uploadfile) {
		this.uploadfile = uploadfile;
	}
	//添加商品操作
	public void productadd2() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		
		String fid = request.getParameter("fid");
		String jiage = request.getParameter("jiage");
		String kc = request.getParameter("kc");
		String miaoshu = request.getParameter("miaoshu");
		String pname = request.getParameter("pname");
		
		if(fid==null||"".equals(fid)){
			writer.print("<script language=javascript>alert('操作失败，请先登录管理员添加分类信息');window.location.href='productmethod!productlist.action';</script>");
			
			return;
		}
		

		Product bean = new Product();
		
		bean.setCreatetime(Util.getTime());
		bean.setFenlei(fenleiDao.selectBean(" where id= "+fid));

		bean.setJiage(Double.parseDouble(jiage));
		bean.setKc(Integer.parseInt(kc));
		bean.setMiaoshu(miaoshu);
		bean.setPname(pname);
		bean.setTuijian("未推荐");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		bean.setUser(user);
		
		if(uploadfile!=null){
			String savaPath = ServletActionContext.getServletContext().getRealPath("/")+ "/uploadfile/";

			String time = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new Date()).toString();

			String imgpath = time + ".jpg";
			File file1 = new File(savaPath + imgpath);
			Util.copyFile(uploadfile, file1);
			
			bean.setImgpath(imgpath);
		}
		
		
		productDao.insertBean(bean);

		writer.print("<script language=javascript>alert('操作成功');window.location.href='productmethod!productlist.action';</script>");
	}
	
	
//跳转到更新商品页面
	public String productupdate() {
		HttpServletRequest request = this.getRequest();
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where  deletestatus=0"));
		request.setAttribute("bean", bean);
		request.setAttribute("url", "productmethod!productupdate2.action?id="+bean.getId());
		request.setAttribute("title", "商品信息修改");
		this.setUrl("sellcenter/product/productupdate.jsp");
		return SUCCESS;
	}
	
	
//更新商品操作
	public void productupdate2() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		String fid = request.getParameter("fid");
		String jiage = request.getParameter("jiage");

		String miaoshu = request.getParameter("miaoshu");
		String pname = request.getParameter("pname");
		
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		
		bean.setFenlei(fenleiDao.selectBean(" where id= "+fid));

		bean.setJiage(Double.parseDouble(jiage));
		bean.setMiaoshu(miaoshu);
		bean.setPname(pname);
		
		if(uploadfile!=null){
			String savaPath = ServletActionContext.getServletContext().getRealPath("/")+ "/uploadfile/";

			String time = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new Date()).toString();

			String imgpath = time + ".jpg";
			File file1 = new File(savaPath + imgpath);
			Util.copyFile(uploadfile, file1);
			
			bean.setImgpath(imgpath);
		}
		
		productDao.updateBean(bean);
		
		writer.print("<script language=javascript>alert('操作成功');window.location.href='productmethod!productlist.action';</script>");
		
	}
	
	//删除商品操作
	public void productdelete() throws IOException {
		HttpServletRequest request = this.getRequest();
		PrintWriter writer =  this.getPrintWriter();
		
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setDeletestatus(1);
		productDao.updateBean(bean);
		
		writer.print("<script language=javascript>alert('操作成功');window.location.href='productmethod!productlist.action';</script>");
	}
	
	
	//跳转到查看商品页面
	public String productupdate3() {
		HttpServletRequest request = this.getRequest();
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("title", "商品信息查看");
		this.setUrl("sellcenter/product/productupdate3.jsp");
		return SUCCESS;
	}
	
	
	
	//商品库存列表
	public String productlist2() {
		HttpServletRequest request = this.getRequest();
		String pname = request.getParameter("pname");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (pname != null && !"".equals(pname)) {

			sb.append("pname like '%" + pname + "%'");
			sb.append(" and ");
			request.setAttribute("pname", pname);
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		sb.append("   deletestatus=0 and user.id="+user.getId()+" order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", productDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "productmethod!productlist2.action", "共有" + total + "条记录"));
		request.setAttribute("url", "productmethod!productlist2.action");
		request.setAttribute("url2", "productmethod!product");
		request.setAttribute("title", "商品库存管理");
		this.setUrl("sellcenter/product/productlist2.jsp");
		return SUCCESS;

	}
	
	

	//跳转到商品入库页面
		public String productupdate5() {
			HttpServletRequest request = this.getRequest();
			Product bean = productDao.selectBean(" where id= "
					+ request.getParameter("id"));
			request.setAttribute("fenleilist", fenleiDao.selectBeanList(0, 9999, " where  deletestatus=0"));
			request.setAttribute("bean", bean);
			request.setAttribute("url", "productmethod!productupdate6.action?id="+bean.getId());
			request.setAttribute("title", "商品入库");
			this.setUrl("sellcenter/product/productupdate5.jsp");
			return SUCCESS;
		}
		
		
	//商品入库操作
		public void productupdate6() throws IOException {
			HttpServletRequest request = this.getRequest();
			PrintWriter writer =  this.getPrintWriter();
			
			String kc = request.getParameter("kc");
			
			
			Product bean = productDao.selectBean(" where id= "
					+ request.getParameter("id"));
			
			bean.setKc(bean.getKc()+Integer.parseInt(kc));

			
			
			productDao.updateBean(bean);
			
			writer.print("<script language=javascript>alert('操作成功');window.location.href='productmethod!productlist2.action';</script>");
			
		}
	
		
		
		//商品推荐列表
		public String productlist3() {
			HttpServletRequest request = this.getRequest();
			String pname = request.getParameter("pname");
			
			
			StringBuffer sb = new StringBuffer();
			sb.append(" where ");

			if (pname != null && !"".equals(pname)) {

				sb.append("pname like '%" + pname + "%'");
				sb.append(" and ");
				request.setAttribute("pname", pname);
			}
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			sb.append("   deletestatus=0 and user.id="+user.getId()+" order by tuijian  ");
			String where = sb.toString();


			int currentpage = 1;
			int pagesize = 10;
			if (request.getParameter("pagenum") != null) {
				currentpage = Integer.parseInt(request.getParameter("pagenum"));
			}
			int total = productDao.selectBeanCount(where.replaceAll("order by tuijian ", ""));
			request.setAttribute("list", productDao.selectBeanList((currentpage - 1)
					* pagesize, pagesize, where));
			request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
					currentpage, "productmethod!productlist3.action", "共有" + total + "条记录"));
			request.setAttribute("url", "productmethod!productlist3.action");
			request.setAttribute("url2", "productmethod!product");
			request.setAttribute("title", "商品推荐管理");
			this.setUrl("sellcenter/product/productlist3.jsp");
			return SUCCESS;

		}
		
		
		//商品推荐操作
		public void productdelete2() throws IOException {
			HttpServletRequest request = this.getRequest();
			PrintWriter writer =  this.getPrintWriter();
			
			Product bean = productDao.selectBean(" where id= "
					+ request.getParameter("id"));
			
			bean.setTuijian("已推荐");
			
			productDao.updateBean(bean);
			
			writer.print("<script language=javascript>alert('操作成功');window.location.href='productmethod!productlist3.action';</script>");
		}
		
		//取消推荐操作
		public void productdelete3() throws IOException {
			HttpServletRequest request = this.getRequest();
			PrintWriter writer =  this.getPrintWriter();
			
			Product bean = productDao.selectBean(" where id= "
					+ request.getParameter("id"));
			bean.setTuijian("未推荐");
			productDao.updateBean(bean);
			
			writer.print("<script language=javascript>alert('操作成功');window.location.href='productmethod!productlist3.action';</script>");
		}
		
		
		
		
		//跳转到查看商品页面
		public String product() {
			HttpServletRequest request = this.getRequest();
			Product bean = productDao.selectBean(" where id= "
					+ request.getParameter("id"));
			bean.setDj(bean.getDj()+1);
			
			productDao.updateBean(bean);
			
			request.setAttribute("bean", bean);
			request.setAttribute("title", "商品详情");
			this.setUrl("product.jsp");
			return SUCCESS;
		}
		
		
		//商品列表
		public String productlist4() {
			HttpServletRequest request = this.getRequest();
			String pname = request.getParameter("pname");
			
			String username = request.getParameter("username");
			
			StringBuffer sb = new StringBuffer();
			sb.append(" where ");

			if (pname != null && !"".equals(pname)) {

				sb.append("pname like '%" + pname + "%'");
				sb.append(" and ");
				request.setAttribute("pname", pname);
			}
			
			if (username != null && !"".equals(username)) {

				sb.append(" user.username like '%" + username + "%'");
				sb.append(" and ");
				request.setAttribute("username", username);
			}
		
			
			sb.append("   deletestatus=0  order by id desc ");
			String where = sb.toString();


			int currentpage = 1;
			int pagesize = 10;
			if (request.getParameter("pagenum") != null) {
				currentpage = Integer.parseInt(request.getParameter("pagenum"));
			}
			int total = productDao.selectBeanCount(where.replaceAll("order by id desc", ""));
			request.setAttribute("list", productDao.selectBeanList((currentpage - 1)
					* pagesize, pagesize, where));
			request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
					currentpage, "productmethod!productlist4.action", "共有" + total + "条记录"));
			request.setAttribute("url", "productmethod!productlist4.action");
			request.setAttribute("url2", "productmethod!product");
			request.setAttribute("title", "商品管理");
			this.setUrl("manage/product/productlist4.jsp");
			return SUCCESS;

		}
		
		
		//删除商品操作
		public void productdelete4() throws IOException {
			HttpServletRequest request = this.getRequest();
			PrintWriter writer =  this.getPrintWriter();
			
			Product bean = productDao.selectBean(" where id= "
					+ request.getParameter("id"));
			bean.setDeletestatus(1);
			productDao.updateBean(bean);
			
			writer.print("<script language=javascript>alert('操作成功');window.location.href='productmethod!productlist4.action';</script>");
		}
		
}
