package org.ht.service.impl;

import java.util.List;
import java.util.Map;

import org.ht.dao.BiaoMapperDao;
import org.ht.pojo.Biao;
import org.ht.service.BiaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BiaoServiceImpl implements BiaoService {

	@Autowired
	BiaoMapperDao dao;

	@Override
	public Biao get(Integer id) {
		// TODO Auto-generated method stub
		return dao.get(id);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public int create(Biao record) {
		// TODO Auto-generated method stub
		return dao.create(record);
	}

	@Override
	public int update(Biao record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}

	@Override
	public List<Biao> findList(Map<String, Object> map) {
		List<Biao> borrowmoneys = dao.findList(map);
		return borrowmoneys;
	}
}
