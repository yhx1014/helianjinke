package org.ht.dao;

import java.util.List;
import java.util.Map;
import org.ht.pojo.Dope;

public interface DopeDao {
	int insert(Dope dope);
	public List<Dope> findDope(Map<String, Object> map);
	public List<?> total();
	public void batchDeletes(Integer did);
}
