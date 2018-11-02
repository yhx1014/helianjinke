package org.ht.service.impl;

import org.ht.dao.InvestInfoDao;
import org.ht.pojo.InvestInfo;
import org.ht.service.InvestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvestServiceImpl implements InvestService {

    @Autowired
    private InvestInfoDao investInfoDao;

    @Override
    public List<InvestInfo> getAll() {
        return investInfoDao.getAll();
    }
}
