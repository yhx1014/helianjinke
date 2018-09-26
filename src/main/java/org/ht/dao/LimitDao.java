package org.ht.dao;

import java.util.List;
import org.ht.pojo.Limi;

public interface LimitDao {
	public List<?> limitByeid(int eid);
	public boolean limitdel(Integer eid);
	public boolean limitadd(Limi limi);
}
