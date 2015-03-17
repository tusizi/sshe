package sy.dao;

import java.io.Serializable;

import sy.model.User;

public interface UserDaoI {

	public Serializable save(User user);
}
