package org.ht.service;

import java.util.List;

import org.ht.pojo.Details;

public interface DetailsService {

	public List<Details> detailslist(Integer pid);

	int delete(Integer id);
	void deleteByPid(Integer id);
	int create(Details details);

	Details get(Integer id);

	int update(Details record);

	 
}
