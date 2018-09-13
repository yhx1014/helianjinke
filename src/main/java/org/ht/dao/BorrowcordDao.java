package org.ht.dao;

import java.util.List;

import org.ht.pojo.Borrowcord;

public interface BorrowcordDao {
	
	public List<Borrowcord> selborr (Integer wid);
	
	
	public void updborr (Integer wid);
	
	
	public void borradd (Borrowcord borrowcord);

	
}
