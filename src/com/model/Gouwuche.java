package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


//购物车
@Entity
@Table(name="t_Gouwuche")
public class Gouwuche {

	@Id
	@GeneratedValue
	private int id;//主键
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;//关联的用户，外键
	
	@ManyToOne
	@JoinColumn(name="productid")
	private Product product;//关联的商品，外键
	
	private double jiage;//价格
	
	private int shuliang;//购买数量

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public int getShuliang() {
		return shuliang;
	}

	public void setShuliang(int shuliang) {
		this.shuliang = shuliang;
	}

	
	
	


	
	
	
}
