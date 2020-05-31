package com.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dao.GouwucheDao;
import com.dao.ProductDao;
import com.model.Gouwuche;
import com.model.Product;
import com.model.User;
import com.util.Arith;


public class GouwucheAction extends BaseAction {

	private static final long serialVersionUID = -4304509122548259589L;

	
	
	private GouwucheDao gouwucheDao;

	
	public GouwucheDao getGouwucheDao() {
		return gouwucheDao;
	}
	public void setGouwucheDao(GouwucheDao gouwucheDao) {
		this.gouwucheDao = gouwucheDao;
	}
	
	
	private ProductDao productDao;
	

	public ProductDao getProductDao() {
		return productDao;
	}
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
		//加入购物车操作
		public void gouwucheadd2() throws IOException {
			HttpServletRequest request = this.getRequest();
			PrintWriter writer =  this.getPrintWriter();
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if (user == null) {
				writer.print("<script  language='javascript'>alert('请先登录');window.location.href='usermethod!login3.action';</script>");
				return  ;
			}
			
			Product pro = productDao.selectBean(" where id= "+request.getParameter("pid"));
			
			if(pro.getUser().getId()==(user.getId())){
				writer.print("<script  language='javascript'>alert('不能购买自己发布的商品');window.location.href='productmethod!product.action?id="+pro.getId()+"';</script>");
				return  ;
			}
			
			
			if(pro.getKc()<=0){
				writer.print("<script  language='javascript'>alert('商品库存不足，购买失败');window.location.href='productmethod!product.action?id="+pro.getId()+"';</script>");
				return  ;
			}
			
			Gouwuche bean = gouwucheDao.selectBean(" where user.id="+user.getId()+" and product.id="+pro.getId()+" ");
			if(bean!=null){
				writer.print("<script  language='javascript'>alert('该商品已经添加到购物车，请勿重复添加');window.location.href='productmethod!product.action?id="+pro.getId()+"';</script>");
				return  ;
			}
			bean = new Gouwuche();
			bean.setJiage(pro.getJiage());
			
			bean.setShuliang(1);
			
			bean.setProduct(pro);
			
			bean.setUser(user);
			
			
			gouwucheDao.insertBean(bean);
			
			
			writer.print("<script language=javascript>alert('操作成功');window.location.href='productmethod!product.action?id="+pro.getId()+"';</script>");
		}
	
	
		//我的购物车列表
		public String gouwuchelist() {
			HttpServletRequest request = this.getRequest();
			
			
			
			StringBuffer sb = new StringBuffer();
			sb.append(" where ");

			
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");

			sb.append("   user.id="+user.getId()+"   order by id desc ");
			String where = sb.toString();

			List<Gouwuche> list = gouwucheDao.selectBeanList(0, 100, where);

			double zongjia = 0;
			for(Gouwuche bean:list){
				zongjia = Arith.add(zongjia, Arith.mul(bean.getJiage(), bean.getShuliang()));
			}
			
			request.setAttribute("list", list);
			
			request.setAttribute("zongjia", zongjia);
	
			request.setAttribute("url", "gouwuchemethod!gouwuchelist.action");
			request.setAttribute("url2", "gouwuchemethod!gouwuche");
			request.setAttribute("title", "我的购物车");
			this.setUrl("gouwuchelist.jsp");
			return SUCCESS;

		}
		

		//修改购买数量操作
			public void gouwucheupdate2() throws IOException {
				HttpServletRequest request = this.getRequest();
				PrintWriter writer =  this.getPrintWriter();
				
				String sl = request.getParameter("sl");
				
				Gouwuche bean = gouwucheDao.selectBean(" where id= "
						+ request.getParameter("id"));
				
				if(bean.getProduct().getKc()<Integer.parseInt(sl)){
					
					writer.print("<script language=javascript>alert('操作失败，库存数量不足');window.location.href='gouwuchemethod!gouwuchelist.action';</script>");
					
					return ;
					
				}
				
				bean.setShuliang(Integer.parseInt(sl));
				
				gouwucheDao.updateBean(bean);
				
				writer.print("<script language=javascript>alert('操作成功');window.location.href='gouwuchemethod!gouwuchelist.action';</script>");
				
			}
		
			
			//取消购买操作
			public void gouwuchedelete() throws IOException {
				HttpServletRequest request = this.getRequest();
				PrintWriter writer =  this.getPrintWriter();
				
				Gouwuche bean = gouwucheDao.selectBean(" where id= "
						+ request.getParameter("id"));
				
				gouwucheDao.deleteBean(bean);
				
				writer.print("<script language=javascript>alert('操作成功');window.location.href='gouwuchemethod!gouwuchelist.action';</script>");
			}
		
		
	
	
	
	
}
