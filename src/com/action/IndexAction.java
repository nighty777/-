package com.action;


import javax.servlet.http.HttpServletRequest;
import com.dao.ProductDao;
import com.util.Pager;








public class IndexAction extends BaseAction {

	private static final long serialVersionUID = -4304509122548259589L;
	
	
	private ProductDao productDao;
	

	
	public ProductDao getProductDao() {
		return productDao;
	}




	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}




	//网站首页
	public String index() throws Exception{
		HttpServletRequest request = this.getRequest();
		
		String fid = request.getParameter("fid");
	
		String pname = request.getParameter("pname");
		
		String tuijian = request.getParameter("tuijian");
		
		String paixu = request.getParameter("paixu");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (pname != null && !"".equals(pname)) {

			sb.append("pname like '%" + pname + "%'");
			sb.append(" and ");
			request.setAttribute("pname", pname);
		}
		
		if (fid != null && !"".equals(fid)) {

			sb.append("fenlei.id= "+fid);
			sb.append(" and ");
			request.setAttribute("fid", pname);
		}
		
		if (tuijian != null && !"".equals(tuijian)) {

			sb.append("tuijian='已推荐'");
			sb.append(" and ");
			request.setAttribute("fid", pname);
		}
		
		String where = sb.toString();
		
		String where2 = "";
		
		if("1".equals(paixu)){
			sb.append("   deletestatus=0  order by xl desc ");
			where = sb.toString();
			where2 = where.replaceAll("order by xl desc", "");
		}else if("2".equals(paixu)){
			sb.append("   deletestatus=0  order by dj desc ");
			where = sb.toString();
			where2 = where.replaceAll("order by dj desc", "");
		}else{
			sb.append("   deletestatus=0  order by id desc ");
			where = sb.toString();
			where2 = where.replaceAll("order by id desc", "");
		}
		
		
		


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = productDao.selectBeanCount(where2);
		request.setAttribute("list", productDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, ".", "共有" + total + "条记录"));
		
		

	
		
		
		return "success";
	}
	
	
		
		
		
		
}
