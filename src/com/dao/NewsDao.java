package com.dao;

import java.util.List;

import com.model.News;




public interface NewsDao  {
	
	
	
	public void insertBean(News bean);
	
	public void deleteBean(News bean);
	
	public void updateBean(News bean);

	public News selectBean(String where);
	
	public List<News> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
