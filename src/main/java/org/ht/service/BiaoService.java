package org.ht.service;

import java.util.List;
import java.util.Map;
import org.ht.pojo.Biao;

public interface BiaoService {

	public List<Biao> findList(Map<String, Object> map);

	int delete(Integer id);

	int create(Biao biao);

	Biao get(Integer id);

	int update(Biao biao);
}
