package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


//评价
@Entity
@Table(name="t_Pingjia")
public class Pingjia {

	@Id
	@GeneratedValue
	private int id;//主键
	
	@ManyToOne
	@JoinColumn(name="fromuserid")
	private User fromuser;//评价的用户，外键
	
	@ManyToOne
	@JoinColumn(name="touserid")
	private User touser;//被评价的用户，外键
	
	@ManyToOne
	@JoinColumn(name="productid")
	private Product product;//评价的商品
	
	@ManyToOne
	@JoinColumn(name="dingdanid")
	private Dingdan dingdan;//关联的订单，外键
	
	@Column(name="pneirong", columnDefinition="TEXT")
	private String pneirong;//评价内容
	
	private String shijian;//评价时间

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getFromuser() {
		return fromuser;
	}

	public void setFromuser(User fromuser) {
		this.fromuser = fromuser;
	}

	public User getTouser() {
		return touser;
	}

	public void setTouser(User touser) {
		this.touser = touser;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Dingdan getDingdan() {
		return dingdan;
	}

	public void setDingdan(Dingdan dingdan) {
		this.dingdan = dingdan;
	}

	public String getPneirong() {
		return pneirong;
	}

	public void setPneirong(String pneirong) {
		this.pneirong = pneirong;
	}

	public String getShijian() {
		return shijian;
	}

	public void setShijian(String shijian) {
		this.shijian = shijian;
	}
	
	
	
	
	
	
	
	
}
