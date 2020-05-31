package com.dao.impl;

import java.sql.SQLException;
import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.dao.NewsDao;
import com.model.News;











public class NewsDaoImpl extends HibernateDaoSupport implements  NewsDao{


	public void deleteBean(News bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(News bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public News selectBean(String where) {
		List<News> list = this.getHibernateTemplate().find("from News " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from News "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<News> selectBeanList(final int start,final int limit,final String where) {
		return (List<News>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<News> list = session.createQuery("from News "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(News bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
}
