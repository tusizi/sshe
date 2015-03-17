package sy.service.impl;

import java.io.Serializable;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sy.dao.UserDaoI;
import sy.model.User;
import sy.service.UserServiceI;

@Service(value="userService")
public class UserServiceImpl implements UserServiceI {
	
	private static final Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	private UserDaoI userDao;
	
	public UserDaoI getUserDao() {
		return userDao;
	}

	@Autowired//注入userDao 对象也已经new出来了
	public void setUserDao(UserDaoI userDao) {
		this.userDao = userDao;
	}


	@Override
	public void test() {
		logger.info("进入测试");

	}

	@Override
	public Serializable save(User user) {
		
		return userDao.save(user);
	}

}
