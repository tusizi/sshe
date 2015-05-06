package sy.service.impl;

import java.util.Date;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sy.dao.UserDaoI;
import sy.model.Tuser;
import sy.pageModel.User;
import sy.service.UserServiceI;
import sy.util.Encrypt;

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
	public void save(User user) {
		
		Tuser t=new Tuser();
//		t.setName(user.getName());
//		t.setPwd(user.getPwd());
		BeanUtils.copyProperties(user, t, new String[]{"pwd"});
		t.setId(UUID.randomUUID().toString());		
		t.setCreatetime(new Date());
		t.setPwd(Encrypt.e(user.getPwd()));
		userDao.save(t);
	}



}
