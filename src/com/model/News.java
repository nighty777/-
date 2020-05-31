package com.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
//新闻
@Entity
@Table(name="t_News")
public class News {

	@Id
	@GeneratedValue
	private int id;
	
	private int deletestatus;//是否删除的标志，0表示正常，1表示删除
	
	private String ntitle;//新闻标题
	
	@Column(name="content", columnDefinition="TEXT")
	private String content;//新闻内容
	
	private String ctime;//添加时间

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

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	
	
	
	
	
	
}
