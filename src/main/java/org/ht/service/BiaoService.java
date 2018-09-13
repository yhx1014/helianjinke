package org.ht.service;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Biao;
import org.ht.pojo.Borrowmoney;

import com.github.pagehelper.PageInfo;

public interface BiaoService {

	public List<Biao> findList(Map<String, Object> map);

	int delete(Integer id);

	int create(Biao biao);

	Biao get(Integer id);

	int update(Biao biao);
}
