package org.ht.service;

import java.util.List;

import org.ht.pojo.Borrowcord;

public interface BorrowcordService {
	public List<Borrowcord> selborr(Integer wid);

	public void updborr(Integer wid);

	public void borradd(String yss, Integer beyid, String fangshi);
}
