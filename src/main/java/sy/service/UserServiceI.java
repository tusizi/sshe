package sy.service;

import sy.pageModel.DataGrid;
import sy.pageModel.User;


public interface UserServiceI {

	public User save(User user);
	public User login(User user);
	public void remove(String ids);
	public DataGrid dataGrid(User user);
	public User edit(User user);
	
}
