package sy.dao;

import java.io.Serializable;

public interface BaseDaoI<T> {

	public Serializable save (T O);
	
	public T get(String hql);
	public T get(String hql, Object[] params);
}
