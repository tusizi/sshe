package sy.dao.impl;

import java.io.Serializable;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sy.dao.UserDaoI;
import sy.model.User;

	@Repository("userDao")//交给spring管理
public class UserDaoImpl implements UserDaoI {
	
	private SessionFactory sessionFactory;  
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}


	@Autowired//将sessionFactory注入
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}



	@Override//覆盖
	public Serializable save(User user) {
		return this.sessionFactory.getCurrentSession().save(user);
	}

}
