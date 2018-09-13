package org.ht.dao;

import java.util.List;

import org.ht.pojo.Borrowmoney;
import org.ht.pojo.Details;

public interface DetailsDao extends  BaseDao<Object, Details>  {
	public List<Details> detailslist(Integer ids);

	public void detailsadd(Details notice);
	
	public Details detailsget(Integer ids);
	
	public void detailsdel(Integer ids);
	public void deleteByPid(Integer pid);
	
	/*


	public void detailsupd(Details notice);

	*/

}
