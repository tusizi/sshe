package sy.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sy.dao.BaseDaoI;
import sy.model.Tuser;
import sy.pageModel.DataGrid;
import sy.pageModel.User;
import sy.service.UserServiceI;
import sy.util.Encrypt;

@Service(value = "userService")
public class UserServiceImpl implements UserServiceI {

	private static final Logger logger = Logger.getLogger(UserServiceImpl.class);

	private BaseDaoI<Tuser> userDao;

	public BaseDaoI<Tuser> getUserDao() {
		return userDao;
	}

	@Autowired
	public void setUserDao(BaseDaoI<Tuser> userDao) {
		this.userDao = userDao;
	}

	@Override
	public void save(User user) {

		Tuser t = new Tuser();
		// t.setName(user.getName());
		// t.setPwd(user.getPwd());
		BeanUtils.copyProperties(user, t, new String[] { "pwd" });
		t.setId(UUID.randomUUID().toString());
		t.setCreatetime(new Date());
		t.setPwd(Encrypt.e(user.getPwd()));
		userDao.save(t);
	}

	@Override
	public User login(User user) {
		// Tuser t = userDao.get("from Tuser t where t.name='" + user.getName()+"'and t.pwd='" + Encrypt.e(user.getPwd()) + "' ");
		// Tuser t = userDao.get("from Tuser t where t.name=? and t.pwd=? ",new Object[]{user.getName(),Encrypt.e(user.getPwd())});
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", user.getName());
		params.put("pwd", Encrypt.e(user.getPwd()));
		Tuser t = userDao.get("from Tuser t where t.name=:name and t.pwd=:pwd ", params);
		if (t != null) {
			return user;
		}
		return null;
	}

	@Override
	public DataGrid dataGrid(User user) {
		DataGrid dg = new DataGrid();
		String hql = "from Tuser t";
		Map<String, Object> params = new HashMap<String, Object>();
		hql = addWhere(user, hql, params);
		String totalHql = "select count(*)" + hql;
		hql = addOrder(user, hql);
		List<Tuser> l = userDao.find(hql, params, user.getPage(), user.getRows());// 这个Tuser为什么不用new
		List<User> nl = new ArrayList<User>();
		changeModel(l, nl);
		dg.setTotal(userDao.count(totalHql, params));
		dg.setRows(nl);
		return dg;
	}

	private void changeModel(List<Tuser> l, List<User> nl) {
		if (l != null && l.size() > 0) {
			for (Tuser t : l) {
				User u = new User();
				BeanUtils.copyProperties(t, u);
				nl.add(u);
			}
		}
	}

	private String addOrder(User user, String hql) {
		if (user.getSort() != null) {
			hql += "order by" + user.getSort() + " " + user.getOrder();
		}
		return hql;
	}

	private String addWhere(User user, String hql, Map<String, Object> params) {
		if (user.getName() != null && !user.getName().trim().equals("")) {
			hql += "where t.name like :name";
			params.put("name", "%%" + user.getName().trim() + "%%");
		}
		return hql;
	}

}
