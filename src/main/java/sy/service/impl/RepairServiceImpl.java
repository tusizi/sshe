package sy.service.impl;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sy.dao.BaseDaoI;
import sy.model.Tmenu;
import sy.service.RepairServiceI;
@Service("repairService")
public class RepairServiceImpl implements RepairServiceI {
	private BaseDaoI<Tmenu> menuDao;

	public BaseDaoI<Tmenu> getMenuDao() {
		return menuDao;
	}

	@Autowired
	public void setMenuDao(BaseDaoI<Tmenu> menuDao) {
		this.menuDao = menuDao;
	}
	@Override
	public void repair() {
		Tmenu root = new Tmenu();
		root.setId(UUID.randomUUID().toString());
		root.setText("首页");
		root.setUrl("");
		menuDao.saveOrUpdate(root);
		
	}

}
