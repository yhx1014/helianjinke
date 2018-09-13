package org.ht.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.ht.pojo.Borrowmoney;

public interface BaseDao<ID extends Object, Domain extends Object> {

	/**
	 * 根据ID查询
	 *
	 * @param id
	 * @param vp
	 * @return
	 */
	Domain get(@Param("id") ID id);

	/**
	 * 删除
	 *
	 * @param id
	 * @param vp
	 */
	int delete(@Param("id") ID id);

	/**
	 * 分页查询
	 *
	 * @param pagination
	 * @param params
	 * @param <V>
	 * @return
	 */
	public List<Borrowmoney> findListByPage(Map<String, Object> map);

	<V> List<Domain> findList(@Param("params") Map<String, V> params);

	/**
	 * 保存
	 *
	 * @param domain
	 */
	int create(Domain domain);

	/**
	 * 更新
	 *
	 * @param domain
	 */
	int update(Domain domain);

}
