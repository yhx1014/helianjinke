package org.ht.dao;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Certifrecord;

public interface CertifrecordDao extends BaseDao<Object, Object> {

	public List<Certifrecord> queryCertifrecord(Map<String, Object> map);

	public int updateCertifrecord(Map<String, Object> map);

	public int addCertifrecord(Map<String, Object> map);

}
