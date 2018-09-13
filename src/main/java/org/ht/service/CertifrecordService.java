package org.ht.service;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Certifrecord;

public interface CertifrecordService {

	public List<Certifrecord> queryCertifrecord(Map<String, Object> map);

	public int updateCertifrecord(Map<String, Object> map);

	public int addCertifrecord(Map<String, Object> map);
}
