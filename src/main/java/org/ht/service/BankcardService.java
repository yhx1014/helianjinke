package org.ht.service;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Approveitem;
import org.ht.pojo.Bankcard;

public interface BankcardService {
	Map<String, Object> selectbc(String currpge,Map<String, Object> findmap);
}
