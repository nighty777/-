package com.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//订单
@Entity
@Table(name="t_Dingdan")
public class Dingdan {
	
	@Id
	@GeneratedValue
	private int id;//主键
	
	private int deletestatus;//订单是否删除状态 0表示未删除 1表示删除  

	private String status;// 订单状态 处理中  已取消  已发货
	 
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;//关联买家的id 外键
	
	@ManyToOne
	@JoinColumn(name="productid")
	private Product product;//关联的商品，外键

	private String orderid;//订单号
	
	private String sjname;//收货人姓名
	
	private String address;//收货人地址
	
	private String phone;//收货人手机
	
	@Column(name="beizhu", columnDefinition="TEXT")
	private String beizhu;//备注

	private String createtime;//生成时间
	
	private double jiage;//购买单价
	
	private int sl;//购买数量
	
	private double zongjia;//总价
	
	private String payway;//支付方式
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDeletestatus() {
		return deletestatus;
	}

	public void setDeletestatus(int deletestatus) {
		this.deletestatus = deletestatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getSjname() {
		return sjname;
	}

	public void setSjname(String sjname) {
		this.sjname = sjname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public double getZongjia() {
		return zongjia;
	}

	public void setZongjia(double zongjia) {
		this.zongjia = zongjia;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public double getJiage() {
		return jiage;
	}

	public void setJiage(double jiage) {
		this.jiage = jiage;
	}

	public int getSl() {
		return sl;
	}

	public void setSl(int sl) {
		this.sl = sl;
	}

	public String getPayway() {
		return payway;
	}

	public void setPayway(String payway) {
		this.payway = payway;
	}

	
	
	
	
	


	
}
