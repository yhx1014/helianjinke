package org.ht.service;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Trade;


public interface TradeService {
	Map<String, Object> selecttd(String currpge,Map<String, Object> findmap);
	boolean addDate(Trade td);
	List<Trade> selectMoney(Integer uid);
}
