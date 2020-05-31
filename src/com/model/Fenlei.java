package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
//商品分类
@Entity
@Table(name="t_Fenlei")
public class Fenlei {

	@Id
	@GeneratedValue
	private int id;
	
	private int deletestatus;//是否删除的标志，0表示正常，1表示删除
	
	private String fname;//商品分类名

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

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
	
	
	
	
	
}
