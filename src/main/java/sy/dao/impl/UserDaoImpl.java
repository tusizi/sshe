package sy.dao.impl;

import org.springframework.stereotype.Repository;

import sy.dao.UserDaoI;
import sy.model.Tuser;

	@Repository("userDao")//交给spring管理
public class UserDaoImpl extends BaseDaoImpl<Tuser> implements UserDaoI {
	
}
