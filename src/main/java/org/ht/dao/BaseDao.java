package org.ht.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.ht.pojo.Borrowmoney;

public interface BaseDao<ID extends Object, Domain extends Object> {

	Domain get(@Param("id") ID id);
	int delete(@Param("id") ID id);
	public List<Borrowmoney> findListByPage(Map<String, Object> map);
	<V> List<Domain> findList(@Param("params") Map<String, V> params);
	int create(Domain domain);
	int update(Domain domain);

}
